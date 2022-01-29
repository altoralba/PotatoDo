import 'package:flutter/material.dart';
import 'package:potatodo/database_helper.dart';

import 'package:potatodo/views/taskpage/taskpage.dart';
import 'package:potatodo/widgets.dart';

Widget noteList() {
  DatabaseHelper _dbHelper = DatabaseHelper();

  return FutureBuilder(
    initialData: [],
    future: _dbHelper.getTasks(),
    builder: (context, snapshot) {
      return ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: ListView.builder(
          itemCount: snapshot.hasData ? snapshot.data.length : 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Taskpage(
                      task: snapshot.data[index],
                    ),
                  ),
                ).then(
                  (value) {
                    //setState(() {});
                  },
                );
              },
              child: TaskCardWidget(
                title: snapshot.data[index].title,
                desc: snapshot.data[index].description,
              ),
            );
          },
        ),
      );
    },
  );
}
