import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:svloon2/features/explorer/domain/usercases/search_by_name_usecase.dart';

import '../../data/model/salon_model.dart';
import '../../domain/usercases/get_service_usecase.dart';

part 'salon_state.dart';

class SalonCubit extends Cubit<SalonState> {
      final GetSalonModelUseCase getSalonModelUseCase;
      final SearchByNameUseCase searchByNameUseCase;

  SalonCubit({required this.getSalonModelUseCase, required this.searchByNameUseCase}) : super(SalonInitial());

   Future<void> getSalons() async{
    emit(GetSalonLoading());
    try {
     List<SalonModel> service = await getSalonModelUseCase.call();
      emit(GetSalonSuccess(salon: service));
      
    } on SocketException catch (_){
      emit(GetSalonFailure(error: _.toString()));
    }
    
    catch (_) {
      print(_);
    emit(GetSalonFailure(error: _.toString()));
    }
  }
   Future<void> searchSalonByName(String name) async{
    emit(GetSalonLoading());
    try {
     List<SalonModel> service = await searchByNameUseCase.call(name);
      emit(GetSalonSuccess(salon: service));
      
    } on SocketException catch (_){
      emit(GetSalonFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(GetSalonFailure(error: _.toString()));
    }
  }
}
