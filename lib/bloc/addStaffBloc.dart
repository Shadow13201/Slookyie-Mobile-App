import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slookyie_max/data/models/addStaffModel.dart';
import '../data/repository.dart';


class AddStaffBloc extends Bloc<AddStaffEvent, AddStaffState> {
  AddStaffBloc() : super(AddStaffState()) {

    on<CheckAddStaff>(_CheckAddStaff);
  }



  Future<FutureOr<void>> _CheckAddStaff(
      CheckAddStaff event, Emitter<AddStaffState> emit) async {
    emit(CheckingAddStaff());
    AddStaffModel addStaffModel;

    Map data = {
      "staff": event.staff,
      "specialization":event.specialization,

    };
    addStaffModel = await Repository().addStaff(url: '/addstaff/admin', data: data);
    if (addStaffModel.status == true) {
      emit(AddStaffChecked(addStaffModel));
    } else {
      emit(AddStaffError(error: addStaffModel.msg.toString()));
    }
  }
}
//events
class AddStaffEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckAddStaff extends AddStaffEvent {
  final String  staff,specialization;
  CheckAddStaff({required this.staff,required this.specialization
  });
}
class ShowProfile extends AddStaffEvent{}


//states

class AddStaffState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAddStaff extends AddStaffState {}
class AddStaffChecked extends AddStaffState {
  final AddStaffModel addStaffModel;
  AddStaffChecked(this.addStaffModel);
}

class AddStaffError extends AddStaffState {
  final String error;
  AddStaffError({required this.error});
}