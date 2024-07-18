import 'package:flutter/material.dart';
import 'package:votev/depo.dart';
import 'package:votev/etwall.dart';
import 'package:votev/voltwall.dart';

class Connets extends StatefulWidget {
  const Connets({Key? key}) : super(key: key);

  @override
  State<Connets> createState() => _ConnetsState();
}

class _ConnetsState extends State<Connets> {
  @override
  void initState() {
    super.initState();
    _showWelcomeDialog();
  }

  void _showWelcomeDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 50, 255, 122),
                  width: 1.0,
                ), // Border color and width
              ),
              backgroundColor: Color.fromARGB(
                  255, 24, 24, 24), // Example of custom background color
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To constrain the height
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        child: Image.asset('lib/images/usdt.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Congratulations !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Yay ! you just earned 10 usdt for joining. We are giving out 10 usdt to the first 1000 players who join the volts telegram game. You can view this in your wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 183, 183, 183),
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Wallet',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: const [
                Text(
                  'Total Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$0.00',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ],
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
                          color: Color.fromARGB(255, 52, 52, 52)),
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
                            'Deposit',
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 52, 52, 52)),
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Voltswall(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 52, 52, 52)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'lib/images/volts.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'VOTEX',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        const Text(
                          '0.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Etwall(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 52, 52, 52)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'lib/images/eth.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'ETHEREUM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        const Text(
                          '0.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
