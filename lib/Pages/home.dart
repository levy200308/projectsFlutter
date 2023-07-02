// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:projects/Pages/SignUp.dart';

import 'Login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/logo.png',
              height: 400,
              width: 3050,
            ),
            Padding(padding: EdgeInsets.only(bottom: 150)),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => Login()));
                },
                child: Text(
                  'Connexion',
                  style: TextStyle(
                      fontSize: 25, fontFamily: 'Poppins', color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => SignUp()),
                  );
                },
                child: Text(
                  's\'inscrire',
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
    );
  }
}
