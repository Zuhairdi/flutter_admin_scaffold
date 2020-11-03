import 'dart:math' show min;

import 'package:flutter/material.dart';

import 'menu_item_data.dart';
import 'sidebar_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    Key key,
    @required this.itemDatas,
    @required this.selectedRoute,
    this.onSelected,
    this.width = 240.0,
    this.textStyle = const TextStyle(
      color: Color(0xFF337ab7),
      fontSize: 12,
    ),
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.activeBackgroundColor = const Color(0xFFE7E7E7),
    this.borderColor = const Color(0xFFE7E7E7),
  }) : super(key: key);

  final List<MenuItemData> itemDatas;
  final String selectedRoute;
  final void Function(MenuItemData itemData) onSelected;
  final double width;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  double _sidebarWidth;

  @override
  void initState() {
    super.initState();
    _sidebarWidth = widget.width;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    _sidebarWidth = min(mediaQuery.size.width * 0.7, widget.width);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _sidebarWidth,
      child: Column(
        children: [
          Expanded(
            child: Material(
              color: widget.backgroundColor,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return SidebarItem(
                    itemDatas: widget.itemDatas,
                    index: index,
                    onSelected: widget.onSelected,
                    selectedRoute: widget.selectedRoute,
                    depth: 0,
                    textStyle: widget.textStyle,
                    backgroundColor: widget.backgroundColor,
                    activeBackgroundColor: widget.activeBackgroundColor,
                    borderColor: widget.borderColor,
                  );
                },
                itemCount: widget.itemDatas.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
