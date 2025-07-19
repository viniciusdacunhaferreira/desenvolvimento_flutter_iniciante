import 'package:flutter/material.dart';

import '../widgets/people_list_view.dart';
import 'new_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: PeopleListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => NewPage()),
          (route) => false,
        ),
      ),
    );
  }
}
