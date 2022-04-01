import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  try {
    return rootBundle.loadString(assetsPath);
  } catch (error) {
    return Future.error(error);
  }
}
