import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_growing_animation/app/modules/home/controllers/home_controller.dart';
import 'package:rive/rive.dart';

import '../../../utils/color_util.dart';

class PlantScreen extends GetView<HomeController> {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double treeWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "Stay Focused",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 100),
          ValueListenableBuilder<Artboard?>(
            valueListenable: controller.riveArtboard,
            builder: (context, value, widget) => Center(
              child: value == null
                  ? const SizedBox(
                      child: CircularProgressIndicator.adaptive(backgroundColor: Color(0xFF61B688)),
                    )
                  : Container(
                      width: treeWidth,
                      height: treeWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(treeWidth / 2),
                          border: Border.all(color: Colors.white12, width: 10)),
                      child: Rive(
                        alignment: Alignment.center,
                        artboard: value,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 50),
          ValueListenableBuilder<double>(
            valueListenable: controller.treeProgress,
            builder: (context, val, widget) => Slider.adaptive(
              thumbColor: HexColor("61B688").withOpacity(0.7),
              activeColor: HexColor("61B688").withOpacity(0.6),
              inactiveColor: HexColor("61B688").withOpacity(0.3),
              value: val,
              onChanged: (value) => controller.onChangeTreeProgress(value),
            ),
          ),
        ],
      ),
    );
  }
}
