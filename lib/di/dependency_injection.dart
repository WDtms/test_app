import 'package:injector/injector.dart';
import 'package:test_app/data/network/bitcoin_client.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/data/repository/bitcoin_repository.dart';
import 'package:test_app/domain/interactor/bitcoin_interactor.dart';
import 'package:test_app/domain/interface/bitcoin_repository.dart';

/// Класс для регистрации зависимостей
class DependencyInjection {
  final _injector = Injector.appInstance;

  /// Инициализация
  Future<void> initDependencies() async {
    // data layer
    _injector.registerSingleton<BitcoinClient>(() => BitcoinClient(http.Client()));
    _injector.registerDependency<BitcoinRepository>(() => BitcoinRepositoryImpl(
      _injector.get<BitcoinClient>(),
    ));

    // domain layer
    _injector.registerDependency<BitcoinInteractor>(() => BitcoinInteractor(
      _injector.get<BitcoinRepository>(),
    ));
  }
}