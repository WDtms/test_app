import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:test_app/domain/interactor/bitcoin_interactor.dart';
import 'package:test_app/presentation/blocs/button_cubit.dart';

/// Кнопка, по нажатию на которой будет осуществлен поиск цены биткоина, а после того, как онная будет найдена,
/// она же будет отображена на кнопке. По повторному нажатию будет возвращено изначальное состояние кнопки
class BitcoinButton extends StatefulWidget {
  @override
  _BitcoinButtonState createState() => _BitcoinButtonState();
}

class _BitcoinButtonState extends State<BitcoinButton> {
  ButtonCubit _cubit;
  
  @override
  void initState() {
    final injector = Injector.appInstance;
    _cubit = ButtonCubit(
      injector.get<BitcoinInteractor>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _cubit.toggleButton();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<ButtonCubit, ButtonState>(
            bloc: _cubit,
            builder: (context, state) => _handleState(state),
          ),
        ),
      ),
    );
  }

  Widget _handleState(ButtonState state) {
    if (state is LoadingState) {
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
    } else if (state is ErrorState) {
      _showSnackBar(state.errorMessage);
    }
    return FittedBox(child: Text(state.buttonText));
  }

  void _showSnackBar(String errorMessage) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            )
        )
      ;
    });
  }
}
