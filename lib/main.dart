import 'package:blood_donation/donator_model.dart';
import 'package:blood_donation/screens/donate_blood_screen.dart';
import 'package:blood_donation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

main(){
  runApp(MaterialApp(home:Home()));

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseDatabase database;
  DatabaseReference donatorRef;
  TextEditingController tybeController;
  List<Donator> donators;

  @override
  void initState() {
    database=FirebaseDatabase();
    donatorRef=database.reference().child("donators");
    tybeController=TextEditingController();
    donators=[];
    print(donatorRef.root().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: appBarText,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:16.0),
            child: IconButton(
              icon: Icon(Icons.add,size: 40,),
              color: Colors.white,
              highlightColor: Colors.white,
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (c){
                      return DonateBloodScreen();
                    }
                  ));
              },
            ),
          )
        ],
      ),



      body:  Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          children: <Widget>[
          SizedBox(height: 50,),
            TextField(decoration: InputDecoration(
              icon: Icon(Icons.search,),
              hintText: "blood tybe",
              hintStyle: hintStyle,
              contentPadding: inputPadding,
            )
                ,controller: tybeController,
              ),
              SizedBox(height: 40,),
                Center(
                  child: FlatButton(
                   child: Text("search",style: TextStyle(color: Colors.white,fontSize: 22),),
               color: Colors.red.shade300,
               highlightColor: Colors.red.shade600,
               onPressed: ()async {
                       await search();
                                      },
                                         ),
                                       ),
                                       SizedBox(height: 50,),
                                       
                                     
                                 ],
                               ),
                             ),
                       
                       
                       
                       
                       
                       
                           );
                         }
                      
      search() async{
               
              var query=donatorRef.limitToFirst(20)
              .orderByChild("bloodTybe")
              .equalTo(tybeController.value.text)
              .once().then((DataSnapshot snap){
                  print(snap.value);
                  // donators.add(Donator.fromJson(snap.value));
              });
              
                    }
}
