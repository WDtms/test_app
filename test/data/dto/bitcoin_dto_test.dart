import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/dto/bitcoin_dto.dart';

void main() {
  group('Тест BitcoinDTO', () {
    const lastPriceKey = 'lastPrice';
    const lastPrice = 'lastPrice';

    final expectedJson = {
      lastPriceKey : lastPrice
    };

    final expectedDto = BitcoinDTO(lastPrice);

    test('Преобразование dto в json', () {
      final json = expectedDto.toJson();

      expect(json, expectedJson);
    });

    test('Преобразование json в dto', () {
      final dto = BitcoinDTO.fromJson(expectedJson);

      expect(dto.lastPrice, expectedDto.lastPrice);
    });
  });
}