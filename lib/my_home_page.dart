import 'package:flutter/material.dart';
import 'package:news_app/shared/details.dart';
import 'package:news_app/shared/listitem.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:news_app/shared/listwidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// first let's extend our app to SingleTickerProviderStateMixin
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Let's make a list of list items

  List<ListItem> listTiles = [
    ListItem(
      imgURL:
          "https://images.unsplash.com/photo-1503694978374-8a2fa686963a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "28 Jan 2020",
    ),
    ListItem(
      imgURL:
          "https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "03 Mar 2020",
    ),
    ListItem(
      imgURL:
          "https://images.unsplash.com/photo-1668164077013-0e7dddb0c110?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "28 July 2020",
    ),
    ListItem(
      imgURL:
          "https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "28 Jan 2020",
    ),
    ListItem(
      imgURL:
          "https://images.unsplash.com/photo-1668015918583-e0dee8585f4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "28 Jan 2020",
    ),
    ListItem(
      imgURL:
          "https://img.freepik.com/free-photo/close-up-hands-holding-shopping-bags_23-2149241353.jpg?t=st=1668150719~exp=1668151319~hmac=42d2045772fd91a68b55af2b709c3e5c8eea37ebb11dc63a5bd630d5a60f2ee5",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "30 Nov 2020",
    ),
    ListItem(
      imgURL:
          "https://img.freepik.com/premium-photo/cute-little-girl-green-knitted-northern-reindeer-sweater-caucasian-girl-decorates-christmas-tre_78492-7852.jpg?size=626&ext=jpg",
      newsTitle: lipsum.createWord(numWords: 6),
      author: lipsum.createWord(numWords: 2),
      date: "1 Jan 2021",
    ),
  ];

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
          preferredSize: const Size.fromHeight(30.0),
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Now let's build the ListWidget
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Now lets create new page
                      // we will add details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                tag: listTiles[index].newsTitle,
                                item: listTiles[index])),
                      );
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
