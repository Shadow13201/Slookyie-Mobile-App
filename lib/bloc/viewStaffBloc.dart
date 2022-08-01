import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/viewStaffModel.dart';
import '../data/repository.dart';

class ViewStaffBloc extends Bloc<ViewStaffEvent, ViewStaffState> {
  ViewStaffBloc() : super(ViewStaffState()) {
    on<CheckViewStaff>(_CheckViewStaff);
  }



  Future<FutureOr<void>>
  _CheckViewStaff(
      CheckViewStaff event, Emitter<ViewStaffState> emit) async {
    ViewStaffModel view;
    emit(CheckingViewStaff());

    view = await Repository().viewStaff(url: '/view/staff');
    if (view.status == true) {
      // await TempStorage.addToken(WardModel.token.toString());
      // print(WardModel.token.toString());
      emit(ViewStaffChecked(view));
    } else {
      emit(ViewStaffError(error: view.msg.toString()));
    }
  }
}
//events
class ViewStaffEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckViewStaff extends ViewStaffEvent {

}



//states

class ViewStaffState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingViewStaff extends ViewStaffState {}
class ViewStaffChecked extends ViewStaffState {
  final ViewStaffModel? view;
  ViewStaffChecked(this.view);
}

class ViewStaffError extends ViewStaffState {
  final String error;
  ViewStaffError({required this.error});
}