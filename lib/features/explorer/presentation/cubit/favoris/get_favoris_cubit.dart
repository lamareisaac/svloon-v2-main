import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';
import 'package:svloon2/features/explorer/domain/usercases/get_artists_favoris.dart';
import 'package:svloon2/features/explorer/domain/usercases/get_salon_favoris.dart';

part 'get_favoris_state.dart';

class GetFavorisCubit extends Cubit<SalonFavorisState> {
    GetSalonFavorisUseCase getSalonFavorisUseCase;
    GetArtistFavorisUseCase getArtistFavorisUseCase;

  GetFavorisCubit({required this.getSalonFavorisUseCase, required this.getArtistFavorisUseCase}) : super(SalonFavorisInitial());

  Future<void> getSalonFavorite() async{
    emit(SalonFavorisLoading());
    try {
     List<SalonFavoris> result = await getSalonFavorisUseCase.call();
      emit(SalonFavorisSuccess(favoris: result));
      
    } on SocketException catch (_){
      emit(SalonFavorisFailed(error: _.toString()));
    }
    
    catch (_) {
    emit(SalonFavorisFailed(error: _.toString()));
    }
  }
  Future<void> getArtistFavorite() async{
    emit(ArtistFavorisLoading());
    try {
     List<ArtistFavoris> result = await getArtistFavorisUseCase.call();
      emit(ArtistFavorisSuccess(favoris: result));
      
    } on SocketException catch (_){
      emit(ArtistFavorisFailed(error: _.toString()));
    }
    
    catch (_) {
    emit(ArtistFavorisFailed(error: _.toString()));
    }
  }
}
