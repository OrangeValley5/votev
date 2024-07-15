import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  List<String> invitedFriends = [];

  @override
  void initState() {
    super.initState();
    _loadInvitedFriends();
  }

  Future<void> _loadInvitedFriends() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      invitedFriends = prefs.getStringList('invitedFriends') ?? [];
    });
  }

  Future<void> _saveInvitedFriends() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('invitedFriends', invitedFriends);
  }

  void _inviteFriend() {
    setState(() {
      final inviteCode = _generateInviteCode();
      invitedFriends.add(inviteCode);
    });
    _saveInvitedFriends();
  }

  String _generateInviteCode() {
    final random = Random();
    final code = List<int>.generate(6, (index) => random.nextInt(10));
    return code.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 255, 37),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: _inviteFriend,
                child: const Text(
                  ' Invite ',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: invitedFriends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Invite Code: ${invitedFriends[index]}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
