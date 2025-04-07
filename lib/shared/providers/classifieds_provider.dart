import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:styria_flutter_web/constants/api_constants.dart';

final classifiedsProvider =
    ChangeNotifierProvider((ref) => ClassifiedsProvider());

class Classifieds {
  final int id;
  final String title;
  final String description;
  final int price;
  final bool? isSold;
  final String category;
  final String location;
  final String? productType;
  final DateTime createdOn;
  final int createdBy;
  final String? imageUrl;

  Classifieds({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.isSold,
    required this.category,
    required this.location,
    this.productType,
    required this.createdOn,
    required this.createdBy,
    this.imageUrl,
  });
  factory Classifieds.fromJson(Map<String, dynamic> json) {
    String? imageUrl;
    if (json['files'] != null && json['files'].isNotEmpty) {
      imageUrl = json['files'][0]['url'];
    }

    String categoryName = json['category'] != null && json['category']['name'] != null
      ? json['category']['name']
      : 'No category';

    return Classifieds(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      price: json['price'] ?? 0,
      isSold: json['is_sold'] ?? false,
      category: categoryName,
      location: json['location'] ?? 'No location',
      productType: json['product_type'] ?? 'No product type',
      createdOn: json['created_on'] != null
          ? DateTime.parse(json['created_on'])
          : DateTime.now(),
      createdBy: json['created_by'] ?? 0,
      imageUrl: imageUrl,
    );
  }
}

class ClassifiedsProvider with ChangeNotifier {
  List<Classifieds> classifieds = [];
  List<Map<String, dynamic>> categories = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchClassifieds() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final url =
        Uri.parse(ApiConstants.fetchClassifieds());
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        classifieds = (data['response_data'] as List)
            .map((item) => Classifieds.fromJson(item))
            .toList();
      } else {
        errorMessage = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final url = Uri.parse(
        'https://styria-dev.tarento.com/api/v1/classifieds/entity?type=classified_category');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['response_data'] != null && data['response_data'] is List) {
          categories = (data['response_data'] as List)
              .map((item) => {
                    'title': item['name'] ?? 'No name', 
                    'status': false, 
                  })
              .toList();
        } else {
          errorMessage = 'Invalid data format for categories';
        }
      } else {
        errorMessage = 'Failed to load categories: ${response.statusCode}';
      }
    } catch (error) {
      errorMessage = 'An error occurred: $error';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
