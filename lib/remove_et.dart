import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoveEt extends StatefulWidget {
  const RemoveEt({Key? key}) : super(key: key);

  @override
  State<RemoveEt> createState() => _RemoveEtState();
}

class _RemoveEtState extends State<RemoveEt> {
  TextEditingController _ethController = TextEditingController();
  String _dollarEquivalent = "0.00";
  double _ethToUsdRate = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchEthToUsdRate();
    _ethController.addListener(_updateDollarEquivalent);
  }

  Future<void> _fetchEthToUsdRate() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _ethToUsdRate = data['ethereum']['usd'].toDouble();
        });
      } else {
        throw Exception('Failed to fetch exchange rate');
      }
    } catch (e) {
      print('Error fetching exchange rate: $e');
    }
  }

  void _updateDollarEquivalent() {
    final ethAmount = double.tryParse(_ethController.text) ?? 0.0;
    setState(() {
      _dollarEquivalent = (ethAmount * _ethToUsdRate).toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    _ethController.dispose();
    super.dispose();
  }

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
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                Text(
                  'Address',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                style: const TextStyle(fontSize: 12, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter wallet address',
                  enabledBorder:
                      InputBorder.none, // Remove underline when enabled
                  focusedBorder:
                      InputBorder.none, // Remove underline when focused
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 203, 203, 203)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Amount',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Available: 0.00 ETH',
                  style: TextStyle(
                      color: Color.fromARGB(255, 175, 175, 175), fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _ethController,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  enabledBorder:
                      InputBorder.none, // Remove underline when enabled
                  focusedBorder:
                      InputBorder.none, // Remove underline when focused
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 203, 203, 203)),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Dollar Equivalent: \$$_dollarEquivalent',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 185, 185), fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 8),
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
              height: 100,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 8, left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 69, 255, 100)
                      .withOpacity(1), // Adjust opacity here
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Withdraw',
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
        ),
      ),
    );
  }
}
