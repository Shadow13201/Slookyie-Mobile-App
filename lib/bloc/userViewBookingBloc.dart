import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/userViewBookingModel.dart';
import '../data/repository.dart';

class UserViewBookingBloc extends Bloc<UserViewBookingEvent, UserViewBookingState> {
  UserViewBookingBloc() : super(UserViewBookingState()) {
    on<CheckUserViewBooking>(_CheckUserViewBooking);
  }



  Future<FutureOr<void>>
  _CheckUserViewBooking(
      CheckUserViewBooking event, Emitter<UserViewBookingState> emit) async {
    UserViewBookingModel viewBoo;
    emit(CheckingUserViewBooking());

    viewBoo = await Repository().userviewBooking(url: '/viewservice/Booked');
    if (viewBoo.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(UserViewBookingChecked(viewBoo));
    } else {
      emit(UserViewBookingError(error: viewBoo.msg.toString()));
    }
  }
}
//events
class UserViewBookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckUserViewBooking extends UserViewBookingEvent {

}



//states

class UserViewBookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingUserViewBooking extends UserViewBookingState {}
class UserViewBookingChecked extends UserViewBookingState {
  final UserViewBookingModel? userviewBooking;
  UserViewBookingChecked(this.userviewBooking);
}

class UserViewBookingError extends UserViewBookingState {
  final String error;
  UserViewBookingError({required this.error});
}