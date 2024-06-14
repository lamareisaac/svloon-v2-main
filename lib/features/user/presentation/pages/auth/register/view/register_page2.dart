import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'otp_verification.dart';
import 'phone_register.dart';
import 'register_page.dart';

class RegisterPage2 extends StatefulWidget {
   RegisterPage2({Key? key}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage2> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: currentPage == 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                GestureDetector(
                  onTap: (){
                    pageController.previousPage(duration: const Duration(milliseconds: 200),
                          curve: Curves.ease);
                  },
                  child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(Icons.arrow_back),
                          
                        ),
                ),
                GestureDetector(
                  onTap: (){
                  pageController.nextPage(duration: const Duration(milliseconds: 200),
                          curve: Curves.ease);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Suivant", style: TextStyle(color: Colors.black, fontSize: 15),),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                          
                        ),
                ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
            ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        controller: pageController,
        children: [PhoneRegister(onNext: pageController), OtpScreen(), RegisterPage()],
      ),
    );
  }
}