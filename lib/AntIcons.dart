import 'package:flutter/cupertino.dart';


// ignore: slash_for_doc_comments
/**


    demo_index.html浏览器窗口的控制台中运行

    function camelCase(str) {
    return str.replace(/[ -]+(\w)/g, (match, char) => char.toUpperCase());
    }

    function makeCode({name, code}) {
    return `static const IconData ${camelCase(name)} = IconData(0${code.substr(2, 5)}, fontFamily: 'antd-icons');\n`;
    }

    Array
    .from(document.querySelectorAll('.unicode .dib'))
    .map(element => {
    return {
    name: element.querySelector('.name').innerText,
    code: element.querySelector('.code-name').innerText
    };
    })
    .map(makeCode)
    .join('\n');


 */

class AntIcons {
  static const IconData complex = IconData(0xe682, fontFamily: 'AntIcons');
  static const IconData project = IconData(0xe639, fontFamily: 'AntIcons');
  static const IconData mine = IconData(0xe941, fontFamily: 'AntIcons');


  static const IconData setting = IconData(0xe871, fontFamily: 'AntIcons');
  static const IconData person = IconData(0xe65d, fontFamily: 'AntIcons');
  static const IconData about = IconData(0xe6b4, fontFamily: 'AntIcons');
  static const IconData share = IconData(0xe674, fontFamily: 'AntIcons');
  static const IconData feedBack = IconData(0xe62e, fontFamily: 'AntIcons');

  static const IconData leftArrow = IconData(0xe67e, fontFamily: 'AntIcons');
  static const IconData rightArrow = IconData(0xe684, fontFamily: 'AntIcons');
  static const IconData closeFill = IconData(0xe6a6, fontFamily: 'AntIcons');

  static const IconData hot = IconData(0xe71d, fontFamily: 'AntIcons');

  static const IconData postTime = IconData(0xe60a, fontFamily: 'AntIcons');
  static const IconData postAuthor = IconData(0xe645, fontFamily: 'AntIcons');

}