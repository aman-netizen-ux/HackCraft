import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/mainNavigationProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: (){
             Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        ),
        const Expanded(
          child:  Center(
            child: Text('Profile',
            style: TextStyle(
              fontSize: 24
            ),),
          ),
        ),
      ],
    ),
    );
  }
}

