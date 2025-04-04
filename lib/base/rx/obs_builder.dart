import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ObsBuilder extends StatefulWidget {
  const ObsBuilder({super.key, this.streams = const [], required this.builder});

  final List<Stream> streams;
  final Widget Function(BuildContext context) builder;

  @override
  State<ObsBuilder> createState() => _ObsBuilderState();
}

class _ObsBuilderState extends State<ObsBuilder> {
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription = Rx.merge(widget.streams).listen((_) => setState(() {}));
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
