import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  String text;
  int index = 0;
  int selected = 1;

   SelectionButton({super.key, required this.text, required this.index});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Material(
        
        color: (widget.selected == widget.index) ? Colors.black : Colors.transparent,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: (){
            setState(() {
              widget.selected = widget.index;
            });
          },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10,20,10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                        color: (widget.selected == widget.index) ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                        ),
                  ),
                ],
              ),
            )),
      ),
    );;
  }
}