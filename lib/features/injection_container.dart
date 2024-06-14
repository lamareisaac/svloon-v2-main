




import 'package:get_it/get_it.dart';
import 'package:svloon2/features/Location/location_service_page_injection.dart';
import 'package:svloon2/features/reservation/reservation_service_page_injection.dart';

import 'explorer/salon_service_page_injection.dart';
import 'fast_service_page/fast_service_page_injection.dart';
import 'user/user_injection_container.dart';


final sl = GetIt.instance;

Future<void> init() async {




  await userInjectionContainer();
  await fastServiceInjectionContainer();
  await salonServiceInjectionContainer();
  await savedLocationInjectionContainer();
  await reservationInjectionContainer();
 

}