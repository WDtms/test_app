import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/data/network/bitcoin_client.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  group('Тест BitcoinClient', () {
    Client client;
    BitcoinClient bitcoinClient;

    String correctResponse = '[{"symbol":"BTCUSDT","priceChange":"0.00135300","priceChangePercent":"2.054","weightedAvgPrice":"0.06722667","prevClosePrice":"0.06586500","lastPrice":"0.06721800","lastQty":"0.03000000","bidPrice":"0.06721700","bidQty":"0.07500000","askPrice":"0.06722400","askQty":"0.35100000","openPrice":"0.06586500","highPrice":"0.06890000","lowPrice":"0.06574200","volume":"303534.61700000","quoteVolume":"20405.62129602","openTime":1620528474005,"closeTime":1620614874005,"firstId":261080933,"lastId":261562459,"count":481527}]';

    setUp(() {
      client = MockHttpClient();
      bitcoinClient = BitcoinClient(client);
    });

    group('Получение текущей стоимости биткоина', () {
      test('Удачное получение', () async {
        when(client.get(any)).thenAnswer((_) => Future.value(Response(correctResponse, 200)));
        final response = await bitcoinClient.getCurrentBitcoinCost();

        expect(response.runtimeType, BitcoinDTO);
        verify(client.get(any));
      });

      test('Неудача при получении', () async {
        when(client.get(any)).thenAnswer((_) => Future.value(Response(correctResponse, 400)));
        expect(() async => await bitcoinClient.getCurrentBitcoinCost(), throwsA(isA<FormatException>()));
      });

      test('Не найдено нужное поле', () async {
        when(client.get(any)).thenAnswer((_) => Future.value(Response('wrongResponse', 400)));
        expect(() async => await bitcoinClient.getCurrentBitcoinCost(), throwsA(isA<FormatException>()));
      });
    });
  });
}