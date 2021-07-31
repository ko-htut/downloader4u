import 'dart:io';
import 'package:downloader4u/exceptions/exception.dart';
import 'package:downloader4u/model/data/link_model.dart';
import 'package:downloader4u/modules/home/repositories/home_repo.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  HomeRepository _repo = Modular.get<HomeRepository>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  Map<String, String>? cookie = {};

  @observable
  LinkModel? model;

  @action
  Future getCookie({
    required Function onSuccess,
  }) async {
    try {
      Map<String, String> headers = {};
      isLoading = true;
      var data = await _repo.getCookei();
      String rawCookie = data.headers["set-cookie"]!;
      if (rawCookie != null) {
        int index = rawCookie.indexOf(';');
        headers['Cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      cookie = headers;
      print(headers.length);

      isLoading = false;

      onSuccess();
    } on SocketException {
      await _repo.getCookei();
      isLoading = false;
      errorMessage = "No internet";
      print("No internet");
    } catch (e) {
      await _repo.getCookei();
      isLoading = false;
      errorMessage = e.toString();
      print(errorMessage);
    }
  }

  @action
  Future sentLink(
      {required String link,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) async {
    //
    try {
      isLoading = true;
      model = await _repo.sentLink(link: link);
      isLoading = false;
    } on SocketException {
      await _repo.sentLink(link: link);
      isLoading = false;
      errorMessage = "No internet";
    } catch (e) {
      await _repo.sentLink(link: link);
      isLoading = false;
      errorMessage = e.toString();
    }
  }

  @action
  Future gcSentLink(
      {required String link,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) async {
    try {
      isLoading = true;
      model = await _repo.gcSentLink(link: link);
      isLoading = false;
    } on SocketException {
      await _repo.gcSentLink(link: link);
      isLoading = false;
      errorMessage = "No internet";
      onFailed(ExceptionMessage("No internet"));
    } catch (e) {
      await _repo.gcSentLink(link: link);
      isLoading = false;
      errorMessage = e.toString();
      onFailed(ExceptionMessage(e.toString()));
    }
  }

  @action
  Future keywordSearch(
      {required String keyword,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) async {
    try {
      isLoading = true;
      model = await _repo.keywordSearch(keyword: keyword, search: "cmsearch");
      isLoading = false;
    } on SocketException {
      model = await _repo.keywordSearch(keyword: keyword, search: "cmsearch");
      isLoading = false;
      errorMessage = "No internet";
      onFailed(ExceptionMessage("No internet"));
    } catch (e) {
      model = await _repo.keywordSearch(keyword: keyword, search: "cmsearch");
      isLoading = false;
      errorMessage = e.toString();
      onFailed(ExceptionMessage(e.toString()));
    }
  }
}
