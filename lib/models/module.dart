import 'package:flutter/material.dart';

class Module {
  final String moduleTitle;
  final String title;
  final List<AssetImage> images;
  final String content;

  Module({
    required this.moduleTitle,
    required this.title,
    required this.images,
    required this.content,
  });
}
