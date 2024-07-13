import 'package:flutter/material.dart';

class Depo extends StatefulWidget {
  const Depo({Key? key}) : super(key: key);

  @override
  State<Depo> createState() => _DepoState();
}

class _DepoState extends State<Depo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                'DEPOSIT ASSET',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/images/usdtbarcode.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 250,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 52, 52, 52)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '0x3f7832693e244208f7786ef6c7e474692dbd078e',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.copy,
                      size: 14,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 52, 52, 52)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Make sure you deposit your tokens to the right address and network',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 52, 52, 52)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'HOW TO SEND ASSET',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Send coins to the wallet above in order to receive them here',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'lib/images/eth.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 67, 67, 67)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Color.fromARGB(255, 43, 43, 43),
                              border: Border.all(
                                  color: Color.fromARGB(255, 22, 255, 34),
                                  width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: Column(
                            children: const [
                              Text(
                                'Send coins to the wallet above in order to receive them here',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Color.fromARGB(255, 43, 43, 43),
                              border: Border.all(
                                  color: Color.fromARGB(255, 22, 255, 34),
                                  width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: Column(
                            children: const [
                              Text(
                                'Send coins to the wallet above in order to receive them here',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Color.fromARGB(255, 43, 43, 43),
                              border: Border.all(
                                  color: Color.fromARGB(255, 22, 255, 34),
                                  width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '3',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 200,
                          child: Column(
                            children: const [
                              Text(
                                'Send coins to the wallet above in order to receive them here',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
