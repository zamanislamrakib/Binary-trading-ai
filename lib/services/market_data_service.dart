import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketDataService {
  final String _apiKey = 'YOUR_FINNHUB_API_KEY';
  final String _baseUrl = 'https://finnhub.io/api/v1';

  Future<double?> getForexRate(String symbol) async {
    final url = Uri.parse('$_baseUrl/quote?symbol=$symbol&token=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['c']; // Current price
    } else {
      print('Failed to load Forex rate');
      return null;
    }
  }

  Future<double?> getCryptoPrice(String symbol) async {
    // Example: BINANCE:BTCUSDT
    final url = Uri.parse('$_baseUrl/quote?symbol=$symbol&token=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['c']; // Current price
    } else {
      print('Failed to load Crypto price');
      return null;
    }
  }

  Future<double?> getStockPrice(String symbol) async {
    // Example: AAPL, TSLA
    final url = Uri.parse('$_baseUrl/quote?symbol=$symbol&token=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['c'];
    } else {
      print('Failed to load Stock price');
      return null;
    }
  }
}
