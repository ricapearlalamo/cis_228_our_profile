import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class Member {
  final String name;
  final String yearSection;
  final String profileImage;
  final String profileBio;

  Member({required this.name, required this.yearSection, required this.profileImage, required this.profileBio});
}

class DashboardScreen extends StatelessWidget {
  final List<Member> members = [
    Member(name: "Rica Paul Alamo", yearSection: "BSIS 3-A BAD", profileImage: "assets/rica.jpg", profileBio: "Ako Si Rica Paul"),
    Member(name: "Aaron Pearl Villanueva", yearSection: "BSIS 3-A BAD", profileImage: "assets/aaron.jpg", profileBio: "Ako si Aaron Pearl"),
    Member(name: "Dianna Kyla Rose", yearSection: "BSIS 3-A BAD", profileImage: "assets/dianna.jpg", profileBio: "Ako si Dianna Kyla"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(member: member),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(member.profileImage),
                    ),
                    SizedBox(height: 10),
                    Text(member.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(member.yearSection, style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final Member member;

  ProfileScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(member.profileImage),
            ),
            SizedBox(height: 20),
            Text(member.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(member.yearSection, style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(member.profileBio, style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
