import 'package:catch_error/fetch_file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catch error'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: fetchFileFromAssets('assets1/data.txt'),
          builder: (BuildContext coontext, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('File not found!'),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Text(snapshot.data),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
