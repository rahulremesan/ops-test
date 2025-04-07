import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class App {
  final int id;
  final String title;
  final String? subtitle;
  final String? logo;
  final Map<String, String> platformLinks;

  App({
    required this.id,
    required this.title,
    this.subtitle,
    this.logo,
    required this.platformLinks,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    Map<String, String> platformLinks = {};
    if (json['url'] != null) {
      platformLinks = {
        'ios': json['url']['ios'] ?? '',
        'android': json['url']['android'] ?? '',
      };
    }

    return App(
      id: json['entityId'] ?? 0,
      title: json['title'] ?? 'Untitled',
      subtitle: json['description'],
      logo: json['imageBanner'],
      platformLinks: platformLinks,
    );
  }
}

const String baseUrl = "https://styria-dev.tarento.com";

final appDataProvider = FutureProvider<List<App>>((ref) async {
  const String apiUrl = '$baseUrl/api/python/v1/entity/get';
  final Map<String, dynamic> requestBody = {
    "metadata": {"userId": "1144"},
    "attributes": {"entityType": "App"}
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);

      if (data is Map && data.containsKey('responseData')) {
        final List<dynamic> appsList = data['responseData'];
        return appsList.map((appJson) => App.fromJson(appJson)).toList();
      } else {
        throw Exception('Invalid response structure: Missing required keys');
      }
    } else {
      throw Exception(
          'API Error: ${response.statusCode} ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception('Failed to load apps: $e');
  }
});
