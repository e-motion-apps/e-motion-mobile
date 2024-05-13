import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 70,),
            Image.asset(
              'assets/images/emotion-76.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8,),
            const Text('E-Motion'),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Sign In'),
              onTap: () {
                // TODO(Leeoz): Handle Authentication
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // TODO(Leeoz): Handle Settings
              },
            ),
            ListTile(
              title: const Text('Change Language'),
              onTap: () {
                // TODO(Leeoz): Handle Language Change
              },
            ),
          ],
        ),
      ),
      body: const Center( // TODO(Leeoz): Implement map on the home page
        child: 
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'City Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Country Name',
              ),
            ),
            ElevatedButton(
                onPressed: null,
              child: Text('Get City Details'),
            ),
          ],
        ),
    ),
    );
  }
}
