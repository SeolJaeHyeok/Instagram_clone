import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  PickedFile _image;

  @override
  void dispose() {
    // 사라질 때 제거
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('새 게시물', style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            _image == null ? Text('No Image') : Image.file(File(_image.path)),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add_a_photo),
      backgroundColor: Colors.blue,
      onPressed: () {
        _getImage();
      },
    );
  }

  Future _getImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }
}