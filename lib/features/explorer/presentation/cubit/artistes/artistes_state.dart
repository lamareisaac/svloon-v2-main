part of 'artistes_cubit.dart';

abstract class ArtistesState extends Equatable {
  const ArtistesState();

  @override
  List<Object> get props => [];
}

 class ArtistesInitial extends ArtistesState {}
 class ArtistesLoading extends ArtistesState {}
 class SelectArtist extends ArtistesState {
  final int artistId;
    const SelectArtist({ required this.artistId});

  @override
  List<Object> get props => [artistId];
 }
 class ArtistesSuccess extends ArtistesState {
   final List<Artistes> artistes;
    ArtistesSuccess({ required this.artistes});

  @override
  List<Object> get props => [artistes];
 }
 class ArtistesError extends ArtistesState {
  final String error;
    ArtistesError({ required this.error});

  @override
  List<Object> get props => [error];
 }
