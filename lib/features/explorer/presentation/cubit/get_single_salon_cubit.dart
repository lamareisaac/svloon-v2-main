import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/salon_model.dart';
import '../../data/model/single_salon_service_model.dart';
import '../../domain/usercases/get_single_salon_usecase.dart';
import 'salon_cubit.dart';

part 'get_single_salon_state.dart';

class GetSingleSalonCubit extends Cubit<GetSingleSalonState> {
  GetSingleSalonUseCase getSingleSalonUseCase;

  GetSingleSalonCubit( {required this.getSingleSalonUseCase}) : super(GetSingleSalonInitial());

  Future<void> getSingleSalon(int id) async{
    emit(GetSingleSalonLoading());
    try {
     SingleSalonModel service = await getSingleSalonUseCase.call(id);
      emit(GetSingleSalonSuccess(salon: service));
      
    } on SocketException catch (_){
      emit(GetSingleSalonFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(GetSingleSalonFailure(error: _.toString()));
    }
  }
}
