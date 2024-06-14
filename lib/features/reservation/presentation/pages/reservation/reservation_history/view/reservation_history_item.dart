import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';

import '../../reservation_summary/view/reservation_summary_page.dart';

class ReservationHistoryItem extends StatelessWidget {
  ReservationHistory item;
   ReservationHistoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
          // onTap: () => MaterialPageRoute(
          //                               builder: (context) =>
          //                                   ReservationSummaryPage(order: ,)),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 800 < 321 ? 150 : 300,
                                          maxHeight: 30),
                                      child: Row(
                                        children: [
                                           Text(
                                            item.appointmentStatus.name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3),
                                          Text(
                                            item.services.isNotEmpty ? '\$ '+item.services[0]['price']: '',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 800 < 321 ? 150 : 185,
                                          maxHeight: 30),
                                      child:  Text(
                                        item.appointmentStatus.description,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                      )),
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 800 < 321 ? 150 : 185,
                                          maxHeight: 30),
                                      child: const Text(
                                        'Canada,torronto,9563cv  ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                      child: Center(
                                        child: Text(
                                          'A avenir',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ])),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      item.appointmentStatus.image),
                                  fit: BoxFit.cover),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: item.appointmentStatus.color == "green",
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 5,
                          lineHeight: 5.0,
                          percent: 1,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          progressColor: Colors.green,
                          
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 5,
                          lineHeight: 5.0,
                          percent: 0.8,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          progressColor: Colors.green,
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 5,
                          lineHeight: 5.0,
                          percent: 0,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          progressColor: Colors.green,
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width / 5,
                          lineHeight: 5.0,
                          percent: 0,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          progressColor: Colors.green,
                        ),
                      
                       
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
