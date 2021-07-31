import 'package:downloader4u/modules/home/home_module.dart';
import 'package:downloader4u/modules/home/home_route.dart';
import 'package:downloader4u/utils/route_utils.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloader 4u"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    RouteUtils.changeRoute<HomeModule>(HomeRoute.search,args: true);
                  },
                  child: Card(
                    child: Container(
                        height: 65,
                        child: Center(
                            child: Text(
                          "Search by link",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ))),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Container(
                      height: 65,
                      child: Center(
                        child: Text(
                          "Search by Keyword",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: Card(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    """TxT :D
                  1: balar balar balar
                  1: balar balar balar
                  """,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
