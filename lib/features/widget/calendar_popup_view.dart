import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:svloon2/features/explorer/data/model/artists_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_model.dart';
import 'package:svloon2/features/widget/selectable_avatar.dart';

import 'custom_calendar.dart';

class CalendarPopupView extends StatefulWidget {
  List<Staff>? artists;
  CalendarPopupView(
      {Key? key,
       this.artists,
      this.initialStartDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.currentDate,
      this.heure})
      : super(key: key);

  final DateTime? currentDate;
  final bool barrierDismissible;
  final DateTime? initialStartDate;
  final String? heure;
  final Function(DateTime, String heure)? onApplyClick;

  final Function()? onCancelClick;
  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime? startDate;
  DateTime? endDate;
  int selected = 1;
  int artistSelcted = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                          widget.artists != null ?  Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20, top: 20),
                                      height: MediaQuery.of(context).size.height * 0.13,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            renderContainer(SelectableAvatar(
                                                artists: widget.artists,
                                                randAvatar: true)),
                                            for (int i = 0;
                                                i < widget.artists!.length;
                                                i++)
                                              renderContainer(SelectableAvatar(
                                                artist: widget.artists![i],
                                                randAvatar: false,
                                              ))
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ): Container(),
                            CustomCalendarView(
                              currentDate: widget.currentDate,
                              initialStartDate: widget.initialStartDate,
                              currentDateChange: (DateTime currentDateData) {
                                setState(() {
                                  startDate = currentDateData;
                                  endDate = currentDateData;
                                });
                              },
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  buildSelectedOption("13:15", 1),
                                  buildSelectedOption("13:30", 2),
                                  buildSelectedOption("13:45", 3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSelectedOption(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 20, left: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          
          color: (selected == index)
              ? Color.fromRGBO(31, 149, 175, 1)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
              onTap: () {
                widget.onApplyClick!(startDate!, text);
                Navigator.pop(context);
                setState(() {
                  selected = index;
                });
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: (selected == index) ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  renderContainer(Widget child) {
    return SizedBox(height: 190, width: 80, child: Center(child: child));
  }
}
