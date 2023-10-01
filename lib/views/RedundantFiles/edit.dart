import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:major_project__widget_testing/views/RedundantFiles/launch.dart';

class EditPlatform extends StatefulWidget {
  const EditPlatform({super.key});

  @override
  State<EditPlatform> createState() => _EditPlatformState();
}

class _EditPlatformState extends State<EditPlatform> {
  Color _navBarColor = Colors.deepPurple;
  double _navBarHeight = 203;
  String _userData =
      "Some pre-written description will be there which user can change";
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey _whiteContainerKey = GlobalKey();

  void _changeColor(Color color) {
    setState(() {
      _navBarColor = color;
    });
  }

  void _changeSize(double height) {
    setState(() {
      _navBarHeight = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: screenHeight,
                color: Colors.orange[300],
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Select a color'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ColorPicker(
                                          pickerColor: _navBarColor,
                                          onColorChanged: _changeColor,
                                          enableAlpha: false,
                                          pickerAreaHeightPercent: 0.8,
                                        ),
                                        Text(
                                            'Height: ${_navBarHeight.toStringAsFixed(2)}'),
                                        Slider(
                                          value: _navBarHeight,
                                          min: 50.0,
                                          max: 300.0,
                                          onChanged: (value) {
                                            _changeSize(value);
                                          },
                                          activeColor: Colors.deepPurple,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'))
                                  ],
                                );
                              });
                        },
                        child: const Text('Edit Color')),
                  ],
                ),
              )),
          Expanded(
              flex: 8,
              child: Container(
                  height: screenHeight,
                  color: Colors.orange[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 70,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Colors.brown[400],
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 470,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                double screenWidth =
                                    MediaQuery.of(context).size.width;
                                double whiteContainerWidth =
                                    (screenWidth * 8 / (2 + 8)) -
                                        2 * 50; // considering flex 2 and 8
                                double percentage =
                                    (_navBarHeight / whiteContainerWidth) * 100;
                                print(whiteContainerWidth);
                                print(percentage);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Launch(boxPercent: percentage)),
                                );
                              },
                              child: Container(
                                // key: _whiteContainerKey,
                                height: 20,
                                width: _navBarHeight,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 25),
                                color: Colors.blue[200],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
