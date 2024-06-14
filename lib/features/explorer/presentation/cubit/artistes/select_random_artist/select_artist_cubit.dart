import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';

part 'select_artist_state.dart';

class SelectArtistCubit extends Cubit<SelectArtistState> {
  SelectArtistCubit() : super(SelectArtistInitial());
      Random random = Random();


  Future<void> selectRandomArtist(List<Staff> artistArray) async {
      var randomIndex = random.nextInt(artistArray.length);
      print(randomIndex);
      emit(RandomArtistSelected(artistSelected: artistArray[randomIndex].artistId));

  }
  Future<void> selectArtist(int artistId) async{
    print(artistId);
      emit(ArtistSelected(artistId: artistId));
      
  }
}
