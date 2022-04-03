import 'package:flutter/material.dart';
import 'package:load_file/fetch_file.dart';

class TextFiledFile extends StatefulWidget {
  const TextFiledFile({Key? key}) : super(key: key);

  @override
  State<TextFiledFile> createState() => _TextFiledFileState();
}

class _TextFiledFileState extends State<TextFiledFile> {
  final TextEditingController _controller = TextEditingController();
  String _nameOfFile = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: const Text('Load file App'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0, 15.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          helperText: 'Field for searching files',
                          helperStyle: TextStyle(
                            color: Colors.deepPurple[900],
                          ),
                          hintText: 'Enter a name',
                          hintStyle: const TextStyle(
                            color: Colors.deepPurple,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 22),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _nameOfFile = _controller.text;
                        });
                      },
                      child: const Text('Search'),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        shadowColor: Colors.white,
                        alignment: Alignment.center,
                        primary: Colors.deepPurple,
                        fixedSize: const Size(80, 48),
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: fetchFileFromAssets(
                    'assets/${_controller.text.toString()}'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // _controller.text.isEmpty
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 320, 10),
                            child: Text('${_controller.text.toString()}'),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(snapshot.data),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('File not found!'),
                          Text('${snapshot.error}'),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
