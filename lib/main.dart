import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: form(),
  ));
}

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Database Form"),
      ),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          TextField(
            controller: t3,
          ),
          TextField(
            controller: t4,
          ),
          ElevatedButton(
              onPressed: () async {
                String name = t1.text;
                String contact = t2.text;
                String email = t3.text;
                String pass = t4.text;

                //https://dwija.000webhostapp.com/ashishinsert.php
                var url =
                    Uri.https('dwija.000webhostapp.com', 'ashishinsert.php');
                var response = await http.post(url, body: {
                  'name': '$name',
                  'contact': '$contact',
                  'email': '$email',
                  'pass': '$pass'
                });
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');

              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
