import 'package:blood_donation/donator_model.dart';
import 'package:blood_donation/theme.dart' ;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DonateBloodScreen extends StatefulWidget {
  @override
  _DonateBloodScreenState createState() => _DonateBloodScreenState();
}

class _DonateBloodScreenState extends State<DonateBloodScreen> {
  FirebaseDatabase database;
  DatabaseReference donatorRef;
  TextEditingController _nameTextController;
  TextEditingController _phoneTextController;
  TextEditingController _addressTextController;
  TextEditingController _bloodtybeTextController;

 @override
  void initState() {
   database=FirebaseDatabase();
   donatorRef=database.reference().child("donators");
   print(donatorRef.root().toString());
   _nameTextController=TextEditingController();
   _phoneTextController=TextEditingController();
   _addressTextController=TextEditingController();
   _bloodtybeTextController=TextEditingController();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: donationText,
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white70,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            SizedBox(height: 50,),
            TextField(decoration: InputDecoration(
              icon: Icon(Icons.person,),
              hintText: "your name",
              hintStyle: hintStyle,
              contentPadding: inputPadding,
            )
                ,controller: _nameTextController
              ),
            SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                icon: Icon(Icons.phone,),
                hintText: "your phone",
                hintStyle: hintStyle,
                contentPadding: inputPadding
            ),
                controller: _phoneTextController
            ),
            SizedBox(height: 30,),

            TextField(decoration: InputDecoration(
                icon: Icon(Icons.add_location,),
                hintText: "your address",
                hintStyle: hintStyle,
                contentPadding: inputPadding
            ),
            controller: _addressTextController,),
            SizedBox(height: 30,),

            TextField(decoration: InputDecoration(
                icon: Icon(Icons.person,),
                hintText: "your blood tybe",
                hintStyle: hintStyle,
                contentPadding: inputPadding
            ),
            controller: _bloodtybeTextController,),
            SizedBox(height: 70,),
           Center(
             child: FlatButton(
               child: Text("submet",style: TextStyle(color: Colors.white70,fontSize: 22),),
               color: Colors.red.shade300,
               highlightColor: Colors.red.shade600,
               onPressed: () {
print(_nameTextController.value.text);
                 Donator don=Donator(
                   name: _nameTextController.value.text,
                   address: _addressTextController.value.text,
                   phone: _phoneTextController.value.text,
                   bloodTybe: _bloodtybeTextController.value.text
                 );

                 donatorRef.push().set(don.toMap()).then((_){
                   print("added ${don.name}");
                 }).then((_){
                   Navigator.pop(context);
                 });

               },
             ),
           )
          ],
        ),
      )


    );
  }
}
