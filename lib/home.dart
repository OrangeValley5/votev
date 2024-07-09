import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0; // State variable to keep track of the counter

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
                            'Upgrades',
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
                  '$counter', // Display the counter value
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++; // Increment the counter when tapped
                    });
                  },
                  child: Image.asset(
                    'lib/images/tapper.png',
                    width: 150,
                    height: 150,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
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
                        'Upgrade',
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
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Boost',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
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
