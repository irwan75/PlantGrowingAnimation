import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class HomeController extends GetxController {
  ValueNotifier<Artboard?> riveArtboard = ValueNotifier<Artboard?>(null);

  StateMachineController? controller;
  SMIInput<double>? progress;

  // late Timer _timer;
  ValueNotifier<double> treeProgress = ValueNotifier<double>(0.0);
  int treeMaxProgress = 60;

  @override
  void onInit() {
    super.onInit();
    initilizeRiveAsset();
  }

  void initilizeRiveAsset(){
      rootBundle.load('assets/tree_demo.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Grow');
        if (controller != null) {
          artboard.addController(controller);
          progress = controller.findInput('input');
        }
        riveArtboard.value = artboard;
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onChangeTreeProgress(double val) {
    if (val < treeMaxProgress ) {
          this.treeProgress.value = val;
          progress?.value = this.treeProgress.value*treeMaxProgress;
        }
    
  }
}
