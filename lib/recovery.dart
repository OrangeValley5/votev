import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:votev/connects.dart';

class Recovery extends StatefulWidget {
  const Recovery({Key? key}) : super(key: key);

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  List<String> words = [
    "Hungry",
    "Change",
    "Spark",
    "Wonder",
    "Dream",
    "Energy",
    "Power",
    "Magic",
    "Vision",
    "Future",
    "Bright",
    "Hope",
    "Joy",
    "Peace",
    "Calm",
    "Relax",
    "Love",
    "Trust",
    "Brave",
    "Strong",
    "Bold",
    "Wise",
    "Happy",
    "Light"
  ];

  List<String> selectedWords = [];

  @override
  void initState() {
    super.initState();
    _loadSavedWords();
  }

  Future<void> _generateRandomWords() async {
    final random = Random();
    selectedWords = List.from(words);
    selectedWords.shuffle(random);
    selectedWords = selectedWords.sublist(0, 12); // Select the first 12 words
    setState(() {});
  }

  Future<void> _loadSavedWords() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedWords = prefs.getStringList('savedWords');
    if (savedWords != null && savedWords.isNotEmpty) {
      setState(() {
        selectedWords = savedWords;
      });
    } else {
      await _generateRandomWords();
    }
  }

  Future<void> _saveWords() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('savedWords', selectedWords);

// ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Connets(),
      ),
    );
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: selectedWords.join(' ')));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Words copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 25, top: 30, right: 25),
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Secret recovery phrase',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'This phrase is a really important combination of words that will help you recover your wallet if you’re logged out or lose your device',
              style: TextStyle(
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontSize: 11,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                for (int i = 0; i < 6; i++) ...[
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 52, 52, 52)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  selectedWords.isNotEmpty
                                      ? selectedWords[i * 2]
                                      : '',
                                  style: const TextStyle(
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
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(255, 52, 52, 52)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  selectedWords.isNotEmpty
                                      ? selectedWords[i * 2 + 1]
                                      : '',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _copyToClipboard,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 10, right: 8, left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(1), // Adjust opacity here
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.copy,
                              size: 12,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Copy to clipboard',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, right: 8, left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 255, 69, 69)
                        .withOpacity(0.2), // Adjust opacity here
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Make sure you deposit your tokens to the right address and network',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 8, 8),
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    await _saveWords();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Words saved successfully')),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, right: 8, left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 69, 255, 100)
                          .withOpacity(1), // Adjust opacity here
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Save',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
