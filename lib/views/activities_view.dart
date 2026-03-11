import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: AlertDialog(
          icon: Icon(Icons.info),
          title: const Text('Feature Update', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          content: const SingleChildScrollView(
            child: Column(
              children: [
                Text('Sorry, This feature is not available yet.', textAlign: TextAlign.center,),
                Text('We are working on it and it will be available soon.', textAlign: TextAlign.center,),
                Text('Thank you for your understanding.', textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );

    // return Container(
    //   padding: EdgeInsets.all(8.0),

    // child: Column(
    //   children: <Widget>[
    //     Card(
    //       child: ListTile(
    //         leading: Icon(Icons.notifications_sharp),
    //         title: Text('Notification 1'),
    //         subtitle: Text('This is a notification'),
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         leading: Icon(Icons.notifications_sharp),
    //         title: Text('Notification 2'),
    //         subtitle: Text('This is a notification'),
    //       ),
    //     ),
    //   ],
    // ),
    // );
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
