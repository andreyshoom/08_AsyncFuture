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
  final String _nameOfFile = 'data.txt';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catch error'),
          centerTitle: true,
        ),
        body: FutureBuilder<String>(
          future: fetchFileFromAssets('assets/$_nameOfFile'),
          builder: (BuildContext coontext, AsyncSnapshot<String> snapshot) {
            print('hasError ${snapshot.hasError}');
            print('hasData ${snapshot.hasData}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('None');
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('File not found!'),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Text(snapshot.data.toString()),
                  );
                }
              default:
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
