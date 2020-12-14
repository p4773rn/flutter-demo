import 'dart:developer';

import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {

  const NavigationBarItem({
    Key key,
    @required this.id,
    @required this.text,
  }) : super(key: key);

  final String text;
  final String id;

  void _setScreen() {
    log(id);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _setScreen,
        child: Center(
          child: Text('$text'),
        ),
      ),
    );
  }
}
