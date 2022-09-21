import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/viewSlotsModel.dart';
import '../data/repository.dart';

class ViewSlotsBloc extends Bloc<ViewSlotsEvent, ViewSlotsState> {
  ViewSlotsBloc() : super(ViewSlotsState()) {
    on<CheckViewSlots>(_CheckViewSlots);
  }



  Future<FutureOr<void>>
  _CheckViewSlots(
      CheckViewSlots event, Emitter<ViewSlotsState> emit) async {
    ViewSlotsModel view;
    emit(CheckingViewSlots());

    view = await Repository().viewSlots(url: '/view/slots');
    if (view.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewSlotsChecked(view));
    } else {
      emit(ViewSlotsError(error: view.msg.toString()));
    }
  }
}
//events
class ViewSlotsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckViewSlots extends ViewSlotsEvent {

}



//states

class ViewSlotsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingViewSlots extends ViewSlotsState {}
class ViewSlotsChecked extends ViewSlotsState {
  final ViewSlotsModel? view;
  ViewSlotsChecked(this.view);
}

class ViewSlotsError extends ViewSlotsState {
  final String error;
  ViewSlotsError({required this.error});
}