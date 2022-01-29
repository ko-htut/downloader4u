// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_SearchStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SearchStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$modelAtom = Atom(name: '_SearchStoreBase.model');

  @override
  LinkModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(LinkModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$keywordAtom = Atom(name: '_SearchStoreBase.keyword');

  @override
  String? get keyword {
    _$keywordAtom.reportRead();
    return super.keyword;
  }

  @override
  set keyword(String? value) {
    _$keywordAtom.reportWrite(value, super.keyword, () {
      super.keyword = value;
    });
  }

  final _$sentLinkAsyncAction = AsyncAction('_SearchStoreBase.sentLink');

  @override
  Future<dynamic> sentLink(
      {required String link,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) {
    return _$sentLinkAsyncAction.run(() =>
        super.sentLink(link: link, onSuccess: onSuccess, onFailed: onFailed));
  }

  final _$keywordSearchAsyncAction =
      AsyncAction('_SearchStoreBase.keywordSearch');

  @override
  Future<dynamic> keywordSearch(
      {required String keyword,
      required String type,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) {
    return _$keywordSearchAsyncAction.run(() => super.keywordSearch(
        keyword: keyword,
        type: type,
        onSuccess: onSuccess,
        onFailed: onFailed));
  }

  final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase');

  @override
  void intSearch() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.intSearch');
    try {
      return super.intSearch();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
model: ${model},
keyword: ${keyword}
    ''';
  }
}
