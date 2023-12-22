import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class DefaultCanvas extends StatefulWidget {
   DefaultCanvas({super.key, required this.formKey, this.textinput});

  final GlobalKey<FormState> formKey;
           String? textinput;


  @override
  State<DefaultCanvas> createState() => _DefaultCanvasState();
}

class _DefaultCanvasState extends State<DefaultCanvas> {

  final textcontroller = TextEditingController();
  final text2controller = TextEditingController();
String? _text2= "";

  
  @override
  Widget build(BuildContext context) {
            final hackathonDetailsProvider = Provider.of<HackathonDetailsProvider>(context);

    return Expanded(
      flex: 8698,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: widget.formKey,
          child: ListView(
            children: [
              Container(
                height: scaleHeight(context, 615),
                width: double.infinity,
                color: Colors.blue[100],
                child: 
                  Column(
                    children: [
                      TextFormField(
                      controller: text2controller,
                      
                      onSaved: (value) {
                        hackathonDetailsProvider.hackathonName = value.toString();
                      },

            decoration: InputDecoration(
              hintText: "TextField"
            ),
          ),


           TextFormField(
                  controller: textcontroller,
                  onSaved: (value) {
                    _text2 = value;
                  },

            decoration: InputDecoration(
              hintText: "Hackathon Name"
            ),
          ),
                    ],
                  ),


          
              ),
              InkWell(
                onTap: (){
                  if(widget.formKey.currentState!.validate()){
                  widget.formKey.currentState!.save();

                  hackathonDetailsProvider.hackathonName=_text2.toString();
                  Navigator.pushNamed(context, '/defaultTemplate');

                }
                },
                child: Container(
                  height: scaleHeight(context, 615),
                  width: double.infinity,
                  color: Colors.pink[100],
                ),
              ),
              Container(
                height: scaleHeight(context, 615),
                width: double.infinity,
                color: Colors.brown[300],
              ),
              Container(
                height: scaleHeight(context, 400),
                width: double.infinity,
                color: Colors.purple[200],
              ),
              Container(
                height: scaleHeight(context, 60),
                width: double.infinity,
                color: grey4,
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
