// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @TRYTHIS: remove the following line
// @dart = 2.9

import 'dart:io';

import 'package:calculate_lix/lix.dart';

void main(List<String> arguments) {
  // Parse the arguments; we expect a single argument containing the file name.
  if (arguments.length != 1) {
    printUsage();
    exit(64);
  } else {
    // Get the file name.
    //
    // TIP: We're using null safe versions of the core libraries, and the type
    // of `arguments` is `List` which means that arguments cannot contain null
    // elements. As a result, the Dart analyzer knows that `fileName` isn't
    // null.
    final fileName = arguments[0];
    print('Calculating Lix of "$fileName" with NNBD');

    // Calculate lix.
    // a smart way to have a "final" in the right scope
    // @TRYTHIS: convert to `final Lix l`
    // @TRYTHIS: convert to `final Lix? l`
    // @TRYTHIS: convert to `Lix? l`
    late final Lix l;
    try {
      l = Lix.fromString(File(fileName).readAsStringSync());
    } catch (ArgumentError) {
      print('Invalid input, could not calculate lix!\n'
          'The input text must contain at least one full sentence.');
    }
    late final String description;
    switch (l.describe()) {
      case 'unknown':
        print('Lix analysis failed');
        // @TRYTHIS: replace with "break", and for the value to be 'unknown'
        return;
      default:
        description = l.describe();
    }
    print('Lix is: ${l.readability}, ${description} to read ('
        'words: ${l.words}, long words: ${l.longWords}, '
        'periods: ${l.periods}).');
  }
}

void printUsage() {
  print('Usage: calculate_lix <text file>');
}
