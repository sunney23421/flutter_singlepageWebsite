import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppbarText extends StatefulWidget {
  final String word;
  final bool list;

  const AppbarText({Key? key, required this.word, required this.list})
      : super(key: key);

  @override
  State<AppbarText> createState() => _AppbarTextState();
}

class _AppbarTextState extends State<AppbarText> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Text(widget.word),
    //     Text(widget.list.toString()),
    //   ],
    // );
    var _isHovering = widget.list;
    return InkWell(
      
      onTap: () {
        //print(_isHovering[0]);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Home',
            style: TextStyle(
                color: _isHovering ? Color(0xFF077bd7) : Color(0xFF077bd7),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible:_isHovering,
            child: Container(
              height: 2,
              width: 20,
              color: Color(0xFF051441),
              //underline
            ),
          ),
        ],
      ),
    );
  }
}
