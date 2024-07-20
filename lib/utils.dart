// currency_conversion_util.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConversionUtil {
  static Future<double> fetchUsdtToUsdRate() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=tether&vs_currencies=usd'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['tether']['usd'].toDouble();
      } else {
        throw Exception('Failed to fetch exchange rate');
      }
    } catch (e) {
      print('Error fetching exchange rate: $e');
      return 0.0;
    }
  }

  static String calculateDollarEquivalent(double amount, double rate) {
    return (amount * rate).toStringAsFixed(2);
  }
}
