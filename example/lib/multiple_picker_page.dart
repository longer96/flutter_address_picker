import 'package:example/widget/my_app_bar.dart';
import 'package:example/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers/pickers.dart';

class MultiplePickerPage extends StatefulWidget {
  @override
  _MultiplePickerPageState createState() => _MultiplePickerPageState();
}

class _MultiplePickerPageState extends State<MultiplePickerPage> {
  var hourse = 13;
  String minute = '58';

  // 时间多列  选中的数据
  var listTime = [];

  final timeData = [
    List.generate(24, (index) => (index).toString()).toList(),
    List.generate(60, (index) => index.toString()).toList()
  ];
  final timeData2 = [
    ['上午', '下午'],
    List.generate(12, (index) => (index + 1).toString()).toList(),
    List.generate(60, (index) => index.toString()).toList(),
    List.generate(60, (index) => index.toString()).toList(),
  ];
  List timeData2Select = [5, 13, 32];

  final divider = Divider(height: 1, indent: 20);
  final rightIcon = Icon(Icons.keyboard_arrow_right);

  // final monthData = {
  //   'English': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
  //   '中文': ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
  // };
  var dataSelect = ['中文', '六月'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: '多列选择器'),
      body: ListView(children: [
        _item('时间(传入不同类型)'),
        _item2('时间(多列)'),
        _item3('自定义样式'),
      ]),
    );
  }

  Widget _item(title) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(title),
            onTap: () => _onClickItem(),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[MyText('$hourse时 $minute分', color: Colors.grey, rightpadding: 18), rightIcon]),
          ),
        ),
        divider,
      ],
    );
  }

  Widget _item2(title) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(title),
            onTap: () => _onClickItem2(),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[MyText(listTime.toString(), color: Colors.grey, rightpadding: 18), rightIcon]),
          ),
        ),
        divider,
      ],
    );
  }

  Widget _item3(title) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(title),
            onTap: () => _onClickItem3(),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              MyText(timeData2Select.toString(), color: Colors.grey, rightpadding: 18),
              rightIcon
            ]),
          ),
        ),
        divider,
      ],
    );
  }

  void _onClickItem() {
    double menuHeight = 36.0;
    Widget _headMenuView = Container(
        color: Colors.grey[50],
        height: menuHeight,
        child: Row(children: [
          Expanded(child: Center(child: MyText('时'))),
          Expanded(child: Center(child: MyText('分'))),
        ]));

    Pickers.showMultiplePicker(
      context,
      showTitleBar: true,
      menu: _headMenuView,
      menuHeight: menuHeight,
      data: timeData,
      selectData: [hourse, minute],
      onConfirm: (p) {
        print('longer >>> 返回数据类型：${p.map((x) => x.runtimeType).toList()}');
        setState(() {
          hourse = p[0];
          minute = p[1];
        });
      },
    );
  }

  void _onClickItem2() {
    double menuHeight = 36.0;
    Widget _headMenuView = Container(
        color: Colors.grey[50],
        height: menuHeight,
        child: Row(children: [
          Expanded(child: Center(child: MyText('早晚'))),
          Expanded(child: Center(child: MyText('时'))),
          Expanded(child: Center(child: MyText('分'))),
          Expanded(child: Center(child: MyText('秒'))),
        ]));

    Pickers.showMultiplePicker(
      context,
      showTitleBar: true,
      menu: _headMenuView,
      menuHeight: menuHeight,
      data: timeData2,
      selectData: ['', 4, 5, 12],
      onConfirm: (p) {
        print('longer >>> 返回数据类型：${p.map((x) => x.runtimeType).toList()}');
        setState(() {
          listTime.clear();
          listTime.addAll(p);
        });
      },
    );
  }

  void _onClickItem3() {
    double menuHeight = 36.0;
    Widget _headMenuView = Container(
        color: Colors.grey[700],
        height: menuHeight,
        child: Row(children: [
          Expanded(child: Center(child: MyText('日期', color: Colors.white))),
          Expanded(child: Center(child: MyText('时', color: Colors.white))),
          Expanded(child: Center(child: MyText('分', color: Colors.white))),
        ]));

    Widget _cancelButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(left: 22),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 1), borderRadius: BorderRadius.circular(4)),
      child: MyText('取消', color: Colors.white, size: 14),
    );

    Widget _commitButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(4)),
      child: MyText('确认', color: Colors.white, size: 14),
    );

    // 头部样式
    Decoration headDecoration = BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)));

    Widget title = MyText('自定义选择器', color: Colors.white, size: 14);

    Pickers.showMultiplePicker(
      context,
      showTitleBar: true,
      menu: _headMenuView,
      menuHeight: menuHeight,
      title: title,
      cancelWidget: _cancelButton,
      commitWidget: _commitButton,
      headDecoration: headDecoration,
      textColor: Colors.white,
      backgroundColor: Colors.grey[800],
      data: timeData2,
      selectData: timeData2Select,
      onConfirm: (p) {
        print('longer >>> 返回数据类型：${p.map((x) => x.runtimeType).toList()}');
        setState(() {
          timeData2Select.clear();
          timeData2Select.addAll(p);
        });
      },
    );
  }
}
