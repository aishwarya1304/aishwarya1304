import 'package:flutter/material.dart';
import 'package:system_info2/system_info2.dart';
import 'package:disk_space/disk_space.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  Widget content = Center(
    child: Text(
        "RAM : ${SysInfo.getFreePhysicalMemory() / (1024 * 1024)}MB \n Virtual Memory: ${SysInfo.getFreeVirtualMemory() ~/ (1024 * 1024 * 1024)}GB \n "),
  );

  void _changeIndex(int index) {
    setState(() {
      switch (index) {
        case 0:
          content = Center(
            child: Text(
                "RAM : ${SysInfo.getFreePhysicalMemory() ~/ (1024 * 1024)}MB \n Virtual Memory: ${SysInfo.getFreeVirtualMemory() ~/ (1024 * 1024 * 1024)}GB \n "),
          );
          _selectedIndex = 0;
          break;
        case 1:
          content = const Center(child: Text("Tasks"));
          _selectedIndex = 1;
          break;
        case 2:
          content = const Center(child: Text("Preferences"));
          _selectedIndex = 2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cluster Clients APP"),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 245, 247),
                ),
                child: Text('Cluster Clients APP'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _changeIndex(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Tasks'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _changeIndex(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Preferences'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _changeIndex(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: content);
  }
}