// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_HomeStoreBase.errorMessage');

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

  final _$cookieAtom = Atom(name: '_HomeStoreBase.cookie');

  @override
  Map<String, String>? get cookie {
    _$cookieAtom.reportRead();
    return super.cookie;
  }

  @override
  set cookie(Map<String, String>? value) {
    _$cookieAtom.reportWrite(value, super.cookie, () {
      super.cookie = value;
    });
  }

  final _$modelAtom = Atom(name: '_HomeStoreBase.model');

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

  final _$getCookieAsyncAction = AsyncAction('_HomeStoreBase.getCookie');

  @override
  Future<dynamic> getCookie({required Function onSuccess}) {
    return _$getCookieAsyncAction
        .run(() => super.getCookie(onSuccess: onSuccess));
  }

  final _$sentLinkAsyncAction = AsyncAction('_HomeStoreBase.sentLink');

  @override
  Future<dynamic> sentLink(
      {required String link,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) {
    return _$sentLinkAsyncAction.run(() =>
        super.sentLink(link: link, onSuccess: onSuccess, onFailed: onFailed));
  }

  final _$gcSentLinkAsyncAction = AsyncAction('_HomeStoreBase.gcSentLink');

  @override
  Future<dynamic> gcSentLink(
      {required String link,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) {
    return _$gcSentLinkAsyncAction.run(() =>
        super.gcSentLink(link: link, onSuccess: onSuccess, onFailed: onFailed));
  }

  final _$keywordSearchAsyncAction =
      AsyncAction('_HomeStoreBase.keywordSearch');

  @override
  Future<dynamic> keywordSearch(
      {required String keyword,
      required Function onSuccess,
      required void Function(ExceptionMessage) onFailed}) {
    return _$keywordSearchAsyncAction.run(() => super.keywordSearch(
        keyword: keyword, onSuccess: onSuccess, onFailed: onFailed));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
cookie: ${cookie},
model: ${model}
    ''';
  }
}
