import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final activeSkillProvider = StateProvider<List<String>>((ref) => []);