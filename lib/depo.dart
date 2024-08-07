import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Depo extends StatefulWidget {
  const Depo({Key? key}) : super(key: key);

  @override
  State<Depo> createState() => _DepoState();
}

final String textToCopy = 'bc1qr3cd3lml75fxy64s7hdr0xagmrjnma5zpkdqmg';

class _DepoState extends State<Depo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
                    color: const Color(0xFF262626)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '0x3f7832693e244208f7786ef6c7e474692dbd078e',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: textToCopy),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Address copied to clipboard!'),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.copy,
                        size: 14,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 8, left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 69, 255, 100)
                      .withOpacity(0.2), // Adjust opacity here
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Make sure you deposit your tokens to the right address and network',
                      style: TextStyle(
                          color: Color.fromARGB(255, 8, 255, 70),
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
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
                    color: Color(0xFF262626)),
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
                                    color: Color(0xFF909090), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'lib/images/usdt2.png',
                              width: 35,
                              height: 35,
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
                          color: Color(0xFF3A3A3A)),
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
                              color: Color(0xFF262626),
                              border: Border.all(
                                  color: Color(0xFF363636), width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 220,
                          child: Column(
                            children: const [
                              Text(
                                'Send coins to the wallet above in order to receive them here',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11),
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
                              color: const Color(0xFF262626),
                              border: Border.all(
                                  color: const Color(0xFF363636), width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 220,
                          child: Column(
                            children: const [
                              Text(
                                'Go to any exchange of your choice. Choose withdraw and find this network',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11),
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
                              color: const Color(0xFF262626),
                              border: Border.all(
                                  color: const Color(0xFF363636), width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '3',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 220,
                          child: Column(
                            children: const [
                              Text(
                                'Paste the copied address above and click send. Confirm the transaction',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
