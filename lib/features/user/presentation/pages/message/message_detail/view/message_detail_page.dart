import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({super.key});

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = <String>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
          title: const Text(
            'setone baber',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 18),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, int index) {
                  bool iSsend = index / 2 != 0 ? false : true;
                  return getSenderView(
                          ChatBubbleClipper4(
                              type: BubbleType.receiverBubble),
                          context,
                          _messages[index]);
                  // SizedBox(
                  //   height: 30,
                  // ),;
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              color: Colors.transparent,
              child: _buildTextComposer(),
            ),
          ],
        ));
  }

  getTitleText(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );

  getSenderView(CustomClipper clipper, BuildContext context, String text) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.white,
        child: Container(
          
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context, String text) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Row(
        children: <Widget>[
          Image.asset(
                "assets/images/camera.png",
              ),
          Image.asset(
                "assets/images/gallerie.png",
                scale: 15,
              ),
          Expanded(
            child: TextFormField(
          controller: _textController,
          onFieldSubmitted: (value) => _handleSubmitted(value),
       
          autofocus: false,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => _handleSubmitted(_textController.text),
              child: Image.asset(
                "assets/images/send.png",
                scale: 15,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(50)),
          
            labelStyle: const TextStyle(color: Colors.black),
            contentPadding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            border: InputBorder.none,
            focusColor: Colors.black,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
          ),
      
        ],
      ),
    );
  }

  Widget _buildMessage(
    String message,
    bool iSsend,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment:
            iSsend ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisAlignment:
            iSsend ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          if (iSsend) Spacer(),
          if (iSsend)
            SizedBox(
              width: 40,
            ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: iSsend ? Colors.black : Colors.white),
            margin: EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                message + 'dfgvuhjbkl,m;ù*dfgrhjklm',
                style: TextStyle(color: iSsend ? Colors.white : Colors.black),
              ),
            ),
          ),
          if (!iSsend) Spacer(),
          if (!iSsend)
            SizedBox(
              width: 40,
            ),
        ],
      ),
    );
  }
}
