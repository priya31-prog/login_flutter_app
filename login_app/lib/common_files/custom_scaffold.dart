import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final Drawer? drawer;
  final bool? extendBodyBehindAppBar;

  const CustomScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.extendBodyBehindAppBar,
  });

  final LinearGradient bodyGradient = const LinearGradient(
    colors: [Colors.greenAccent, Colors.white12],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: bodyGradient),
        child: Padding(padding: const EdgeInsets.only(bottom: 20), child: body),
      ),
      floatingActionButton: floatingActionButton,
      drawer: drawer,
    );
  }
}
