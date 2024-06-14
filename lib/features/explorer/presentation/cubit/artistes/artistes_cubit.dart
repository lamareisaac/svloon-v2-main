import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/artists_model.dart';
import '../../../domain/usercases/get_artistes_usecase.dart';

part 'artistes_state.dart';

class ArtistesCubit extends Cubit<ArtistesState> {
        final GetArtistesUseCase getArtistesUseCase;

  ArtistesCubit({required this.getArtistesUseCase}) : super(ArtistesInitial());

  Future<void> getArtistes() async{
    emit(ArtistesLoading());
    try {
     List<Artistes> service = await getArtistesUseCase.call();
      emit(ArtistesSuccess(artistes: service));
      
    } on SocketException catch (_){
      emit(ArtistesError(error: _.toString()));
    }
    
    catch (_) {
    emit(ArtistesError(error: _.toString()));
    }
  }
  
}
