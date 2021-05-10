import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/data/dto/bitcoin_dto.dart';

/// Клиент для работы с биткоинами
class BitcoinClient {

  final http.Client _httpClient;

  BitcoinClient(this._httpClient);

  Future<BitcoinDTO> getCurrentBitcoinCost() async {
    var url = Uri.parse('https://api.binance.com/api/v3/ticker/24hr');
    final response = await _httpClient.get(url);
    if (response.statusCode != 200) throw FormatException('Не удалось выполнить запрос');
    return compute(_decodeResponse, response.body);
  }

}

BitcoinDTO _decodeResponse(String responseBody) {
  List response = jsonDecode(responseBody);
  final lastPrice = response.firstWhere((map) =>
      map['symbol'] == 'BTCUSDT', orElse: () => throw FormatException('Не удалось найти заданный параметр')
  );
  return BitcoinDTO.fromJson(lastPrice);
}