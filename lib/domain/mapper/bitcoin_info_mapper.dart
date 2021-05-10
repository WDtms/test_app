import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/domain/model/bitcoin_info.dart';

/// Класс для преобразования модели Data слоя в Domain.
abstract class BitcoinInfoMapper {
  /// Преобразует [BitcoinDTO] в [BitcoinInfo]
  static BitcoinInfo fromDto(BitcoinDTO dto) {
    return BitcoinInfo(dto.lastPrice);
  }
}