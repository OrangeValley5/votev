import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votev/dashboard.dart';
import 'dart:math';
import 'package:votev/refs.dart'; // Import your Friendz page

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkUserEmail();
  }

  Future<void> _checkUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail');
    if (email != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    }
  }

  Future<void> _signUp() async {
    final String email = _emailController.text;
    final String referralCode = _referralController.text;

    if (email.isNotEmpty) {
      final userRef = FirebaseFirestore.instance.collection('users').doc(email);

      // Check if referral code is valid
      if (referralCode.isNotEmpty) {
        final referralSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('referralCode', isEqualTo: referralCode)
            .get();

        if (referralSnapshot.docs.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid referral code')),
          );
          return;
        }
      }

      // Generate a unique referral code for the new user
      final newReferralCode = _generateReferralCode();

      // Save user data to Firestore
      await userRef.set({
        'email': email,
        'referralCode': newReferralCode,
        'referrer': referralCode.isNotEmpty ? referralCode : null,
      });

      // Save user email and referral code in shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', email);
      await prefs.setString('referralCode', newReferralCode);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }

  String _generateReferralCode() {
    final random = Random();
    final code = List<int>.generate(6, (index) => random.nextInt(10));
    return code.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 50, top: 20, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Votex',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nickname',
                  labelStyle: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 133, 133, 133)),
                  enabledBorder:
                      InputBorder.none, // Remove underline when enabled
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _referralController,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Referral Code',
                  labelStyle: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 133, 133, 133)),
                  enabledBorder:
                      InputBorder.none, // Remove underline when enabled
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: _signUp,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 8, left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 69, 255, 100),
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
