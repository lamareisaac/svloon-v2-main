part of 'location_saved_cubit.dart';

abstract class LocationSavedState extends Equatable {
  const LocationSavedState();

  @override
  List<Object> get props => [];
}

 class LocationSavedInitial extends LocationSavedState {}
 class LocationSavedLoading extends LocationSavedState {}
 class LocationSavedSuccess extends LocationSavedState {
  final List<UserLocationSaved> places;
    LocationSavedSuccess({ required this.places});

  @override
  List<Object> get props => [places];
 }
class LocationSavedFailure extends LocationSavedState {
  final String error;
    LocationSavedFailure({ required this.error});

  @override
  List<Object> get props => [error];
}