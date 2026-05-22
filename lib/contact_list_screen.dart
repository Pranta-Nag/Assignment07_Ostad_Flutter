import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  final List<Map<String, String>> _contacts = [
    {'name': 'Jawad', 'phone': '01877-777777'},
    {'name': 'Ferdous', 'phone': '01673-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
  ];

  final TextEditingController _nameController = TextEditingController(text: 'Hasan');
  final TextEditingController _phoneController = TextEditingController(text: '01745-777777');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color customSlateColor = Color(0xFF607D8B); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: customSlateColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Number',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: customSlateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _contacts.add({
                      'name': _nameController.text,
                      'phone': _phoneController.text,
                    });
                    _nameController.clear();
                    _phoneController.clear();
                  });
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return Card(
                    color: const Color(0xFFF5F5F5), 
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.person, color: Color(0xFF795548), size: 32), 
                      ),
                      title: Text(
                        contact['name']!,
                        style: const TextStyle(
                          color: Color(0xFFE53935), 
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        contact['phone']!,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}