import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdaptiveButton extends StatelessWidget {
  final Function presentDataPicker;
  final String labeltxt;

  const AdaptiveButton(this.presentDataPicker, this.labeltxt);
  @override
  Widget build(BuildContext context) {
    return   Platform.isIOS?CupertinoButton(
                             color: Colors.blue,
                              child: Text(this.labeltxt,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: (){
                                presentDataPicker(context);
                              },

                           ): FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text(this.labeltxt,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: (){
                                presentDataPicker(context);
                              },
                            );
  }
}