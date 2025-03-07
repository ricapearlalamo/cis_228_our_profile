import 'package:flutter/material.dart';

class RicaProfileScreen extends StatefulWidget {
  const RicaProfileScreen({super.key});

  @override
  State<RicaProfileScreen> createState() => _RicaProfileScreenState();
}

class _RicaProfileScreenState extends State<RicaProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Insert name here");
  final TextEditingController _emailController = TextEditingController(text: "Insert email here");

  bool isMusicChecked = false;
  bool isSportsChecked = false;
  bool isReadingChecked = false;

  void _printSelectedInterests() {
    String name = _nameController.text;
    String email = _emailController.text;

    List<String> selectedInterests = [];
    if (isMusicChecked) selectedInterests.add("Music");
    if (isSportsChecked) selectedInterests.add("Sports");
    if (isReadingChecked) selectedInterests.add("Reading");

    print(" Name: $name");
    print(" Email: $email");
    print(" Selected Interests: ${selectedInterests.isNotEmpty ? selectedInterests.join(', ') : 'None'}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold), 
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset("assets/rica.jpg", width: 200, height: 200),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Hi, I'm Rica!",
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 8), 
                      const Icon(Icons.wb_sunny, color: Colors.orange, size: 20), 
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5), 
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15), 

            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5), 
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
                onPressed: _printSelectedInterests,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  backgroundColor: const Color.fromARGB(255, 197, 208, 216),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
