import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_blog/http/request_repository.dart';
import 'package:flutter_blog/model/project_category.dart';
import 'package:flutter_blog/model/project_model.dart';
import 'package:flutter_blog/page/article_page.dart';
import 'package:flutter_blog/page/project/project_item.dart';
import 'package:html_unescape/html_unescape.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin {
  late RequestRepository repository;
  List<ProjectCategory> _projectCategories = [];
  List<ProjectModel> _projects = [];
  late HtmlUnescape htmlUnescape;

  int _cid = 0;
  int _page = 0;
  bool _isOver = false;

  @override
  void initState() {
    super.initState();
    htmlUnescape = HtmlUnescape();
    repository = RequestRepository();

    _requestProjectCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == _projects.length - 3 && !_isOver) {
              _page++;
              _requestProjects();
            }
            var item = _projects[index];
            return InkWell(
              child: ProjectItem(
                projectModel: item,
              ),
              onTap: () {
                ArticlePage.toArticle(context, item.title, item.link);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: _projects.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //显示一个 项目分类View
          showCategorySheet();
        },
        child: const Icon(AntIcons.more),
      ),
    );
  }

  void _requestProjectCategories() {
    repository.projectCategory(
        success: (data) {
          setState(() {
            _projectCategories = data;
          });
          //开始加载默认的project：完整项目 cid = 294
          _cid = _projectCategories[0].id;
          _page = 0;
          _requestProjects();
        },
        fail: (code, msg) {});
  }

  void _requestProjects({bool isNew = false}) {
    repository.projects(_page, _cid, success: (data, over) {
      _isOver = over;
      setState(() {
        if (isNew) {
          _projects = data;
        }else {
          _projects.addAll(data);
        }
      });
    }, fail: (code, msg) {});
  }

  @override
  bool get wantKeepAlive => true;

  void showCategorySheet() async {
    var newId = await showModalBottomSheet(
        context: context,
        enableDrag: true,
        builder: (context) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3, crossAxisCount: 3),
            itemBuilder: (context, index) {
              var projectCategory = _projectCategories[index];
              var selected = _cid == projectCategory.id;
              return InkWell(
                child: Center(child: Text(htmlUnescape.convert(projectCategory.name), style: TextStyle(color: selected ? Colors.blue : Colors.black),)),
                onTap: () {
                  Navigator.pop(context, projectCategory.id);
                },
              );
            },
            itemCount: _projectCategories.length,
          );
        });
    _cid = newId;
    _page = 1;
    _isOver = false;
    _requestProjects(isNew: true);
    debugPrint('showBottomSheet newId: $newId');
  }
}
