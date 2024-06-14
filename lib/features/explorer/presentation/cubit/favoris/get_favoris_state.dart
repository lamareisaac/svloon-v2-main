part of 'get_favoris_cubit.dart';

sealed class SalonFavorisState extends Equatable {
  const SalonFavorisState();

  @override
  List<Object> get props => [];
}

final class SalonFavorisInitial extends SalonFavorisState {}
final class SalonFavorisLoading extends SalonFavorisState {}
final class SalonFavorisSuccess extends SalonFavorisState {
  final List<SalonFavoris> favoris;
    const SalonFavorisSuccess({ required this.favoris});

  @override
  List<Object> get props => [favoris];
}
final class SalonFavorisFailed extends SalonFavorisState {
  final String error;
    const SalonFavorisFailed({ required this.error});

  @override
  List<Object> get props => [error];
}
final class ArtistFavorisInitial extends SalonFavorisState {}
final class ArtistFavorisLoading extends SalonFavorisState {}
final class ArtistFavorisSuccess extends SalonFavorisState {
  final List<ArtistFavoris> favoris;
    const ArtistFavorisSuccess({ required this.favoris});

  @override
  List<Object> get props => [favoris];
}
final class ArtistFavorisFailed extends SalonFavorisState {
  final String error;
    const ArtistFavorisFailed({ required this.error});

  @override
  List<Object> get props => [error];
}

