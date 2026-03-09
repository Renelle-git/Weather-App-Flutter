import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notification 1'),
              subtitle: Text('This is a notification'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notification 2'),
              subtitle: Text('This is a notification'),
            ),
          ),
        ],
      ),
    );
    // return Obx(
    //   () => Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Column(
    //           children: <Widget>[
    //             Card(
    //               child: ListTile(
    //                 leading: Icon(Icons.notifications_sharp),
    //                 title: Text('Notification 1'),
    //                 subtitle: Text('This is a notification'),
    //               ),
    //             ),
    //             Card(
    //               child: ListTile(
    //                 leading: Icon(Icons.notifications_sharp),
    //                 title: Text('Notification 2'),
    //                 subtitle: Text('This is a notification'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
