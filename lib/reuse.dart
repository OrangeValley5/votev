import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notifications.dart';
import 'conts.dart';
import 'dart:ui';

class Hume extends StatefulWidget {
  const Hume({Key? key}) : super(key: key);

  @override
  State<Hume> createState() => _HumeState();
}

class _HumeState extends State<Hume>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  int counter = 0;
  int energy = 100; // Initialize energy to 100
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _energyRechargeTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.6,
      upperBound: 1.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _loadCounter();
    _loadEnergy();
    _startEnergyRechargeTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _energyRechargeTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _saveEnergy();
    } else if (state == AppLifecycleState.resumed) {
      _loadEnergy();
    }
  }

  void _incrementCounter() {
    if (energy > 0) {
      setState(() {
        counter++;
        energy--;
      });
      _saveCounter();
      _controller.forward().then((_) {
        _controller.reverse();
      });
    }
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
  }

  Future<void> _loadEnergy() async {
    final prefs = await SharedPreferences.getInstance();
    int savedEnergy = prefs.getInt('energy') ?? 100;
    int lastUpdated =
        prefs.getInt('lastUpdated') ?? DateTime.now().millisecondsSinceEpoch;

    final now = DateTime.now().millisecondsSinceEpoch;
    final elapsed = now - lastUpdated;
    final increment = elapsed ~/ 1000; // Increment energy per second

    setState(() {
      energy = (savedEnergy + increment).clamp(0, 100);
    });
  }

  Future<void> _saveEnergy() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('energy', energy);
    prefs.setInt('lastUpdated', DateTime.now().millisecondsSinceEpoch);
  }

  void _startEnergyRechargeTimer() {
    _energyRechargeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (energy < 100) {
          energy++;
        }
      });
    });
  }

  void _showModal() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Conts();
        });
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            // Loading animation
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  'lib/images/bolts.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        );
      },
    );

    // Close the loading dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      _showModal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vortex',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Notifications(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 74, 74, 74),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.wallet,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Upgrade',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        _showLoadingDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 74, 74, 74),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.leaderboard,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Leaderboard',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/bolts.png',
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      '$counter',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: _incrementCounter,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      'lib/images/tapper.png',
                      width: 220,
                      height: 220,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            'lib/images/upgrade.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '$energy / 100', // Display the current energy
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            'lib/images/bolts.png',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: 60,
                            height: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                backgroundColor:
                                    const Color.fromARGB(255, 102, 102, 102),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 29, 255, 37)),
                                value: energy / 100, // Update the progress
                                minHeight: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
