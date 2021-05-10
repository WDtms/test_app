import 'package:bloc/bloc.dart';
import 'package:test_app/domain/interactor/bitcoin_interactor.dart';

/// Кубит, отвечающий за состояние кнопки
class ButtonCubit extends Cubit<ButtonState> {
  final BitcoinInteractor _bitcoinInteractor;

  static const _defaultButtonText = 'Press Me';

  ButtonCubit(this._bitcoinInteractor) : super(NormalState(_defaultButtonText));

  Future<void> toggleButton() async {
    if (state.buttonText != _defaultButtonText){
      emit(NormalState(_defaultButtonText));
      return;
    }
    try {
      emit(LoadingState(state.buttonText));
      final bitcoinInfo = await _bitcoinInteractor.getLastBitcoinPrice();
      emit(NormalState(bitcoinInfo.lastPrice));
    } catch (ex) {
      if (ex is FormatException) {
        emit(ErrorState(state.buttonText, ex.message));
        return;
      }
      emit(ErrorState(state.buttonText, 'Что-то пошло не так'));
    }
  }
}

abstract class ButtonState {
  final String buttonText;

  ButtonState(this.buttonText);
}

/// Состояние кнопки при ошибке
class ErrorState extends ButtonState {
  final String errorMessage;

  ErrorState(String buttonText, this.errorMessage) : super(buttonText);
}

/// Состояние кнопки по умолчанию
class NormalState extends ButtonState {
  NormalState(String buttonText) : super(buttonText);
}

/// Состояние кнопки при загрузке данных
class LoadingState extends ButtonState {
  LoadingState(String buttonText) : super(buttonText);
}
