import 'package:downloader4u/modules/home/home_module.dart';
import 'package:downloader4u/modules/home/home_route.dart';
import 'package:downloader4u/modules/home/store/home_store.dart';
import 'package:downloader4u/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeStore.initHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloader 4u"),
        // backgroundColor: Colors.white,
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      RouteUtils.changeRoute<HomeModule>(HomeRoute.search,
                          args: true);
                    },
                    child: Card(
                      child: Container(
                          height: 45,
                          child: Center(
                              child: Text(
                            "Search by link",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ))),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      RouteUtils.changeRoute<HomeModule>(HomeRoute.search,
                          args: false);
                    },
                    child: Card(
                      child: Container(
                          height: 45,
                          child: Center(
                            child: Text(
                              "Search by Keyword",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("We Support :"),
                    ),
                    Wrap(
                      children: _homeStore.support
                          .map((element) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.cyan[100],
                              ),
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(2),
                              child: Text(
                                element!.name,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w500),
                              )))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      """FAQ or Usage. ဒီဟာကိုဘယ်လိုသုံးရမလဲ?
 ဒီ link မှာ ကြည့်ပါ How to Use?
What types of links we support? ဘယ် links တွေရလဲ?
Check the following Lists.
အောက်မှာပြထားတဲ့ links ပုံစံတူ links တွေအကုန်ထည့်သုံးလို့ရပါတယ်
တစ်ခုချင်းစီကို click နိပ်ကြည့်ပါ
                      """,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
              ),
            )
          ],
        );
      }),
    );
  }
}
