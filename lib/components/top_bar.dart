import 'package:flutter/material.dart';
import 'package:svloon2/style.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        const Positioned(
          top: 50,
          left: 20,
          child: Icon(Icons.arrow_back_ios)),
        Positioned(
          top: 40,
          right: 12,
          child: Container(
            width: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: Style.cameraPageBackground,
            
            ),
            child: Column(
              children: const [
                  SizedBox(height: 10),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15, ),
                  Icon(Icons.flash_off, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),
                  Icon(Icons.flip_camera_android, color: Style.cameraPageIconColor, size: 28),
                  SizedBox(height: 15),

              ],
            ),
          )
          
        ),
        
      ],
    );
  }
}