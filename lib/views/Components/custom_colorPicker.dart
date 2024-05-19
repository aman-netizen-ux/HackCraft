import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

// import 'pickers/hsv_picker.dart';
// import 'pickers/palette_hue_picker.dart';
// import 'pickers/palette_saturation_picker.dart';
// import 'pickers/palette_value_picker.dart';
// import 'pickers/rgb_picker.dart';
// import 'pickers/swatches_picker.dart';
// import 'pickers/wheel_picker.dart';
// import 'widgets/alpha_picker.dart';
// import 'widgets/hex_picker.dart';

enum Picker {
  swatches,
  rgb,
  hsv,
  wheel,
  paletteHue,
  paletteSaturation,
  paletteValue,
}

/// The orientation of the CustomColorPicker.
enum PickerOrientation {
  /// The orientation is inherited from device's orientation.
  /// On web, if window width > height, the orientation is landscape.
  inherit,

  /// Always portrait mode.
  portrait,

  /// Always landscape mode.
  landscape,
}

/// Main color picker including all color pickers of this package.
class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({
    required this.onChanged,
    this.color = Colors.blue,
    this.initialPicker = Picker.paletteHue,
    this.pickerOrientation = PickerOrientation.inherit,
    this.paletteHeight = 280,
    Key? key,
  }) : super(key: key);

  final ValueChanged<Color> onChanged;
  final Color color;

  /// The first picker widget that is shown.
  ///
  /// See also:
  ///
  ///  * [Picker] Enumeration of pickers.
  final Picker initialPicker;

  final PickerOrientation pickerOrientation;

  final double paletteHeight;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  _CustomColorPickerState();

  // Color
  late int _alpha;
  late Color _color;
  late HSVColor _hSVColor;
  late List<_IPicker> _pickers;
  late int _index;

  void _alphaOnChanged(int value) {
    _updateColor(_color.withAlpha(value));
  }

  void _colorOnChanged(Color value) {
    _updateColor(value.withAlpha(_color.alpha));
  }

  void _hSVColorOnChanged(HSVColor value) {
    _updateColor(value.toColor().withAlpha(_color.alpha));
  }

  void _colorWithAlphaOnChanged(Color value) {
    _updateColor(value);
  }

  void _updateColor(Color color) {
    _alpha = color.alpha;
    _color = color;
    _hSVColor = HSVColor.fromColor(color);
    widget.onChanged(color);
  }

  void _pickerOnChanged(_IPicker? value) {
    if (value != null) {
      _index = _pickers.indexOf(value);
    } else {
      _index = -1;
    }
  }

  @override
  void initState() {
    super.initState();

    _color = widget.color;
    _alpha = _color.alpha;
    _hSVColor = HSVColor.fromColor(_color);

    // Pickers
    _pickers = <_IPicker>[
      // SwatchesPicker
      _IPicker(
        name: 'Swatches',
        picker: Picker.swatches,
        builder: (BuildContext context) => SwatchesPicker(
          onChanged: (Color value) => super.setState(
            () => _colorWithAlphaOnChanged(value),
          ),
        ),
      ),

      // RGBPicker
      _IPicker(
        name: 'RGB',
        picker: Picker.rgb,
        builder: (BuildContext context) => RGBPicker(
          color: _color,
          onChanged: (Color value) => super.setState(
            () => _colorOnChanged(value),
          ),
        ),
      ),

      // HSVPicker
      _IPicker(
        name: 'HSV',
        picker: Picker.hsv,
        builder: (BuildContext context) => HSVPicker(
          color: _hSVColor,
          onChanged: (HSVColor value) => super.setState(
            () => _hSVColorOnChanged(value),
          ),
        ),
      ),

      // WheelPicker
      _IPicker(
        name: 'Wheel',
        picker: Picker.wheel,
        builder: (BuildContext context) => WheelPicker(
          color: _hSVColor,
          onChanged: (HSVColor value) => super.setState(
            () => _hSVColorOnChanged(value),
          ),
        ),
      ),

      // CustomPaletteHuePicker
      _IPicker(
        name: 'Palette Hue',
        picker: Picker.paletteHue,
        builder: (BuildContext context) => CustomPaletteHuePicker(
          color: _hSVColor,
          paletteHeight: widget.paletteHeight,
          onChanged: (HSVColor value) => super.setState(
            () => _hSVColorOnChanged(value),
          ),
        ),
      ),

      // PaletteSaturationPicker
      _IPicker(
        name: 'Palette Saturation',
        picker: Picker.paletteSaturation,
        builder: (BuildContext context) => PaletteSaturationPicker(
          color: _hSVColor,
          paletteHeight: widget.paletteHeight,
          onChanged: (HSVColor value) => super.setState(
            () => _hSVColorOnChanged(value),
          ),
        ),
      ),

      // PaletteValuePicker
      _IPicker(
        name: 'Palette Value',
        picker: Picker.paletteValue,
        builder: (BuildContext context) => PaletteValuePicker(
          color: _hSVColor,
          paletteHeight: widget.paletteHeight,
          onChanged: (HSVColor value) => super.setState(
            () => _hSVColorOnChanged(value),
          ),
        ),
      ),
    ];

    _index = _pickers.indexOf(
      _pickers.firstWhere((element) => element.picker == widget.initialPicker),
    );
  }

  // Dropdown
  DropdownMenuItem<_IPicker> _buildDropdownMenuItems(_IPicker item) {
    return DropdownMenuItem<_IPicker>(
      value: item,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
        child: Text(
          item.name,
          style: _index == _pickers.indexOf(item)
              ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  )
              : Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildHead() {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Avator
          Container(
            width: 20,
            height: 30,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: const Border.fromBorderSide(
                BorderSide(color: Colors.black26),
              ),
            ),
            child: DecoratedBox(
              decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: const Border.fromBorderSide(
                  BorderSide(color: Colors.grey, width: 2),
                ),
                color: _color,
              ),
            ),
          ),

          const SizedBox(width: 22),

          // CustomHexPicker
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              border: const Border.fromBorderSide(
                  BorderSide(color: Color.fromARGB(255, 90, 89, 89), width: 1),
                ),
              ),
              child: CustomHexPicker(
                color: _color,
                onChanged: (Color value) => super.setState(
                  () => _colorOnChanged(value),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDropdownLandscapeMode() {
    return SizedBox(
      height: 38,
      child: Material(
        type: MaterialType.button,
        color: Theme.of(context).cardColor,
        shadowColor: Colors.black26,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: DropdownButton<_IPicker>(
          iconSize: 32.0,
          isExpanded: true,
          isDense: true,
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20),
          value: _pickers[_index],
          onChanged: (_IPicker? value) => super.setState(
            () => _pickerOnChanged(value),
          ),
          items: _pickers.map(_buildDropdownMenuItems).toList(),
        ),
      ),
    );
  }

  Widget _buildDropdownPortraitMode() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: DropdownButton<_IPicker>(
        iconSize: 32.0,
        isExpanded: true,
        isDense: true,
        style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20),
        value: _pickers[_index],
        onChanged: (_IPicker? value) => super.setState(
          () => _pickerOnChanged(value),
        ),
        items: _pickers.map(_buildDropdownMenuItems).toList(),
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      child: _pickers[_index].builder(context),
    );
  }

  Widget _buildCustomAlphaPicker() {
    return CustomAlphaPicker(
      alpha: _alpha,
      onChanged: (int value) => super.setState(
        () => _alphaOnChanged(value),
      ),
    );
  }

  Orientation _getOrientation(PickerOrientation pickerOrientation) {
    switch (pickerOrientation) {
      case PickerOrientation.inherit:
        return MediaQuery.of(context).orientation;
      case PickerOrientation.portrait:
        return Orientation.portrait;
      case PickerOrientation.landscape:
        return Orientation.landscape;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = _getOrientation(widget.pickerOrientation);

    switch (orientation) {
      case Orientation.portrait:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // _buildDropdownPortraitMode(),
            _buildBody(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: _buildCustomAlphaPicker(),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
               child: _buildHead(),
             ),
          ],
        );

      case Orientation.landscape:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildHead(),
                  _buildDropdownLandscapeMode(),
                  _buildCustomAlphaPicker(),
                ],
              ),
            ),
            Expanded(
              child: _buildBody(),
            )
          ],
        );
    }
  }
}

class _IPicker {
  _IPicker({
    required this.name,
    required this.picker,
    required this.builder,
  });

  String name;
  Picker picker;
  WidgetBuilder builder;
}

/// Color palette and color slider.
class CustomPaletteHuePicker extends StatefulWidget {
  const CustomPaletteHuePicker({
    required this.color,
    required this.onChanged,
    this.paletteHeight = 280,
    this.palettePadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),
    this.hueBorder,
    this.hueBorderRadius,
    this.hueHeight = 20,
    this.paletteBorder,
    this.paletteBorderRadius,
    Key? key,
  }) : super(key: key);

  final HSVColor color;
  final ValueChanged<HSVColor> onChanged;
  final double paletteHeight;
  final EdgeInsets palettePadding;
  final Border? hueBorder;
  final double hueHeight;
  final BorderRadius? hueBorderRadius;
  final Border? paletteBorder;
  final BorderRadius? paletteBorderRadius;

  @override
  State<CustomPaletteHuePicker> createState() => _CustomPaletteHuePickerState();
}

class _CustomPaletteHuePickerState extends State<CustomPaletteHuePicker> {
  HSVColor get color => widget.color;

  // Hue
  void hueOnChange(double value) => widget.onChanged(
        color.withHue(value),
      );
  List<Color> get hueColors => <Color>[
        color.withHue(0.0).toColor(),
        color.withHue(60.0).toColor(),
        color.withHue(120.0).toColor(),
        color.withHue(180.0).toColor(),
        color.withHue(240.0).toColor(),
        color.withHue(300.0).toColor(),
        color.withHue(0.0).toColor()
      ];

  // Saturation Value
  void saturationValueOnChange(Offset value) => widget.onChanged(
        HSVColor.fromAHSV(color.alpha, color.hue, value.dx, value.dy),
      );
  // Saturation
  List<Color> get saturationColors => <Color>[
        Colors.white,
        HSVColor.fromAHSV(1.0, color.hue, 1.0, 1.0).toColor(),
      ];
  // Value
  final List<Color> valueColors = <Color>[
    Colors.transparent,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Palette
        SizedBox(
          height: widget.paletteHeight,
          child: Padding(
            padding: widget.palettePadding,
            child: PalettePicker(
              border: widget.paletteBorder,
              borderRadius: widget.paletteBorderRadius,
              position: Offset(color.saturation, color.value),
              onChanged: saturationValueOnChange,
              leftRightColors: saturationColors,
              topPosition: 1.0,
              bottomPosition: 0.0,
              topBottomColors: valueColors,
            ),
          ),
        ),

        // Slider
        Padding(
          padding: widget.palettePadding,
          child: CustomSliderPicker(
            max: 360.0,
            border: widget.hueBorder,
            height: 15,
            borderRadius: BorderRadius.circular(50),
            value: color.hue,
            onChanged: hueOnChange,
            colors: hueColors,
          ),
        )
      ],
    );
  }
}

/// Slider for selecting a value between 0 and 1.
class CustomSliderPicker extends StatefulWidget {
  const CustomSliderPicker({
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.colors,
    this.child,
    this.borderRadius = _CustomSliderPickerState._defaultBorderRadius,
    this.border = const Border.fromBorderSide(BorderSide(color: Colors.grey)),
    this.height = 40,
    Key? key,
  })  : assert(value >= min && value <= max),
        super(key: key);
  final Border? border;
  final double height;
  final BorderRadius? borderRadius;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final List<Color>? colors;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _CustomSliderPickerState();
}

class _CustomSliderPickerState extends State<CustomSliderPicker> {
  static const _defaultBorderRadius = BorderRadius.all(Radius.circular(20.0));

  double get value => widget.value;
  double get min => widget.min;
  double get max => widget.max;

  double getRatio() => ((value - min) / (max - min)).clamp(0.0, 1.0);
  void setRatio(double ratio) => widget.onChanged(
        (ratio * (max - min) + min).clamp(min, max),
      );

  void onPanUpdate(DragUpdateDetails details, BoxConstraints box) {
    final RenderBox? renderBox = super.context.findRenderObject() as RenderBox?;
    final Offset offset =
        renderBox?.globalToLocal(details.globalPosition) ?? Offset.zero;
    final double ratio = offset.dx / box.maxWidth;
    super.setState(() => setRatio(ratio));
  }

  Widget buildSlider(double maxWidth) {
    return SizedBox(
      width: maxWidth,
      height: widget.height,
      child: CustomMultiChildLayout(
        delegate: _SliderLayout(),
        children: <Widget>[
          // Track
          LayoutId(
            id: _SliderLayout.track,
            child: (widget.colors == null)
                ?

                // Child
                DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: widget.borderRadius,
                      border: widget.border,
                    ),
                    child: ClipRRect(
                      borderRadius: widget.borderRadius ?? _defaultBorderRadius,
                      child: widget.child,
                    ),
                  )
                :

                // Color
                DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: widget.borderRadius,
                      border: widget.border,
                      gradient: LinearGradient(colors: widget.colors!),
                    ),
                  ),
          ),

          // Thumb
          LayoutId(
            id: _SliderLayout.thumb,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(
                  _ThumbPainter.getWidth(getRatio(), maxWidth),
                ),
              child: CustomPaint(
                painter: _ThumbPainter(),
              ),
            ),
          ),

          // GestureContainer
          LayoutId(
            id: _SliderLayout.gestureContainer,
            child: LayoutBuilder(builder: buildGestureDetector),
          )
        ],
      ),
    );
  }

  Widget buildGestureDetector(BuildContext context, BoxConstraints box) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails detail) => onPanUpdate(detail, box),
      child: Container(
        color: const Color(0x00000000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints box) =>
            buildSlider(box.maxWidth),
      ),
    );
  }
}

/// Slider
class _SliderLayout extends MultiChildLayoutDelegate {
  static const String track = 'track';
  static const String thumb = 'thumb';
  static const String gestureContainer = 'gesturecontainer';

  @override
  void performLayout(Size size) {
    // Track
    super.layoutChild(
      track,
      BoxConstraints.tightFor(
          width: size.width, height:size.height),
    );
    super.positionChild(
      track,
      Offset(0.0, size.height / 2 - _ThumbPainter.trackWidth),
    );

    // Thumb
    super.layoutChild(
      thumb,
      BoxConstraints.tightFor(width: 10.0, height: size.height / 2),
    );
    super.positionChild(
      thumb,
      Offset(0.0, 0.0),
    );

    // GestureContainer
    super.layoutChild(
      gestureContainer,
      BoxConstraints.tightFor(width: size.width, height: size.height),
    );
    super.positionChild(gestureContainer, Offset.zero);
  }

  @override
  bool shouldRelayout(_SliderLayout oldDelegate) => false;
}

/// Thumb
class _ThumbPainter extends CustomPainter {
  static double width = 5;
  static double trackWidth = 14;
  static double doubleTrackWidth = 28;
  static double getWidth(double value, double maxWidth) =>
      (maxWidth - trackWidth - trackWidth) * value + trackWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final Paint paintBlack = Paint()
      ..color = Colors.black
      ..strokeWidth = 0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset.zero, _ThumbPainter.width, paintBlack);
    canvas.drawCircle(Offset.zero, _ThumbPainter.width, paintWhite);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Slider for selecting the alpha value (0-255).
class CustomAlphaPicker extends StatefulWidget {
  const CustomAlphaPicker({
    required this.alpha,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int alpha;
  final ValueChanged<int> onChanged;

  @override
  State<StatefulWidget> createState() => _CustomAlphaPickerState();
}

class _CustomAlphaPickerState extends State<CustomAlphaPicker> {
  void valueOnChanged(double ratio) {
    widget.onChanged(ratio.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Alpha
        // SliderTitle('A', widget.alpha.toString()),
        CustomSliderPicker(
          value: widget.alpha.toDouble(),
          max: 255.0,
          height: 15,
          onChanged: valueOnChanged,
          child: CustomPaint(
            painter: _AlphaTrackPainter(),
          ),
        )
      ],
    );
  }
}

// Track
class _AlphaTrackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double side = size.height / 2;
    final Paint paint = Paint()..color = Colors.black12;

    for (int i = 0; i * side < size.width; i++) {
      if (i % 2 == 0) {
        canvas.drawRect(Rect.fromLTWH(i * side, 0, side, side), paint);
      } else {
        canvas.drawRect(Rect.fromLTWH(i * side, side, side, side), paint);
      }
    }

    final Rect rect = Offset.zero & size;
    const Gradient gradient = LinearGradient(
      colors: <Color>[Colors.transparent, Colors.grey],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





/// Textfield for entering the Hex color code (RRGGBB).
class CustomHexPicker extends StatefulWidget {
  CustomHexPicker({
    required this.color,
    required this.onChanged,
    Key? key,
  })  : _controller = TextEditingController(
          text: _Hex.colorToString(color).toUpperCase(),
        ),
        super(key: key);

  final Color color;
  final ValueChanged<Color> onChanged;
  final TextEditingController _controller;

  @override
  State<CustomHexPicker> createState() => _CustomHexPickerState();
}

class _CustomHexPickerState extends State<CustomHexPicker> {
  void textOnSubmitted(String value) => widget.onChanged(
        textOnChenged(value),
      );
  Color textOnChenged(String text) {
    final String? hex = _Hex.textSubString(text);
    if (hex == null) return widget.color;

    try {
      return _Hex.intToColor(_Hex.stringToInt(hex));
    } catch (_) {
      return widget.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '#',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14, color: Colors.white),
          ),
        ),

        // TextField
        Expanded(
          child: TextField(
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 14,color: Colors.white),
            focusNode: FocusNode()..addListener(() {}),
            controller: widget._controller,
            onSubmitted: textOnSubmitted,
            decoration: const InputDecoration.collapsed(hintText: 'hex code'),
          ),
        )
      ],
    );
  }
}

class _Hex {
  // Hex Number To Color
  static Color intToColor(int hexNumber) => Color.fromARGB(
        255,
        (hexNumber >> 16) & 0xFF,
        (hexNumber >> 8) & 0xFF,
        (hexNumber >> 0) & 0xFF,
      );

  // String To Hex Number
  static int stringToInt(String hex) => int.parse(hex, radix: 16);

  // String To Color
  static String colorToString(Color color) =>
      _colorToString(
        color.red.toRadixString(16),
      ) +
      _colorToString(
        color.green.toRadixString(16),
      ) +
      _colorToString(
        color.blue.toRadixString(16),
      );
  static String _colorToString(String text) =>
      text.length == 1 ? '0$text' : text;

  // Subste
  static String? textSubString(String? text) {
    if (text == null) return null;

    if (text.length < 6) return null;

    if (text.length == 6) return text;

    return text.substring(text.length - 6, 6);
  }
}
