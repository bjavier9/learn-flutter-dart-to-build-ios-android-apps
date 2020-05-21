import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    File _storedImage;
    return Row(children: [
      Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: _storedImage != null
            ? Image.file(
                _storedImage,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text(
                'No Image Take',
                textAlign: TextAlign.center,
              ),
        alignment: Alignment.center,
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: FlatButton.icon(
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {},
        ),
      )
    ]);
  }
}
