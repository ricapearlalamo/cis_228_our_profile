import 'package:flutter/material.dart';

class DiannaProfileScreen extends StatefulWidget {
  const DiannaProfileScreen({super.key});

  @override
  State<DiannaProfileScreen> createState() => _DiannaProfileScreenState();
}

class _DiannaProfileScreenState extends State<DiannaProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Insert name here");
  final TextEditingController _emailController = TextEditingController(text: "Insert email here");

  bool isMusicChecked = false;
  bool isSportsChecked = false;
  bool isReadingChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/dianna.jpg",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 10), 
                  const Text(
                    "Hi, I'm Dianna!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 10),

            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Interests", style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: const Text("Music"),
              value: isMusicChecked,
              onChanged: (bool? value) {
                setState(() {
                  isMusicChecked = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sports"),
              value: isSportsChecked,
              onChanged: (bool? value) {
                setState(() {
                  isSportsChecked = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Reading"),
              value: isReadingChecked,
              onChanged: (bool? value) {
                setState(() {
                  isReadingChecked = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
