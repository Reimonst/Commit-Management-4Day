import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Raka Erlangga';
  final String role = 'Mahasiswa Teknik Informatika';
  
  final String photoUrl = 'https://th.bing.com/th/id/OIP.Ff7yTRxc28FnT_g7HOH5LgHaHh?w=168&h=180&c=7&r=0&o=7&dpr=1.5&pid=1.7&rm=3';

  final List<String> experiences = const [
    'IT Support AirAsia Indonesia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            ProfileAvatar(imageUrl: photoUrl),
            const SizedBox(height: 16),
            ProfileInfo(userName: userName, role: role),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fitur edit belum aktif pada modul statis.'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black,
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),
            const SizedBox(height: 24),
            const ProfileStats(),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            const Divider(height: 20, thickness: 1, color: Colors.black12),
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(experience: experiences[index]);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  const ProfileAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 52,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String role;
  const ProfileInfo({super.key, required this.userName, required this.role});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userName, 
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black), 
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          role, 
          style: TextStyle(fontSize: 16, color: Colors.grey[800]), 
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatItem(count: '15', label: 'Proyek'),
          SizedBox(width: 32),
          StatItem(count: '1.2K', label: 'Followers'),
          SizedBox(width: 32),
          StatItem(count: '42', label: 'Following'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;
  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count, 
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String experience;
  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.red),
        title: Text(
          experience,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}