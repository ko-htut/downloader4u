import 'package:downloader4u/modules/home/store/home_store.dart';
import 'package:downloader4u/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_route.dart';

class SplashWidget extends StatefulWidget {
  SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  HomeStore _homeStore = Modular.get<HomeStore>();

  bool _isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeStore.getCookie(onSuccess: () {
      setState(
        () {
          _isloading = false;
        },
      );
      RouteUtils.goPageInHomeModule(routeName: HomeRoute.root, isReplace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Splash Screen",
              style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            _isloading == true
                ? CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                  )
                : Text("Success")
          ],
        ),
      ),
    );
  }
}
