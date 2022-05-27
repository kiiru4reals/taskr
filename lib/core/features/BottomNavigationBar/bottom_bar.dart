import 'package:flutter/material.dart';
import 'package:soluprov/features/homepage/home_screen.dart';
import 'package:soluprov/features/settings/settings.dart';
import 'package:soluprov/features/tasks/collective_events.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages ;

  // var _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      const HomeScreen(),
      const CollectiveEvents(),
      const Settings()
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages![_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        // elevation: 5,
        shape: const CircularNotchedRectangle(),
        child: Container(
          // height: kBottomNavigationBarHeight * 0.8,
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5),
              )),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Colors.white,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedIndex,
            selectedLabelStyle: const TextStyle(fontSize: 15),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              /*BottomNavigationBarItem(
                icon: Icon(Icons.link_outlined),
                tooltip: 'Saved links',
                label: 'Saved links',
              ),*/
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                tooltip: 'Tasks',
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                tooltip: 'Settings',
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}