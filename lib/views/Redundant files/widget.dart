import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';


class WidgetChanger extends StatefulWidget {
  @override
  _WidgetChangerState createState() => _WidgetChangerState();
}

class _WidgetChangerState extends State<WidgetChanger> {
  //these controller are used when user is writing the values in the textbox instead of sliding the values
  TextEditingController _widthController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  Color _containerColor = Colors.deepPurple;
  double _containerWidth = 100; 
  double _containerHeight = 100; 
  double _textSize = 20;
  String _textFont = 'Roboto';



void _changeTextFont(String font) {
  setState(() {
    _textFont = font;
  });
}

void changeTextSize(double size){
  setState(() {
    _textSize= size;
  });
}
  void _changeColor(Color color) {
    setState(() {
      _containerColor = color;
    });
  }

  void _changeSize(double width, double height) {
    setState(() {
      _containerWidth = width;
      _containerHeight = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widget Changer'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                   Text("My Size is Changing",
                  style: TextStyle(
                    fontSize: _textSize,
                    fontFamily: _textFont,
                  )),

              Container(width: _containerWidth, height: _containerHeight, color: _containerColor),
              const SizedBox(height: 20),
              //to change the colour of the container
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text('Select a color'),
                              content: SingleChildScrollView(
                                  child: ColorPicker(
                                pickerColor: _containerColor,
                                onColorChanged: _changeColor,
                                enableAlpha: false,
                                showLabel: true,
                                pickerAreaHeightPercent: 0.8,
                              )),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'))
                              ]);
                        });
                  },
                  child: const Text('Edit Color')),
                  ElevatedButton(onPressed: (){
                    // showDialog(
                    //   context: context,
                    //  builder: (BuildContext context){
                    //   return AlertDialog(
                    //     title: Text('Change Size'),
                    //     content: SingleChildScrollView(
                    //       child: Column(
                    //         children:[
                    //           TextField(
                    //             controller: _widthController,
                    //             keyboardType: TextInputType.number,
                    //             decoration: const InputDecoration(labelText: 'Width'),
                    //           ),
                    //           TextField(
                    //             controller: _heightController,
                    //             keyboardType: TextInputType.number,
                    //             decoration: const InputDecoration(labelText: 'Height'),
                    //           ),
                    //         ],
                    //       )
                    //     ),
                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Size'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Width: ${_containerWidth.toStringAsFixed(2)}'),
              Slider(
                value: _containerWidth,
                min: 50.0,
                max: 300.0,
                onChanged: (value) {
                  //setState(() {
                    // _containerWidth = value;
                     _changeSize(value, _containerHeight);
                  //});
                },
                activeColor: Colors.deepPurple,
              ),
              Text('Height: ${_containerHeight.toStringAsFixed(2)}'),
              Slider(
                value: _containerHeight,
                min: 50.0,
                max: 300.0,
                onChanged: (value) {
                  // setState(() {
                  //   _containerHeight = value;
                  // });
                  _changeSize(_containerWidth, value);
                },
                activeColor: Colors.deepPurple, 
                

              ),
            ],
          ),
                        actions: <Widget>[
                          TextButton(onPressed: (){
                            // double width = double.tryParse(_widthController.text) ?? _containerWidth; 
                            //  double height = double.tryParse(_heightController.text) ?? _containerHeight; 
                            //  _changeSize(width, height);
                             Navigator.of(context).pop();
                          }, child: const Text('Ok'))
                        ]
                      );
                     });
                  }, child: const Text("Change Container Size")),
                  ElevatedButton(onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text("Change the textSize"),
                          content: Column(
                             mainAxisSize: MainAxisSize.min,
                            children:[
                             Text('TextSize: ${_textSize.toStringAsFixed(2)}'),
                             Slider(
                              value: _textSize,
                              min: 1.0,
                              max: 200.0,
                              onChanged: (value){
                                changeTextSize(value);
                              },
                             ),
                             const Text('Select Font:'),
                             Container(
                              height: 200,
                               child: FontPicker(onFontChanged: (font){
                                _changeTextFont(font.fontFamily);
                                Navigator.of(context).pop();
                               }),
                             )
                            ]
                          ),
                          actions: <Widget>[
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: const Text('Save'),)
                          ]
                        );
                      });
                  }, child: const Text('Change Text Size')),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text('Select Font'),
                          content: Container(
                            height: 300,
                            width: 300,
                            child: FontPicker(onFontChanged: (font){
                              _changeTextFont(font as String);
                              Navigator.of(context).pop();
                            })
                          ),
                          actions: <Widget>[
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: const Text('Save'),)
                          ]
                        );
                      });
                  }, child: const Text("Change font"))
                 
            ])));
  }
}
