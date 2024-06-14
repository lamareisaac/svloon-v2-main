import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/request_service/request_salon_service_cubit.dart';

class RequestLoading extends StatefulWidget {
  const RequestLoading({super.key});

  @override
  State<RequestLoading> createState() => _RequestLoadingState();
}

class _RequestLoadingState extends State<RequestLoading> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestSalonServiceCubit, RequestSalonServiceCubitState>(
      builder: (context, state) {
      
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/service_loading.gif"),
                  fit: BoxFit.contain)),
          child: Column(children: [
            Text("recherche en cours"),
          ]),
        );
      },
    );
  }
}
