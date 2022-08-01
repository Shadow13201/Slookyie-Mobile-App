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
    ViewBookingModel viewBooking;
    viewBooking = (await Repository().viewBooking(url: '/view/booking')) as ViewBookingModel;
    if (viewBooking.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewBookingChecked(viewBooking));
    } else {
      emit(ViewBookingError(error: viewBooking.msg.toString()));
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
  final ViewBookingModel? viewBooking;
  ViewBookingChecked(this.viewBooking);
}

class ViewBookingError extends ViewBookingState {
  final String error;
  ViewBookingError({required this.error});
}