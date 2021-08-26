import 'package:downloader4u/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchWidget extends StatefulWidget {
  final bool isLink;
  SearchWidget({Key? key, required this.isLink}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();

  HomeStore _homeStore = Modular.get<HomeStore>();
  final key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Search",
                      fillColor: Colors.grey[200]!,
                      hintStyle: TextStyle(
                        fontFamily: 'pyidaungsu',
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200]!, width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200]!, width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    // onFieldSubmitted: (_) => MethodUtils.fieldFocusChange(
                    //     context, _phoneFocus, _messageFocus),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "type link";
                      else
                        return null;
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    _homeStore.sentLink(
                        link: _searchController.text,
                        onSuccess: () {
                          //
                        },
                        onFailed: (v) {
                          //
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: _prepare())
        ],
      ),
    );
  }

  Widget _prepare() {
    return Observer(builder: (context) {
      if (_homeStore.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        );
      }
      if (_homeStore.model == null) {
        return Column(
          children: [
            Container(),
            _homeStore.errorMessage != null
                ? Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 70),
                    child: Text(
                      _homeStore.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : SizedBox()
          ],
        );
      }
      return _data();
    });
  }

  Widget _data() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  _homeStore.model!.image!,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 150,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                  width: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _homeStore.model!.title ?? "No Title",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green[50]),
                        child: Text(
                          _homeStore.model!.source ?? "False",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green[100]),
              child: Row(
                children: [
                  Icon(
                    Icons.link,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "total link ${_homeStore.model!.downloadUrls!.length}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: _homeStore.model!.downloadUrls!.map((v) {
                var index = _homeStore.model!.downloadUrls!.indexOf(v);
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Link $index",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              v ?? "error",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(new ClipboardData(text: v));
                              key.currentState!.showSnackBar(new SnackBar(
                                content: new Text("Copied to Clipboard"),
                              ));
                            },
                            child: Icon(
                              Icons.copy,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () async {
                                if (await canLaunch(v!)) {
                                  await launch(v);
                                } else {
                                  // can't launch url
                                }
                              },
                              child: Icon(Icons.share)),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
