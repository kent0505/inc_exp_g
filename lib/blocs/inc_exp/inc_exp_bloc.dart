import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/inc_exp.dart';
import '../../core/utils.dart';

part 'inc_exp_event.dart';
part 'inc_exp_state.dart';

class IncExpBloc extends Bloc<IncExpEvent, IncExpState> {
  IncExpBloc() : super(IncExpInitial()) {
    on<IncExpEvent>(
      (event, emit) => switch (event) {
        GetIncExpEvent() => _getIncExp(event, emit),
        AddIncExpEvent() => _addIncExp(event, emit),
        EditIncExpEvent() => _editIncExp(event, emit),
        DeleteIncExpEvent() => _deleteIncExp(event, emit),
      },
    );
  }

  void _getIncExp(
    GetIncExpEvent event,
    Emitter<IncExpState> emit,
  ) async {
    await getModels();
    emit(IncExpLoadedState(models: incexpList));
  }

  void _addIncExp(
    AddIncExpEvent event,
    Emitter<IncExpState> emit,
  ) async {
    incexpList.insert(0, event.model);
    await updateModels();
    emit(IncExpLoadedState(models: incexpList));
  }

  void _editIncExp(
    EditIncExpEvent event,
    Emitter<IncExpState> emit,
  ) async {
    for (IncExp model in incexpList) {
      if (identical(model, event.model)) {
        model.title = event.model.title;
      }
    }
    await updateModels();
    emit(IncExpLoadedState(models: incexpList));
  }

  void _deleteIncExp(
    DeleteIncExpEvent event,
    Emitter<IncExpState> emit,
  ) async {
    incexpList.removeWhere((model) => identical(model, event.model));
    await updateModels();
    emit(IncExpLoadedState(models: incexpList));
  }
}
