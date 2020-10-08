import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';


class SearchPage extends StatefulWidget {
  final  FirebaseUser user;

  SearchPage(this.user);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),),
    );
  }

 Widget _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0),
      itemCount: 5,
      itemBuilder: (context, index){
        return _buildListItem(context, index);
      },
    );
 }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('https://img1.daumcdn.net/thumb/S600x434/'
        '?scode=1boon&fname=https://t1.daumcdn.net/liveboard/DIMAZINE/'
        'd4c5fbf277234b8b99b56078d190a222.png', fit: BoxFit.cover);
  }
}
