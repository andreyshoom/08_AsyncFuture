import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Future<String> fetchFileFromAssets(String assetsPath) {
//   return rootBundle.loadString(assetsPath).then((value) {
//     return value.toString();
//   });
// }

Future<String> fetchFileFromAssets([String assetsPath = '']) {
  return rootBundle.loadString(assetsPath).then((value) {
    return value.toString();
  });
}
