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
    ViewSlotsModel viewslt;
    emit(CheckingViewSlots());

    viewslt = await Repository().viewSlots(url: '/view/slots');
    if (viewslt.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewSlotsChecked(viewslt));
    } else {
      emit(ViewSlotsError(error: viewslt.msg.toString()));
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
  final ViewSlotsModel? viewslt;
  ViewSlotsChecked(this.viewslt);
}

class ViewSlotsError extends ViewSlotsState {
  final String error;
  ViewSlotsError({required this.error});
}