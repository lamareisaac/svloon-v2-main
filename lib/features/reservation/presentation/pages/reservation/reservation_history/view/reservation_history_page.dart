import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/reservation/presentation/cubit/reservation_cubit.dart';

import 'reservation_history_item.dart';

class ReservationHistoryPage extends StatefulWidget {
  const ReservationHistoryPage({super.key});

  @override
  State<ReservationHistoryPage> createState() => _ReservationHistoryPageState();
}

class _ReservationHistoryPageState extends State<ReservationHistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ReservationHistoryCubit>(context).getReservationHistory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
          automaticallyImplyLeading: false,
          title: const Text(
            'Historique de reservation',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocBuilder<ReservationHistoryCubit, ReservationHistoryState>(
          builder: (context, state) {
            if (state is ReservationHistoryLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            else if (state is ReservationHistorySuccess){
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.reservations.length,
                itemBuilder: (_, i) {
                  return ReservationHistoryItem(item: state.reservations[i]);
                });
            }
            else{
              return Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ));
  }
}
