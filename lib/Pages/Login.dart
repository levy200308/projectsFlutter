
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:projects/Pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';


class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nom = '';
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'images/login.png',
                    height: 100,
                    width: 100,
                  ),
                const  Center(
                    child: Text(
                      'Connecter-Vous',
                      style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                  ),
                const  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nom complet',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty ? 'Nom complet invalide' : toString(),
                    onChanged: (val) => nom = val,
                  ),
                const  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                     validator: (val) => val!.isEmpty ? 'Email invalide' : toString(),
                    onChanged: (val) => email = val,
                  ),
                const  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                    ),
                     validator: (val) => val!.isEmpty ? 'Password incorrecte' : toString(),
                    onChanged: (val) => password = val,
                    obscureText: true,
                  ),
                const  SizedBox(height: 40,),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       //TODO: Appliquer la logique

                      }
                    },
                     child: Text('Connexion',style: TextStyle(fontSize: 25,fontFamily: 'Poppins'),),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     ),),
                  ),
                   const  SizedBox(height: 40,),
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(onPressed: () {
                      Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => SignUp()
                      ),
                      );
                    },
                     child: Text('Creer deja un compte ?',style: TextStyle(fontSize: 25,fontFamily: 'Poppins'),),
                     style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0,color: Colors.black),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     ),),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
