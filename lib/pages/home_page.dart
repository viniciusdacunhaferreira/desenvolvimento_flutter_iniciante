import 'package:flutter/material.dart';

import '../extensions/build_context.dart';
import '../routes/routes.dart';
import '../widgets/people_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: PeopleListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => context.pushNamed(Routes.newPage),
      ),
    );
  }
}
