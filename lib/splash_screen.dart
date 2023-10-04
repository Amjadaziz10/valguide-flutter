import 'package:flutter/material.dart';

import 'core/shared/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/ui/splashscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B252D),
      body: SafeArea(
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: const AlignmentDirectional(0, 0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'assets/images/val_logo.png',
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'assets/images/splash_val.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              const Text(
                'VALGUIDE',
                style: TextStyle(
                  fontFamily: 'Valorant',
                  color: greyVal,
                  fontSize: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
