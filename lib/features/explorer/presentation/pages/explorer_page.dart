
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'artists/artiste_carousel.dart';
import 'salons/salons_carousel_slider.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  double opacity = 1.0;
  static const double fabHeightClosed = 116.0;
  double panelOpacity = 1.0; // Commencez avec une opacité maximale

  double fabHeight = fabHeightClosed;
  final PanelController panelController = PanelController();


   
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          color: Colors.white.withOpacity(panelOpacity),
          controller: panelController,
            defaultPanelState: PanelState.OPEN,

          boxShadow: [
            BoxShadow(
              color: panelOpacity > 0.3
                  ? Colors.white
                  : Colors.white.withOpacity(0.3),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          minHeight: MediaQuery.of(context).size.height * 0.04,
          maxHeight: MediaQuery.of(context).size.height / 1.7,
          isDraggable: true,
          onPanelClosed: () {
            setState(() {
              panelOpacity = 0.3;
            });
          },
          onPanelOpened: () {
            setState(() {
              panelOpacity = 1.0;
            });
          },
          panelBuilder: (ScrollController sc) {
            return ListView(
              scrollDirection: Axis.vertical,
              controller: sc,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      panelController.open();
                    }),
                    child: Center(
                      child: AnimatedOpacity(
                        duration:
                            Duration(milliseconds: 500), // Durée de l'animation
                        opacity: opacity, // Utilisez l'opacité actuelle
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SalonCarousel(),
                ArtisteCarousel(),
              ],
            );
          },
        )
      ],
    );
  }
}
