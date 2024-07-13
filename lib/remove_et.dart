import 'package:flutter/material.dart';

class RemoveEt extends StatefulWidget {
  const RemoveEt({Key? key}) : super(key: key);

  @override
  State<RemoveEt> createState() => _RemoveEtState();
}

class _RemoveEtState extends State<RemoveEt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/eth2.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Withdraw ETH',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  enabledBorder:
                      InputBorder.none, // Remove underline when enabled
                  focusedBorder:
                      InputBorder.none, // Remove underline when focused
                  hintStyle: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 203, 203, 203)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
