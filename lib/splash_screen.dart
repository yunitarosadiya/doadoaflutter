import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {
        super.initState();
        Timer(const Duration(seconds: 3), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 350,
                    fit: BoxFit.contain,
                ),
            ),
        );
    }
}