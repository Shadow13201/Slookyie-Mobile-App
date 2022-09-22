import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/deleteBookingModel.dart';
import '../data/repository.dart';
class DeleteBookingBloc extends Bloc<DeleteBookingEvent, DeleteBookingState> {
  DeleteBookingBloc() : super(DeleteBookingState()) {

    on<CheckDeleteBooking>(_checkDeleteBooking);
  }



  Future<FutureOr<void>> _checkDeleteBooking(
      CheckDeleteBooking event, Emitter<DeleteBookingState> emit) async {
    emit(CheckingDeleteBooking());
    DeleteBookingModel deletebookingModel;
    Map data = {
      "id": event.id,
    };


    deletebookingModel = await Repository().postDeleteBooking(url: '/delete/booking', data: data);
    if (deletebookingModel.status == true) {

      emit(DeleteBookingChecked());
    } else if (deletebookingModel.status == false) {
      emit(DeleteBookingError(error: deletebookingModel.msg.toString()));
    }
  }
}



//events
class DeleteBookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckDeleteBooking extends DeleteBookingEvent {
  final String id;

  CheckDeleteBooking({required this.id});
}


//states

class DeleteBookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingDeleteBooking extends DeleteBookingState {}
class DeleteBookingChecked extends DeleteBookingState {}

class DeleteBookingError extends DeleteBookingState {
  final String error;
  DeleteBookingError({required this.error});
}