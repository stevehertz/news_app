import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// first let's extend our app to SingleTickerProviderStateMixin
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabList = [
    const Tab(
      child: Text("Top"),
    ),
    const Tab(
      child: Text("Popular"),
    ),
    const Tab(
      child: Text("Trending"),
    ),
    const Tab(
      child: Text("Editor Choice"),
    ),
    const Tab(
      child: Text("Category"),
    ),
  ];

  // Now let's create the tab controller
  TabController? _tabController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initstate
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _tabController!.dispose();
    super.dispose();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        backgroundColor: Color(0XFFFAFAFA),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          // we need the create a tab controller and tablist
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
