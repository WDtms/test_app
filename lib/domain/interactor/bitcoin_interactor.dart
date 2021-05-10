import 'package:test_app/domain/interface/bitcoin_repository.dart';
import 'package:test_app/domain/mapper/bitcoin_info_mapper.dart';
import 'package:test_app/domain/model/bitcoin_info.dart';

/// Интерактор для получения стоимости биткоина
class BitcoinInteractor {

  final BitcoinRepository _bitcoinRepository;

  BitcoinInteractor(this._bitcoinRepository);

  /// Получение текущей(последней) стоимости биткоина
  Future<BitcoinInfo> getLastBitcoinPrice() async {
    final dto = await _bitcoinRepository.getLastBitcoinPrice();
    return BitcoinInfoMapper.fromDto(dto);
  }
}