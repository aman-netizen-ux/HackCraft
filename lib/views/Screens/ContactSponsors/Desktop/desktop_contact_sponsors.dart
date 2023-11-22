import 'package:flutter/material.dart';



class ContactSponsorsDesktopBody extends StatefulWidget {
  const ContactSponsorsDesktopBody({super.key});

  @override
  State<ContactSponsorsDesktopBody> createState() => _ContactSponsorsDesktopBodyState();
}

class _ContactSponsorsDesktopBodyState extends State<ContactSponsorsDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back)
        ),
        const Center(
          child: Text(
            'Contact Sponsors',
            style: TextStyle(
              fontSize: 24
            ),
          ),
        ),
      ],
    );
  }
}

// replace the text with widgets, divide in different files under sections if needed