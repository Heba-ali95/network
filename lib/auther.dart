import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import 'model.dart';

class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  String name;
  String image;
  int age;
  int salary;

  final addAuthor = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuthor,
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Employee Name',
                  hintText: 'Enter Employee name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Employee Image',
                  hintText: 'Enter Employee Image',
                ),
                onChanged: (value) {
                  setState(() {
                    image = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Employee age',
                  hintText: 'Enter Employee age',
                ),
                onChanged: (value) {
                  setState(() {
                    age = int.parse(value);
                  });
                },
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  //send data to the internet (aqueduct server)
                  API
                      .createAuthor(Author(
                    employee_name: name,
                    employee_age: "$age",
                    profile_image: image,
                    employee_salary:"$salary",
                  ))
                      .then((author) {
                    //show snackbar
                    addAuthor.currentState.showSnackBar(SnackBar(
                        content: Text(
                            'the author with id ${author.id} has been created')));
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}