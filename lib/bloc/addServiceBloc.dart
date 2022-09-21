import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/addServiceModel.dart';
import '../data/repository.dart';


class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  AddServiceBloc() : super(AddServiceState()) {

    on<CheckAddService>(_CheckAddService);
  }



  Future<FutureOr<void>> _CheckAddService(
      CheckAddService event, Emitter<AddServiceState> emit) async {
    emit(CheckingAddService());
    AddServiceModel addServiceModel;

    Map data = {
      "service": event.service,
      "cost": event.cost,

    };
    addServiceModel = await Repository().addService(url: '/addService/admin', data: data);
    if (addServiceModel.status == true) {
      emit(AddServiceChecked(addServiceModel));
    } else {
      emit(AddServiceError(error: addServiceModel.msg.toString()));
    }
  }
}
//events
class AddServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckAddService extends AddServiceEvent {
  final String  service,cost;
  CheckAddService({required this.service,required this.cost
  });
}
class ShowProfile extends AddServiceEvent{}


//states

class AddServiceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAddService extends AddServiceState {}
class AddServiceChecked extends AddServiceState {
  final AddServiceModel addServiceModel;
  AddServiceChecked(this.addServiceModel);
}

class AddServiceError extends AddServiceState {
  final String error;
  AddServiceError({required this.error});
}