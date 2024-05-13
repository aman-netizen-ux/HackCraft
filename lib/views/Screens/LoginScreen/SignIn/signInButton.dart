import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Buttons button;
  final String text;
  final VoidCallback onPressed;

  SignInButton(this.button, {required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blueGrey[700]!;
      }
      return button == Buttons.Google ? Colors.blue : Colors.black;
    }

    IconData getIcon() {
      switch (button) {
        case Buttons.Google:
          return Icons.g_translate;
        case Buttons.GitHub:
          return Icons.code;
        default:
          return Icons.error;
      }
    }

    return ElevatedButton.icon(
      icon: Icon(getIcon(), color: Colors.white),
      label: Text(text, style:const TextStyle(color: Colors.white)),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
         const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      ),
    );
  }
}

enum Buttons { Google, GitHub }
