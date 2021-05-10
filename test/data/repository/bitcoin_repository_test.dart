import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/data/network/bitcoin_client.dart';
import 'package:test_app/data/repository/bitcoin_repository.dart';

class MockBitcoinClient extends Mock implements BitcoinClient {}

void main() {
  group('Тест BitcoinRepositoryImpl', () {
    BitcoinClient bitcoinClient;
    BitcoinRepositoryImpl bitcoinRepositoryImpl;

    setUp(() {
      bitcoinClient = MockBitcoinClient();
      bitcoinRepositoryImpl = BitcoinRepositoryImpl(bitcoinClient);
    });

    test('Получение текущей стоимости биткоина', () async {
      when(bitcoinClient.getCurrentBitcoinCost()).thenAnswer((_) => Future.value(BitcoinDTO('price')));

      final dto = await bitcoinRepositoryImpl.getLastBitcoinPrice();
      expect(dto.runtimeType, BitcoinDTO);
      verify(bitcoinClient.getCurrentBitcoinCost());
    });
  });
}