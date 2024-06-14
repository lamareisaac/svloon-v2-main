import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:svloon2/components/top_bar.dart';



class CameraAr extends StatefulWidget {
  const CameraAr({super.key});

  @override
  State<CameraAr> createState() => _CameraArState();
}

class _CameraArState extends State<CameraAr> {
  late List<CameraDescription> _cameras;
List<CameraDescription> getCameras(){
  return _cameras;
}
   late CameraController? controller;


   Future<void> initCamera({required bool frontCamera}) async{
      controller = CameraController(_cameras[(frontCamera ? 1 : 0)], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
   }

  @override
  void initState() {
    super.initState();
    if (_cameras.isNotEmpty) {
      initCamera(frontCamera: true);
    }
    
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          (controller == null) ?
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ): CameraPreview(controller!),

          const TopBar()
        ],
      );
  }
}