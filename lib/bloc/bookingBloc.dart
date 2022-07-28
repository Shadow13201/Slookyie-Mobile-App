import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/data/models/bookingModel.dart';
import '../data/repository.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingState()) {

    on<CheckOTP>(_checkOTP);
  }

  Future<FutureOr<void>> _checkOTP(
      CheckOTP event, Emitter<BookingState> emit) async {
    emit(CheckingOtp());
    BookingModel bookingModel;
    Map data = {
      "serviceId": event.services,
      "date":event.date,
      "start":event.start,
      "end":event.end,
    };


    bookingModel =
    await Repository().booking(url: '/book/services', data: data);
    if (bookingModel.status == true) {
      // await TempStorage.addToken(bookingModel.token.toString());
      emit(OtpChecked());
    } else {
      emit(OtpError(error: bookingModel.msg.toString()));
    }
  }
}
//events
class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckOTP extends BookingEvent {
  final String services,date,start,end;
  CheckOTP({required this.services,required this.date,required this.end,required this.start});
}


//states

class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingOtp extends BookingState {}
class OtpChecked extends BookingState {}

class OtpError extends BookingState {
  final String error;
  OtpError({required this.error});
}