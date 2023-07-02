

import 'package:flutter/material.dart';
import 'package:projects/Pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';


  class SignUp extends StatefulWidget {
  const SignUp({super.key});




  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseUser courentUtil;

  //collection utilisateurs depuis Firestore

  final CollectionReference collectionUtil = Firestore.instance.collection('Utilisateurs');


  String nom = '';
  String password = '';
  String email = '';
  String conpassword = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    FirebaseAuth.instance.currentUser?.then((FirebaseUser? util){
      setState(() {
        courentUtil = util;
      });
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/login.png',
                  height: 100,
                  width: 100,
                ),
                const Center(
                  child: Text(
                    'Inscrivez-vous',
                    style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom complet',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val!.isEmpty ? 'Nom complet invalide' : toString(),
                    onChanged: (val) => nom = val,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val!.isEmpty ? 'Email invalide' : toString(),
                    onChanged: (val) => email = val,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de Passe',
                    border: OutlineInputBorder(),
                    
                  ),
                  
                  validator: (val) => val!.length<8 ? 'Mot de passe pas assez long' : toString(),
                    onChanged: (val) => password = val,
                    obscureText: true,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => conpassword != password ? 'Retaper le mot de passe' : toString(),
                    onChanged: (val) => conpassword = val,
                    obscureText: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                       //TODO: Appliquer la logique

                      }
                    },
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                         PageRouteBuilder(pageBuilder: (_, __, ___) => Login()
                         ),
                         );
                    },
                    child: Text(
                      'Avez vous deja un compte ?',
                      style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.black),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                    SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                         PageRouteBuilder(pageBuilder: (_, __, ___) => Home()
                         ),
                         );
                    },
                    child: Text(
                      'Accueil',
                      style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.black),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class Firestore {
  static var instance;
}

class FirebaseUser {
}
