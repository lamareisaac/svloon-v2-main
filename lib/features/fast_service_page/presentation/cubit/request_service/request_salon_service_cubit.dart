import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/request_salon_service_details_model.dart';
import '../../../domain/domain/entities/request_profile_service_entity.dart';
import '../../../domain/usercases/request_salon_service_usecase.dart';

part 'request_salon_service_cubit_state.dart';

class RequestSalonServiceCubit extends Cubit<RequestSalonServiceCubitState> {
  final RequestSalonServiceUserCase requestSalonServiceServiceUserCase;
  RequestSalonServiceCubit({required this.requestSalonServiceServiceUserCase}) : super(RequestCubitInitial());

  Future<void> requestService({required RequestProfileServiceEntity data}) async{
    emit(RequestCubitLoading());
    try {
     RequestSalonServiceDetailsModel service = await requestSalonServiceServiceUserCase.call(data);
      emit(RequestCubitSuccess(data: service));
      
    } on SocketException catch (_){
      emit(RequestCubitError(error: _.toString()));
    }
    
    catch (_) {
      print(_);
    emit(RequestCubitError(error: _.toString()));
    }
  }
}
