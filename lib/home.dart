import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notifications.dart';
import 'connects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int counter = 0;
  int farmCounter = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _farmTimer;
  DateTime? _farmStartTime;
  static const Duration farmDuration = Duration(minutes: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.6,
      upperBound: 1.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _loadCounter();
    _loadFarmCounter();
  }

  @override
  void dispose() {
    _controller.dispose();
    _farmTimer?.cancel();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
    _saveCounter();
    _controller.forward().then((_) {
      _controller.reverse();
    });
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

  Future<void> _loadFarmCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      farmCounter = prefs.getInt('farmCounter') ?? 0;
      final startTimeMillis = prefs.getInt('farmStartTime');
      if (startTimeMillis != null) {
        _farmStartTime = DateTime.fromMillisecondsSinceEpoch(startTimeMillis);
        final elapsed = DateTime.now().difference(_farmStartTime!);
        if (elapsed < farmDuration) {
          _startFarmCounter(farmDuration - elapsed);
        } else {
          _farmCounterComplete();
        }
      }
    });
  }

  Future<void> _saveFarmCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('farmCounter', farmCounter);
    if (_farmStartTime != null) {
      prefs.setInt('farmStartTime', _farmStartTime!.millisecondsSinceEpoch);
    }
  }

  void _startFarmCounter(Duration duration) {
    _farmTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        farmCounter++;
      });
      _saveFarmCounter();
      if (DateTime.now().difference(_farmStartTime!) >= farmDuration) {
        _farmCounterComplete();
      }
    });
  }

  void _farmCounterComplete() {
    _farmTimer?.cancel();
    setState(() {
      _farmStartTime = null;
    });
    _saveFarmCounter();
  }

  void _onFarmTapped() {
    if (_farmStartTime == null) {
      setState(() {
        _farmStartTime = DateTime.now();
      });
      _saveFarmCounter();
      _startFarmCounter(farmDuration);
    } else {
      setState(() {
        counter += farmCounter;
        farmCounter = 0;
        _farmStartTime = DateTime.now();
      });
      _saveCounter();
      _saveFarmCounter();
      _startFarmCounter(farmDuration);
    }
  }

  double _getProgress() {
    if (_farmStartTime == null) return 0;
    final totalDuration = farmDuration.inSeconds;
    final elapsedDuration =
        DateTime.now().difference(_farmStartTime!).inSeconds;
    return elapsedDuration / totalDuration;
  }

  void _showModal() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 550,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 27, 27, 27),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 81, 81, 81),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    height: 140,
                    width: 140,
                    child: Image.asset('lib/images/wally.png'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: const Text(
                      "Connect Wallet",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ))
              ],
            ),
          );
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
                  'Votex',
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
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 74, 74, 74),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.wallet,
                              color: Colors.white,
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
                        // _showModal();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connets(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 74, 74, 74),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.wallet,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Connect wallet',
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
                  onTap: () {
                    HapticFeedback
                        .mediumImpact(); // Generates medium haptic feedback
                    _incrementCounter();
                  },
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
                          const Text(
                            '700 / 700',
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                                value: _getProgress(),
                                backgroundColor:
                                    const Color.fromARGB(255, 102, 102, 102),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 29, 255, 37)),
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
                GestureDetector(
                  onTap: () {
                    HapticFeedback
                        .mediumImpact(); // Generates medium haptic feedback
                    _onFarmTapped();
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 195, 255, 175),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Farm',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Image.asset(
                          'lib/images/bolts.png',
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          '$farmCounter',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
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
