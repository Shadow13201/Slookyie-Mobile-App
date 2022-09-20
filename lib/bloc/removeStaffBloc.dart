import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/removeStaffModel.dart';
import '../data/repository.dart';
class RemoveStaffBloc extends Bloc<RemoveStaffEvent, RemoveStaffState> {
  RemoveStaffBloc() : super(RemoveStaffState()) {

    on<CheckRemoveStaff>(_checkRemoveStaff);
  }



  Future<FutureOr<void>> _checkRemoveStaff(
      CheckRemoveStaff event, Emitter<RemoveStaffState> emit) async {
    emit(CheckingRemoveStaff());
    RemoveStaffModel removestaffModel;
    Map data = {
      "id": event.id,
    };


    removestaffModel = await Repository().postRemoveStaff(url: '/deletestaff/admin', data: data);
    if (removestaffModel.status == true) {

      emit(RemoveStaffChecked());
    } else if (removestaffModel.status == false) {
      emit(RemoveStaffError(error: removestaffModel.msg.toString()));
    }
  }
}



//events
class RemoveStaffEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckRemoveStaff extends RemoveStaffEvent {
  final String id;

  CheckRemoveStaff({required this.id});
}


//states

class RemoveStaffState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingRemoveStaff extends RemoveStaffState {}
class RemoveStaffChecked extends RemoveStaffState {}

class RemoveStaffError extends RemoveStaffState {
  final String error;
  RemoveStaffError({required this.error});
}