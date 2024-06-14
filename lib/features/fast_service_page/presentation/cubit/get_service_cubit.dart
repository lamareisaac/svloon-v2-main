import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../user/domain/domain/entities/user_entity.dart';
import '../../data/model/fast_service_model.dart';
import '../../data/model/fast_service_model.dart';
import '../../domain/domain/entities/fast_service_entity.dart';
import '../../domain/usercases/get_service_usecase.dart';

part 'get_service_state.dart';

class GetServiceCubit extends Cubit<GetServiceState> {
    final GetSalonsUseCase getSalonsUseCase;

  GetServiceCubit({required this.getSalonsUseCase}) : super(GetServiceInitial());

  Future<void> getCatalogue() async{
    emit(GetServiceLoading());
    try {
     List<Catalogue> services = await getSalonsUseCase.call();
      emit(GetServiceSuccess(services: services));
      
    } on SocketException catch (_){
      emit(GetServiceFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(GetServiceFailure(error: _.toString()));
    }
  }
}
