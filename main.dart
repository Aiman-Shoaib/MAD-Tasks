import 'package:flutter/material.dart';

class Chat {
  final String sender;
  final String message;
  final DateTime timestamp;
  final String profile;
  final bool isdelivered;
  final bool isread;
  final String call;

  Chat(
      {required this.sender,
      required this.message,
      required this.timestamp,
      required this.profile,
      required this.isdelivered,
      required this.isread,
      required this.call});
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Chat> chats = [
    Chat(
        sender: "Hamna",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/woman.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "Zee",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/beauty.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "Aisha",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/businesswoman.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "muneeba",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/moon.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "B J W",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/icon.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "Wajii",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/waji.png',
        call: "outgoing",
        isdelivered: false,
        isread: false),
    Chat(
        sender: "ahmed",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/boy.png',
        call: "outgoing",
        isdelivered: true,
        isread: false),
    Chat(
        sender: "Friends",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/friends.png',
        call: "outgoing",
        isdelivered: true,
        isread: true),
    Chat(
        sender: "Afia",
        message: "Hello!",
        timestamp: DateTime.now(),
        profile: 'images/mountain.png',
        call: "outgoing",
        isdelivered: true,
        isread: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
        title: const Text('Whatsapp'),
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            icon: Icon(Icons.group),
          ),
          Tab(
            text: 'chats',
          ),
          Tab(
            text: 'status',
          ),
          Tab(
            text: 'calls',
          ),
        ]),
      ),
      drawer: Drawer(
          child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('Aiman'),
            accountEmail: Text('aiman@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/letter-a.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Account info'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      )),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
            Image.asset('images/community.png'), //tab1 content
            ListView.builder(
              //tab2 content
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading:
                      CircleAvatar(backgroundImage: AssetImage(chat.profile)),
                  title: Text(chat.sender),
                  subtitle: Row(
                    children: [
                      if (chat.isread)
                        const Icon(
                          Icons.done_all,
                          size: 16,
                          color: Colors.blue,
                        )
                      else if (chat.isdelivered)
                        const Icon(
                          Icons.done_all,
                          size: 16,
                          color: Colors.grey,
                        )
                      else
                        const SizedBox.shrink(),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(chat.message),
                    ],
                  ),
                  trailing: Text(
                    "${chat.timestamp.hour}:${chat.timestamp.minute}",
                  ),
                );
              },
            ),
            GridView.builder(
                //tab3 content
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chatt = chats[index];

                  return Card(
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text(chatt.message),
                    ),
                  );
                }),
            ListView.builder(
              //tab4 content
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading:
                      CircleAvatar(backgroundImage: AssetImage(chat.profile)),
                  title: Text(chat.sender),
                  subtitle: Row(
                    children: [
                     const  Icon(
                        Icons.arrow_outward,
                        size: 16,
                        color: Colors.green,
                      ),
                      Text(chat.call),
                    ],
                  ),
                  trailing: Text(
                    "${chat.timestamp.hour}:${chat.timestamp.minute}",
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff239c62),
        hoverColor: Colors.greenAccent,
        tooltip: "Chat",
        child: const Icon(Icons.chat_rounded),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('loading'),
            duration: const Duration(milliseconds: 3000),
            action: SnackBarAction(
                label: 'undo', textColor: Colors.white, onPressed: () {}),
          ));
        },
      ),
    );
  }
}
