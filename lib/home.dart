import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Votex',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                          Text(
                            'Connect wallet',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '47563',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'lib/images/tapper.png',
                  width: 150,
                  height: 150,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Votex',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
