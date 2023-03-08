import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/model/project_model.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../AntIcons.dart';
import '../../widget/style.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel projectModel;
  final Function? tapAction;

  const ProjectItem({super.key, required this.projectModel, this.tapAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    HtmlUnescape().convert(projectModel.title),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Box.vBox10,
                  Text(
                    projectModel.desc,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Box.vBox10,
                  Row(
                    children: [
                      const Icon(AntIcons.postAuthor),
                      Box.hBox3,
                      Text(
                        projectModel.author,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  Box.vBox10,
                  Row(
                    children: [
                      const Icon(AntIcons.postTime),
                      Box.hBox3,
                      Text(
                        projectModel.niceDate,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
                imageUrl: projectModel.envelopePic,
                width: 90,
                height: 160,
                fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}
