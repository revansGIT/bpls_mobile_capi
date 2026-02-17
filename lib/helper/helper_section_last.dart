import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHighlightController {
  ErrorHighlightController({VoidCallback? onChange}) : _onChange = onChange;

  final VoidCallback? _onChange;
  final Map<String, bool> _states = {};
  final Map<String, Timer?> _timers = {};

  void setHighlight(String key, {Duration duration = const Duration(seconds: 5)}) {
    _states[key] = true;
    _timers[key]?.cancel();
    _timers[key] = Timer(duration, () => clearHighlight(key));
    _onChange?.call();
  }

  void clearHighlight(String key) {
    _states[key] = false;
    _timers[key]?.cancel();
    _timers[key] = null;
    _onChange?.call();
  }

  bool hasHighlight(String key) => _states[key] ?? false;

  void dispose() {
    for (final timer in _timers.values) {
      timer?.cancel();
    }
    _timers.clear();
    _states.clear();
  }
}

Map<String, GlobalKey> buildLossKeys(int length) {
  final keys = <String, GlobalKey>{};
  for (int i = 0; i < length; i++) {
    keys['IF-$i'] = GlobalKey();
    keys['MUON-$i'] = GlobalKey();
    keys['RE-$i'] = GlobalKey();
  }
  return keys;
}

void showErrorAndScroll(String message, {GlobalKey? key, FocusNode? focusNode, ErrorHighlightController? highlightController}) {
  Get.snackbar('ত্রুটি', message, backgroundColor: Colors.red, colorText: Colors.white);
  if (key != null) {
    highlightController?.setHighlight(key.toString());
  }
  if (key != null && key.currentContext != null) {
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 300), alignment: 0.1);
  }
  focusNode?.requestFocus();
}

Widget buildErrorHighlightWrapper({required GlobalKey key, required Widget child, required bool hasError}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    key: key,
    padding: hasError ? const EdgeInsets.all(12) : EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: hasError ? Colors.red.shade400 : Colors.transparent, width: hasError ? 2 : 0),
      color: hasError ? Colors.red.shade50 : Colors.transparent,
    ),
    child: child,
  );
}

class CenteredHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minExtent;
  final double maxExtent;

  CenteredHeaderDelegate({required this.child, required this.minExtent, required this.maxExtent});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
