import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/color_util.dart';
import '../controllers/home_controller.dart';
import './plant_screen.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                HexColor("61B688").withOpacity(0.7),
                HexColor("61B688").withOpacity(0.5),
                HexColor("61B688").withOpacity(0.4)
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: const [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: const PlantScreen(),
      ),
    );
  }
}
