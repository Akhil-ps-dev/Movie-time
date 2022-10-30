import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  HotAndNewBloc() : super(_Initial()) {
    on<HotAndNewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
