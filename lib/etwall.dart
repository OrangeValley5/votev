import 'package:flutter/material.dart';
import 'package:votev/depo.dart';
import 'package:votev/remove_et.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import the spinkit package
import 'dart:async';
import 'dart:ui';

class Etwall extends StatefulWidget {
  const Etwall({Key? key}) : super(key: key);

  @override
  State<Etwall> createState() => _EtwallState();
}

class _EtwallState extends State<Etwall> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.6, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    scale: _scaleAnimation.value,
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

    // Close the loading dialog after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 25,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 61, 61, 61)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'ETH Balance',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '0.0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            Image.asset(
                              'lib/images/eth2.png',
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                        const Text(
                          '\$0.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Depo(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 52, 52, 52)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/images/up.png',
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Deposit ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showLoadingDialog();
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 52, 52, 52)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/images/down.png',
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Withdraw',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'lib/images/voltscancel.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'No Transactions',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'You are yet to make a transaction. Any transaction made will show up here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
