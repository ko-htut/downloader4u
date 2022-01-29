import 'package:downloader4u/modules/home/store/home_store.dart';
import 'package:downloader4u/modules/home/store/search_store.dart';
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

  SearchStore _searchStore = Modular.get<SearchStore>();
  HomeStore _homeStore = Modular.get<HomeStore>();
  final key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchStore.intSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    if (widget.isLink == false) {
                      //
                    } else {
                      _searchStore.sentLink(
                        link: _searchController.text,
                        onSuccess: () {
                          //
                        },
                        onFailed: (v) {
                          //
                        },
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          !widget.isLink
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Wrap(
                    children: _homeStore.support
                        .map((element) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.cyan[100],
                            ),
                            padding: EdgeInsets.all(3),
                            margin: EdgeInsets.all(1.5),
                            child: Text(
                              element!.name,
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            )))
                        .toList(),
                  ),
                )
              : Container(),
          Expanded(child: _prepare())
        ],
      ),
    );
  }

  Widget _prepare() {
    return Observer(builder: (context) {
      if (_searchStore.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        );
      }
      if (_searchStore.model == null) {
        return Column(
          children: [
            Container(),
            _searchStore.errorMessage != null
                ? Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 70),
                    child: Text(
                      _searchStore.errorMessage!,
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
                (_searchStore.model!.image != null)
                    ? Image.network(
                        _searchStore.model!.image ?? "",
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                        width: 150,
                      )
                    : SizedBox(),
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
                        _searchStore.model!.title ?? "No Title",
                        style: TextStyle(
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
                        ),
                        child: Text(
                          _searchStore.model!.source ?? "False",
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
                    "total link ${_searchStore.model!.downloadUrls?.length}",
                    style: TextStyle(
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
              children: _searchStore.model!.downloadUrls!.map((v) {
                var index = _searchStore.model!.downloadUrls!.indexOf(v);
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                v ?? "error",
                                style: TextStyle(
                                  color: Colors.green,
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
                                child: Icon(Icons.open_in_new,
                                    color: Colors.blue)),
                          ],
                        )
                      ],
                    ),
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
