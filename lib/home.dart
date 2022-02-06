
import 'package:cimilo_app/serach.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'image/bg.jpeg',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              const Text(
                'Welcome to',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white.withOpacity(0.55),
                ),
                child: Text(
                  'Weather App 🌦',
                  style: GoogleFonts.breeSerif(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white.withOpacity(0.65),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Search()));
        },
        label: const Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
