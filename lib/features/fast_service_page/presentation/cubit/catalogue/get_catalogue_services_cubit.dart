import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/get_catalogue_services_model.dart';
import '../../../domain/usercases/get_catalogue_services.dart';

part 'get_catalogue_services_state.dart';

class GetCatalogueServicesCubit extends Cubit<GetCatalogueServicesState> {
  final GetCatalogueServiceUseCase getCatalogueServiceUseCase;

  GetCatalogueServicesCubit({required this.getCatalogueServiceUseCase}) : super(GetCatalogueServicesInitial());
  Future<void> getCatalogueServices(int id) async{
    emit(GetCatalogueServicesLoading());
    try {
     GetCatalogueService service = await getCatalogueServiceUseCase.call(id);
      emit(GetCatalogueServicesSucess(service: service));
      
    } on SocketException catch (_){
      emit(GetCatalogueServicesError(error: _.toString()));
    }
    
    catch (_) {
    emit(GetCatalogueServicesError(error: _.toString()));
    }
  }
}
