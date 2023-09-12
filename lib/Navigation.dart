import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Color _navBarColor = Colors.deepPurple;
  double _navBarHeight = 70;
  String _userData = "Some pre-written description will be there which user can change";
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _saveUserData(String value) {
    setState(() {
      _userData = value;
    });
  }

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: _navBarColor,
            height: _navBarHeight, // Background color for the navigation bar
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'HackX', // Replace with your logo or site name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _navBarHeight * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    NavItem(
                      title: 'Home',
                      fontSize: _navBarHeight * 0.2,
                    ),
                    NavItem(title: 'About', fontSize: _navBarHeight * 0.2),
                    NavItem(title: 'Contact', fontSize: _navBarHeight * 0.2),
                  ],
                ),
              ],
            ),
          ),
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
          const SizedBox(height: 20),
          Container(
              height: 200,
              width: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: _navBarColor, width: 5.0)),
              child: TextFormField(
                //controller: textEditingController,
                initialValue: _userData,
                // maxLines: null,
                // expands: true,
                // textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: "Type your data here",
                ),
                onChanged: (value){
                  _saveUserData(value);
                },
              ))
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final double fontSize;

  NavItem({Key? key, required this.title, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          //Not implemented yet
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
