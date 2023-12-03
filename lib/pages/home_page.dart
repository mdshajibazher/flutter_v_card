import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_card/pages/form_page.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/';

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: (){
          Navigator.pushNamed(context, FormPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Colors.white70,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });

          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
              label: 'All'
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: 'Favorites'
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
