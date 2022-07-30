import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/viewBookingModel.dart';
import '../data/repository.dart';

class ViewBookingBloc extends Bloc<ViewBookingEvent, ViewBookingState> {
  ViewBookingBloc() : super(ViewBookingState()) {
    on<CheckViewBooking>(_CheckViewBooking);
  }



  Future<FutureOr<void>>
  _CheckViewBooking(
      CheckViewBooking event, Emitter<ViewBookingState> emit) async {
    emit(CheckingViewBooking());
    ViewBookingModel view;
    view = (await Repository().viewBooking(url: '/view/booking')) as ViewBookingModel;
    if (view.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewBookingChecked(view));
    } else {
      emit(ViewBookingError(error: view.msg.toString()));
    }
  }
}
//events
class ViewBookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckViewBooking extends ViewBookingEvent {

}



//states

class ViewBookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingViewBooking extends ViewBookingState {}
class ViewBookingChecked extends ViewBookingState {
  final ViewBookingModel? view;
  ViewBookingChecked(this.view);
}

class ViewBookingError extends ViewBookingState {
  final String error;
  ViewBookingError({required this.error});
}