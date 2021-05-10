import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/domain/interactor/bitcoin_interactor.dart';
import 'package:test_app/domain/model/bitcoin_info.dart';
import 'package:test_app/presentation/blocs/button_cubit.dart';

class MockInteractor extends Mock implements BitcoinInteractor {}

void main() {
  group('Тест кубита кнопки', () {
    BitcoinInteractor interactor;

    final defaultText = 'Press Me';
    final bitcoinInfo = BitcoinInfo('lastPrice');
    final exception = FormatException('message');

    setUp(() {
      interactor = MockInteractor();
    });

    blocTest<ButtonCubit, ButtonState>(
      'Начальное состояние кнопки - Press Me',
      build: () => ButtonCubit(interactor),
      seed: () => NormalState(defaultText),
    );

    blocTest<ButtonCubit, ButtonState>(
        'Удачное получение цены биткоина',
        build: () {
          when(interactor.getLastBitcoinPrice()).thenAnswer((_) => Future.value(bitcoinInfo));
          return ButtonCubit(interactor);
        },
      act: (bloc) => bloc..toggleButton(),
      expect: () => [
        isA<LoadingState>(),
        predicate((state) => state is NormalState && state.buttonText == bitcoinInfo.lastPrice),
      ]
    );

    blocTest<ButtonCubit, ButtonState>(
        'Неудачное получение цены вызывает состояние с ошибкой',
        build: () {
          when(interactor.getLastBitcoinPrice()).thenAnswer((_) => Future.error(exception));
          return ButtonCubit(interactor);
        },
      act: (bloc) => bloc.toggleButton(),
      expect: () => [
        isA<LoadingState>(),
        predicate((state) => state is ErrorState && state.errorMessage == exception.message),
      ]
    );
  });
}