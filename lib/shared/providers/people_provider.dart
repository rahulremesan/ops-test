import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final peopleProvider = ChangeNotifierProvider((ref) => PeopleProvider());

class PeopleProvider with ChangeNotifier {
}