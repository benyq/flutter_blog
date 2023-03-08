import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/model/project_category.dart';

class ProjectCategoryWidget extends StatelessWidget {
  const ProjectCategoryWidget({super.key, required this.projectCategories});

  final List<ProjectCategory> projectCategories;

  @override
  Widget build(BuildContext context) {

    var screenWidth = window.physicalSize.width / window.devicePixelRatio;

    return Container(
      width: screenWidth * 2 / 3,
      height: screenWidth * 2 / 3,
      color: Colors.black,
    );
  }

}