import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // Import the package for clipboard

class Friendz extends StatefulWidget {
  const Friendz({Key? key}) : super(key: key);

  @override
  State<Friendz> createState() => _FriendzState();
}

class _FriendzState extends State<Friendz> {
  List<String> invitedFriends = [];
  String? referralCode;

  @override
  void initState() {
    super.initState();
    _loadReferralCode();
  }

  Future<void> _loadReferralCode() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail');

    if (email != null) {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email).get();
      setState(() {
        referralCode = userDoc['referralCode'];
      });
      _loadInvitedFriends();
    }
  }

  Future<void> _loadInvitedFriends() async {
    if (referralCode != null) {
      final invitedFriendsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('referrer', isEqualTo: referralCode)
          .get();

      setState(() {
        invitedFriends = invitedFriendsSnapshot.docs
            .map((doc) => doc['email'] as String)
            .toList();
      });
    }
  }

  void _copyReferralCode() {
    if (referralCode != null) {
      Clipboard.setData(ClipboardData(text: referralCode));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Referral code copied to clipboard!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Invite Friends',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Earn 20% for your direct referrals, 10% for their referrals, then 5%, 2.5%, and 1.25% for your fifth-level referrals. Plus earn up to 25,000 VORTEX for each invite, while your friend receives 30,000!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 50,
            ),
            if (referralCode != null)
              Container(
                width: 180,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 8, left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 69, 255, 100)
                      .withOpacity(0.2), // Adjust opacity here
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$referralCode',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 8, 255, 70),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.copy,
                        color: Color.fromARGB(255, 8, 255, 70),
                        size: 14,
                      ),
                      onPressed: _copyReferralCode,
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/bolts.png',
                  width: 20,
                  height: 20,
                ),
                Text(
                  '${invitedFriends.length}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Text(
                ' Friends  Invited',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 25, 25, 25)),
                child: ListView.builder(
                  itemCount: invitedFriends.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        invitedFriends[index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
