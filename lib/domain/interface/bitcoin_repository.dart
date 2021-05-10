import 'package:test_app/data/dto/bitcoin_dto.dart';

/// Интерфейс работы с репозиторием
abstract class BitcoinRepository {
  /// Получение последней цены биткоина
  Future<BitcoinDTO> getLastBitcoinPrice();
}