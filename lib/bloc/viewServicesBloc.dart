import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/viewServicesModel.dart';
import '../data/repository.dart';

class ViewServicesBloc extends Bloc<ViewServicesEvent, ViewServicesState> {
  ViewServicesBloc() : super(ViewServicesState()) {
    on<CheckViewServices>(_CheckViewServices);
  }



  Future<FutureOr<void>>
  _CheckViewServices(
      CheckViewServices event, Emitter<ViewServicesState> emit) async {
    emit(CheckingViewServices());
    ViewServicesModel view;
    view = await Repository().viewServices(url: '/ward/id');
    if (view.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewServicesChecked(view));
    } else {
      emit(ViewServicesError(error: view.msg.toString()));
    }
  }
}
//events
class ViewServicesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckViewServices extends ViewServicesEvent {

}



//states

class ViewServicesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingViewServices extends ViewServicesState {}
class ViewServicesChecked extends ViewServicesState {
  final ViewServicesModel? view;
  ViewServicesChecked(this.view);
}

class ViewServicesError extends ViewServicesState {
  final String error;
  ViewServicesError({required this.error});
}