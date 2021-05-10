import 'package:test_app/data/dto/bitcoin_dto.dart';
import 'package:test_app/data/network/bitcoin_client.dart';
import 'package:test_app/domain/interface/bitcoin_repository.dart';

class BitcoinRepositoryImpl extends BitcoinRepository {
  final BitcoinClient _bitcoinClient;

  BitcoinRepositoryImpl(this._bitcoinClient);

  @override
  Future<BitcoinDTO> getLastBitcoinPrice() async {
    return await _bitcoinClient.getCurrentBitcoinCost();
  }
}