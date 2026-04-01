import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Text(
              'Activities',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                icon: Icon(Icons.info),
                title: const Text(
                  'Feature Update',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                content: const SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Sorry, This feature is not available yet.',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'We are working on it and it will be available soon.',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Thank you for your understanding.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
