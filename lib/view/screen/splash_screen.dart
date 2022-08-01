import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
                child: Image(
              width: 200,
              image: AssetImage('asset/images/logo.png'),
            )),
            Spacer(),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/main_screen');
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
