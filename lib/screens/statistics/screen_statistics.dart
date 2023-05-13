import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 4, 78, 207),
        centerTitle: true,
        title: const Text('Statistics'),
      ),
      body: Center(
        child: Lottie.network(
          'https://assets7.lottiefiles.com/packages/lf20_uxndffhr.json',
          fit: BoxFit.cover,
          repeat: true,
          reverse: true,
          animate: true,
          width: 500,
        ),
      ),
    );
  }
}
