import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/explorer/presentation/cubit/artistes/select_random_artist/select_artist_cubit.dart';
import 'package:svloon2/features/explorer/presentation/cubit/favoris/get_favoris_cubit.dart';
import 'package:svloon2/features/fast_service_page/presentation/cubit/catalogue/get_catalogue_services_cubit.dart';
import 'package:svloon2/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'features/Location/presentation/cubit/location_saved_cubit.dart';
import 'features/explorer/presentation/cubit/artistes/artistes_cubit.dart';
import 'features/explorer/presentation/cubit/get_single_salon_cubit.dart';
import 'features/explorer/presentation/cubit/salon_cubit.dart';
import 'features/fast_service_page/presentation/cubit/get_service_cubit.dart';
import 'features/fast_service_page/presentation/cubit/request_service/request_salon_service_cubit.dart';
import 'features/injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'features/user/presentation/cubit/auth/auth_cubit.dart';
import 'features/user/presentation/cubit/credential/credential_cubit.dart';
import 'features/user/presentation/pages/loading/loading_page.dart';
import 'on_generate_route.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    print(transition);
  }
}

Future<void> main() async {
  Bloc.observer = SimpleBlocDelegate();

  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => di.sl<AuthCubit>()..appStated()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<GetServiceCubit>(create: (_) => di.sl<GetServiceCubit>()),
        BlocProvider<SalonCubit>(create: (_) => di.sl<SalonCubit>()),
        BlocProvider<GetSingleSalonCubit>(
            create: (_) => di.sl<GetSingleSalonCubit>()),
        BlocProvider<RequestSalonServiceCubit>(
            create: (_) => di.sl<RequestSalonServiceCubit>()),
        BlocProvider<ArtistesCubit>(create: (_) => di.sl<ArtistesCubit>()),
        BlocProvider<GetCatalogueServicesCubit>(
            create: (_) => di.sl<GetCatalogueServicesCubit>()),
        BlocProvider<LocationSavedCubit>(
            create: (_) => di.sl<LocationSavedCubit>()),
        BlocProvider<GetFavorisCubit>(create: (_) => di.sl<GetFavorisCubit>()),
        BlocProvider<ReservationHistoryCubit>(create: (_) => di.sl<ReservationHistoryCubit>()),
        BlocProvider<SelectArtistCubit>(create: (_) => di.sl<SelectArtistCubit>()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
            title: 'Flutter UI',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              // ... app-specific localization delegate[s] here
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English
              Locale('fr', 'FR'), // French
              // ... other locales the app supports
            ],
            initialRoute: "/",
            onGenerateRoute: OnGenerateRoute.route,
            routes: {
              "/": (context) {
                return const Loading();
              }
            }),
      ),
    );
  }
}
