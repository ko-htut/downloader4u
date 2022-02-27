import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnexpectErrorWidget extends StatefulWidget {
  final FlutterErrorDetails errorDetails;
  const UnexpectErrorWidget({Key? key, required this.errorDetails})
      : super(key: key);

  @override
  _UnexpectErrorWidgetState createState() => _UnexpectErrorWidgetState();
}

class _UnexpectErrorWidgetState extends State<UnexpectErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            Center(
                child: Lottie.asset(
              'assets/lottie/error.json',
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
            )),
             SizedBox(height: 10),
            Text(
              widget.errorDetails.exception.toString(),
              style: const TextStyle(fontSize: 13, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
