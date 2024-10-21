import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  
  // Gestion de l'orientation
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => !isPortrait;

  // Pourcentage de hauteur et largeur
  double heightPercent(double value) => height * value / 100;
  double widthPercent(double value) => width * value / 100;

  // Paddings liés aux encoches ou safe areas
  EdgeInsets get paddingSafe => MediaQuery.of(this).padding;
}
