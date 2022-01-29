import 'dart:io';

import 'package:downloader4u/exceptions/exception.dart';
import 'package:downloader4u/model/data/link_model.dart';
import 'package:downloader4u/modules/home/repositories/home_repo.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  HomeRepository _repo = Modular.get<HomeRepository>();
  //

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  LinkModel? model;

  @observable
  String? keyword;

  @action
  void intSearch() {
    errorMessage = null;
    model = null;
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
  Future keywordSearch(
      {required String keyword,
      required String type,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) async {
    try {
      isLoading = true;
      model = await _repo.keywordSearch(keyword: keyword, search: type);
      isLoading = false;
    } on SocketException {
      model = await _repo.keywordSearch(keyword: keyword, search: type);
      isLoading = false;
      errorMessage = "No internet";
      onFailed(ExceptionMessage("No internet"));
    } catch (e) {
      model = await _repo.keywordSearch(keyword: keyword, search: type);
      isLoading = false;
      errorMessage = e.toString();
      onFailed(ExceptionMessage(e.toString()));
    }
  }
}
