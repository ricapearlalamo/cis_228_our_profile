import 'package:flutter/material.dart';

import 'profile_aaron.dart';
import 'profile_dianna.dart';
import 'profile_rica.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class Member {
  final String name;
  final String yearSection;
  final String profileImage;
  final String profileBio;
  final Widget profileScreen;

  Member({
    required this.name,
    required this.yearSection,
    required this.profileImage,
    required this.profileBio,
    required this.profileScreen,
  });
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Member> members = [
    Member(
      name: "Rica Paul Alamo",
      yearSection: "BSIS 3-A BAD",
      profileImage: "assets/rica.jpg",
      profileBio: "Ako Si Rica Paul",
      profileScreen: RicaProfileScreen(),
    ),
    Member(
      name: "Aaron Pearl Villanueva",
      yearSection: "BSIS 3-A BAD",
      profileImage: "assets/aaron.jpg",
      profileBio: "Ako si Aaron Pearl",
      profileScreen: AaronProfileScreen(),
    ),
    Member(
      name: "Dianna Kyla Rose",
      yearSection: "BSIS 3-A BAD",
      profileImage: "assets/dianna.jpg",
      profileBio: "Ako si Dianna Kyla",
      profileScreen: DiannaProfileScreen(),
    ),
  ];

  int? _hoverIndex;
  final Color dashboardColor = const Color.fromARGB(255, 176, 216, 235); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: dashboardColor,
        toolbarHeight: 90,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, 
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.1,
            ),
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];

              return MouseRegion(
                onEnter: (_) => setState(() => _hoverIndex = index),
                onExit: (_) => setState(() => _hoverIndex = null),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => member.profileScreen,
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: _hoverIndex == index ? dashboardColor : Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: _hoverIndex == index
                          ? [BoxShadow(color: dashboardColor.withOpacity(0.7), blurRadius: 10, spreadRadius: 2)]
                          : [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 85,
                          backgroundImage: AssetImage(member.profileImage),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          member.name,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          member.yearSection,
                          style: const TextStyle(fontSize: 18, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
