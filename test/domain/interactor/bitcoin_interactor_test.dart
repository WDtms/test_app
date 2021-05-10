import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/domain/interactor/bitcoin_interactor.dart';
import 'package:test_app/domain/interface/bitcoin_repository.dart';
import 'package:test_app/domain/model/bitcoin_info.dart';

class MockBitcoinRepository extends Mock implements BitcoinRepository {}

void main() {
  group('Тест BitcoinInteractor', () {
    BitcoinRepository bitcoinRepository;
    BitcoinInteractor bitcoinInteractor;

    setUp(() {
      bitcoinRepository = MockBitcoinRepository();
      bitcoinInteractor = BitcoinInteractor(bitcoinRepository);
    });

    test('Получение текущей стоимости биктоина', () async {
      when(bitcoinRepository.getLastBitcoinPrice()).thenAnswer((_) => Future.value(BitcoinDTO('lastPrice')));

      final model = await bitcoinInteractor.getLastBitcoinPrice();
      expect(model.runtimeType, BitcoinInfo);
      verify(bitcoinRepository.getLastBitcoinPrice());
    });
  });
}