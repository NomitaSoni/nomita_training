import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}
class CounterIncrementPressed extends CounterEvent {} // Define the event

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}
