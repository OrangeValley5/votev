import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 280,
              child: Image.asset('lib/images/handshake.png')),
          const Text(
            "Your web3 mining tutor",
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text(
            "Instantly convert your crypto to cash without any stress or hassle",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 189, 189, 189)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
