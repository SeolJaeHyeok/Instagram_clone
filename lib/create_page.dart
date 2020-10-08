import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // 사라질 때 제거
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }
  PickedFile _image;

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
          onPressed: () {
            final firebaseStorageRef = FirebaseStorage.instance
                .ref()
                .child('post')
                .child('${DateTime.now().millisecondsSinceEpoch}.png');
            final task = firebaseStorageRef.putFile(
                File(_image.path), StorageMetadata(contentType: 'image/png'));
            task.onComplete.then((value) {
              var downloadUrl = value.ref.getDownloadURL();
              
              downloadUrl.then((uri) {
                var doc = Firestore.instance.collection('post').document();
                doc.setData({
                  'id': doc.documentID,
                  'photo': uri.toString(),
                  'contents': textEditingController.text,
                  'email': widget.user.email,
                  'displayName': widget.user.displayName,
                  'usePhotoUrl': widget.user.photoUrl
                }).then((value) {
                  Navigator.pop(context);
                });
              });
            });
          },
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
    final pickedimage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedimage;
    });
  }
}