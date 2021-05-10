import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/domain/mapper/bitcoin_info_mapper.dart';
import 'package:test_app/domain/model/bitcoin_info.dart';

void main() {
  group('Тест BitcoinInfoMapper', () {
    final dto = BitcoinDTO('lastPrice');

    test('Перевод DTO в domain', () {
      final domain = BitcoinInfoMapper.fromDto(dto);

      expect(domain.lastPrice, dto.lastPrice);
      expect(domain.runtimeType, BitcoinInfo);
    });
  });
}