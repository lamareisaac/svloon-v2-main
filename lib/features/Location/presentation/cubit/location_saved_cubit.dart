import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svloon2/features/Location/data/model/location_saved_model.dart';
import 'package:svloon2/features/Location/domain/usercases/get_locations_saved_usecase.dart';


part 'location_saved_state.dart';

class LocationSavedCubit extends Cubit<LocationSavedState> {
     final GetLocationSavedUseCase getLocationSavedUseCase;

  LocationSavedCubit({required this.getLocationSavedUseCase}) : super(LocationSavedInitial());


   Future<void> getSavedPlaces() async{
    emit(LocationSavedLoading());
    try {
     List<UserLocationSaved> results = await getLocationSavedUseCase.call();
      emit(LocationSavedSuccess(places: results));
      
    } on SocketException catch (_){
      emit(LocationSavedFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(LocationSavedFailure(error: _.toString()));
    }
  }
}
