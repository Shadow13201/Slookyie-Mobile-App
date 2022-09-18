import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/removeServiceModel.dart';
import '../data/repository.dart';
class RemoveServiceBloc extends Bloc<RemoveServiceEvent, RemoveServiceState> {
  RemoveServiceBloc() : super(RemoveServiceState()) {

    on<CheckRemoveService>(_checkRemoveService);
  }



  Future<FutureOr<void>> _checkRemoveService(
      CheckRemoveService event, Emitter<RemoveServiceState> emit) async {
    emit(CheckingRemoveService());
    RemoveServiceModel removeserviceModel;
    Map data = {
      "id": event.id,
    };


    removeserviceModel = await Repository().postRemoveService(url: '/deleteServices/admin', data: data);
    if (removeserviceModel.status == true) {

      emit(RemoveServiceChecked());
    } else if (removeserviceModel.status == false) {
      emit(RemoveServiceError(error: removeserviceModel.msg.toString()));
    }
  }
}



//events
class RemoveServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckRemoveService extends RemoveServiceEvent {
  final String id;

  CheckRemoveService({required this.id});
}


//states

class RemoveServiceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingRemoveService extends RemoveServiceState {}
class RemoveServiceChecked extends RemoveServiceState {}

class RemoveServiceError extends RemoveServiceState {
  final String error;
  RemoveServiceError({required this.error});
}