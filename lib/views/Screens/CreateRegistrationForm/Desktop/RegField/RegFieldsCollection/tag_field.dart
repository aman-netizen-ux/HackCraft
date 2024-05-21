import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class TagField extends StatefulWidget {
  final List<String> options;
  final bool create, required;
  final String question;
  final String error;

  const TagField(
      {Key? key,
      required this.question,
      required this.options,
      required this.create,
      required this.error,
      required this.required})
      : super(key: key);

  @override
  State<TagField> createState() => _TagFieldState();
}

class _TagFieldState extends State<TagField> {
  final List<String> _tags = [];
  final TextEditingController _controller = TextEditingController();
  final List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.create ? scaleWidth(context, 10) : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 20),
                    bottom: scaleHeight(context, 10)),
                child: Text(
                  widget.question,
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontSize: heightScaler(context, 14),
                    fontWeight: FontWeight.w500,
                    color: black1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: _buildTagChips(),
                        ),
                        if (widget.create)
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Add a tag',
                                  ),
                                  onSubmitted: (tag) {
                                    setState(() {
                                      _tags.add(tag);
                                      _controller.clear();
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  String tag = _controller.text.trim();
                                  if (tag.isNotEmpty) {
                                    setState(() {
                                      _tags.add(tag);
                                      _controller.clear();
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 16),
                  ),
                 Text(
                    "REQUIRED",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 16),
                        color:
                            widget.required ? midnigthBlue : Colors.transparent,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: widget.create ? scaleWidth(context, 50) : 0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTagChips() {
    if (widget.create) {
      return _tags.map((tag) {
        return Chip(
          label: Text(tag),
          onDeleted: () {
            setState(() {
              _tags.remove(tag);
            });
          },
        );
      }).toList();
    } else {
      return widget.options.map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: _selectedTags.contains(option),
          onSelected: (isSelected) {
            setState(() {
              if (isSelected) {
                _selectedTags.add(option);
              } else {
                _selectedTags.remove(option);
              }
            });
          },
        );
      }).toList();
    }
  }
}
