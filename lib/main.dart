import 'package:flutter/material.dart';

import 'package:drawer_demo/scaled_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  DrawerItem({
    required this.title,
    required this.icon,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = drawerItems;
    return ScaledDrawer(
      page: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Drawer Demo'),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.dangerous),
                ),
                Tab(
                  icon: Icon(Icons.dangerous),
                )
              ]),
            ),
            body: TabBarView(
              children: [
                Center(child: Text('1')),
                Center(child: Text('2')),
              ],
            )),
      ),
      drawer: Material(
        color: Color(0xFF121212),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {},
            leading: Icon(
              items[index].icon,
              color: Colors.white,
            ),
            title: Text(items[index].title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white)),
          ),
        ),
      ),
      drawerColor: Color(0xFF121212),
      drawerWidth: MediaQuery.of(context).size.width * 0.6,
    );
  }

  List<DrawerItem> get drawerItems => [
        DrawerItem(title: 'Home', icon: Icons.home),
        DrawerItem(title: 'More', icon: Icons.more_horiz),
        DrawerItem(title: 'Search', icon: Icons.search),
        DrawerItem(title: 'Home', icon: Icons.home),
        DrawerItem(title: 'Home', icon: Icons.home),
      ];
}
