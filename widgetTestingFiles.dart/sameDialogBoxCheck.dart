import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Color> containerColors = List.generate(
    20,
    (index) => Colors.deepPurple, // Initialize all containers with a default color
  );

  void _showColorPicker(int containerIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color selectedColor = containerColors[containerIndex];

        return AlertDialog(
          title: Text('Select a color for Container ${containerIndex + 1}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ColorPicker(
                  pickerColor: selectedColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  enableAlpha: false,
                  pickerAreaHeightPercent: 0.8,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  containerColors[containerIndex] = selectedColor;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          for (int i = 0; i < containerColors.length; i++)
            GestureDetector(
              onTap: () {
                _showColorPicker(i);
              },
              child: Container(
                color: containerColors[i],
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'Container ${i + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Navigation(),
  ));
}
