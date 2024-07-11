import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              alignment: Alignment.center,
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
                          color: Color.fromARGB(255, 61, 61, 61)),
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
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Upgrades',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'lib/images/boltz.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          'Regular Votev',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'x3 tokens every hour',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 218, 218),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                                child: Transform.translate(
                                              offset: const Offset(-4, 0),
                                              child: Image.asset(
                                                'lib/images/bolts.png',
                                                width: 12,
                                                height: 12,
                                              ),
                                            )),
                                            Center(
                                                child: Transform.translate(
                                                    offset: const Offset(-4, 0),
                                                    child: const Text(
                                                      '100',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 10),
                                                    ))),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
