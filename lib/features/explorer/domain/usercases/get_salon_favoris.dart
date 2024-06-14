

import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_services_model.dart';

import '../../data/model/single_salon_service_model.dart';
import '../repository/salon_service_repository.dart';

class GetSalonFavorisUseCase{
  final SalonServiceRepository repository;

  GetSalonFavorisUseCase({required this.repository});

  Future<List<SalonFavoris>> call(){
    return repository.getSalonFavoris();
  }
}