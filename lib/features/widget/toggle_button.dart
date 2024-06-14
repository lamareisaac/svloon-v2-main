import 'package:flutter/material.dart';

class ToogleButton extends StatefulWidget {
  int index = 0;
  ToogleButton({super.key, required this.index});

  @override
  State<ToogleButton> createState() => _ToogleButtonState();
}

class _ToogleButtonState extends State<ToogleButton> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (selected == widget.index)
                  ? Colors.grey.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: InkWell(
                child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: Container(
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            (selected == 0) ? Colors.black : Colors.transparent,
                      ),
                      child: (selected == 0)
                          ? Image.asset(
                              "assets/images/toggle_home_white.png",
                              width: 15,
                              height: 15,
                            )
                          : Image.asset(
                              "assets/images/toggle_home.png",
                              width: 15,
                              height: 15,
                            )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  child: Container(
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            (selected == 1) ? Colors.black : Colors.transparent,
                      ),
                      child: (selected == 1)
                          ? Image.asset(
                              "assets/images/toggle_house_white.png",
                              width: 15,
                              height: 15,
                            )
                          : Image.asset(
                              "assets/images/toggle_house.png",
                              width: 15,
                              height: 15,
                            )),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  GestureTapCallback onTap;
  IconData iconData;
  Color iconColor;
  Color shapeColor;

  CircleButton(
      {super.key,
      required this.onTap,
      required this.iconData,
      required this.iconColor,
      required this.shapeColor});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    double size = 40.0;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: size,
        decoration: BoxDecoration(
          color: widget.shapeColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          widget.iconData,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
