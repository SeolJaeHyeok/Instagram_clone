import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: AppBar(title: Text(
        'Instagram Clone',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
       )
      ),
    );
  }

 Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget> [
                  Text('Instagram에 오신걸 환영합니다.',
                       style: TextStyle(fontSize: 24.0),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우 하세요.'),
                  Padding(padding: EdgeInsets.all(16.0)),
                  SizedBox (
                    width: 260.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4.0,
                        child: Column(
                          children: <Widget> [
                            Padding(padding: EdgeInsets.all(4.0)),
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('https://img1.daumcdn.net/thumb/S600x434/'
                                    '?scode=1boon&fname=https://t1.daumcdn.net/liveboard/DIMAZINE/'
                                    'd4c5fbf277234b8b99b56078d190a222.png'
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            Text('milkboy@naver.com', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('JaeHyeok Seol', style: TextStyle(fontSize: 10)),
                            Padding(padding: EdgeInsets.all(8.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://img1.daumcdn.net/thumb/S600x434/'
                                        '?scode=1boon&fname=https://t1.daumcdn.net/liveboard/DIMAZINE/'
                                        'd4c5fbf277234b8b99b56078d190a222.png', fit: BoxFit.cover,)
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://img1.daumcdn.net/thumb/S600x434/'
                                        '?scode=1boon&fname=https://t1.daumcdn.net/liveboard/DIMAZINE/'
                                        'd4c5fbf277234b8b99b56078d190a222.png', fit: BoxFit.cover,)
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://img1.daumcdn.net/thumb/S600x434/'
                                          '?scode=1boon&fname=https://t1.daumcdn.net/liveboard/DIMAZINE/'
                                          'd4c5fbf277234b8b99b56078d190a222.png', fit: BoxFit.cover,)
                                ),
                              ]
                            ),
                            Padding(padding: EdgeInsets.all(4.0)),
                            Text('Facebook 친구'),
                            Padding(padding: EdgeInsets.all(4.0)),
                            RaisedButton(
                              child: Text('팔로우'),
                              onPressed: () {},
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.all(4.0)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
 }
}
