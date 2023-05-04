import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4); //Color por defecto

const List<Color> _colorThemes = [  // Lista de colores
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,

];

class AppTheme{

  final int selectedColor;

  AppTheme({ this.selectedColor=0})
    : assert ( selectedColor >= 0 && selectedColor <= _colorThemes.length -1 ,
      'Colors must be between 0 and ${_colorThemes.length}'
  );

  ThemeData theme(){        // Método que construye un theme() de tipo ThemeData 
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}