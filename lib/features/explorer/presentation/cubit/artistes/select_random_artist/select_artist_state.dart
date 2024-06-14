part of 'select_artist_cubit.dart';

sealed class SelectArtistState extends Equatable {
  const SelectArtistState();

  @override
  List<Object> get props => [];
}

final class SelectArtistInitial extends SelectArtistState {}
class ArtistSelected extends SelectArtistState {
  final int artistId;
    const ArtistSelected({ required this.artistId});

  @override
  List<Object> get props => [artistId];
 }
final class RandomArtistSelected extends SelectArtistState {
  final int artistSelected;
    const RandomArtistSelected({ required this.artistSelected});

  @override
  List<Object> get props => [artistSelected];
}
