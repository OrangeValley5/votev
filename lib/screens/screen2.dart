import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
              child: Image.asset('lib/images/coindrop.png')),
          const Text(
            "Complete exciting task",
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          const Text(
            "Once confirmed funds are settled instantly to your account",
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
