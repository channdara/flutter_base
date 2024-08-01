import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../model/base_pagination_item.dart';

class PaginationScrollController extends ScrollController {
  final List<BasePaginationItem> _mainList = [];
  bool _hasNext = true;
  bool _callbackCalled = false;

  int get itemCount => _mainList.length;

  List<BasePaginationItem> get mainList =>
      _mainList.whereNot((e) => e is BasePaginationLoading).toList();

  @override
  void dispose() {
    _mainList.clear();
    _hasNext = true;
    _callbackCalled = false;
    super.dispose();
  }

  BasePaginationItem getItem(int index) => _mainList[index];

  void appendData({
    required List<BasePaginationItem> data,
    required bool hasNext,
    bool clearMainList = false,
  }) {
    _hasNext = hasNext;
    _callbackCalled = false;
    if (clearMainList) {
      _mainList.clear();
      animateToTop();
    }
    if (_mainList.isNotEmpty && _mainList.last is BasePaginationLoading) {
      _mainList.removeLast();
    }
    _mainList.addAll(data);
    if (data.isNotEmpty && hasNext) {
      _mainList.add(BasePaginationLoading());
    }
  }

  void setupScrollListener({
    required VoidCallback callback,
    double reserveSpace = 0.0,
  }) {
    addListener(() {
      final maxScrollExtent = position.maxScrollExtent;
      final calculate = maxScrollExtent * reserveSpace.clamp(0.0, 1.0);
      final reserve = maxScrollExtent - calculate;
      final reachOffset = offset >= reserve;
      final inRange = !position.outOfRange;
      if (reachOffset && inRange && _hasNext && !_callbackCalled) {
        _callbackCalled = true;
        callback();
      }
    });
  }

  void animateToTop() {
    if (!hasClients) return;
    const duration = Duration(milliseconds: 200);
    animateTo(0.0, duration: duration, curve: Curves.linear);
  }
}
