import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'search_screen.dart';
import 'login_page.dart';
import 'detail_screen.dart'; // Added import for DetailScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Using super parameter here

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> allImages = [
    'assets/pexels-shashank-maggirwar-1478101626-29469326.jpg',
    'assets/pexels-optical-chemist-340351297-31591510.jpg',
    'assets/pexels-optical-chemist-340351297-31419890.jpg',
    'assets/pexels-optical-chemist-340351297-31314841.jpg',
    'assets/pexels-optical-chemist-340351297-31010376.jpg',
    'assets/pexels-optical-chemist-340351297-30988979.jpg',
    'assets/pexels-optical-chemist-340351297-30819809.jpg',
    'assets/pexels-optical-chemist-340351297-30788910.jpg',
    'assets/pexels-optical-chemist-340351297-31042466.jpg',
    'assets/pexels-mehedi-hasan-214983325-28397954.jpg',
  ];

  String searchTerm = '';
  int _currentIndex = 0;

  Future<void> _onTabTapped(int index) async {
    if (index == 1) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
      setState(() {
        _currentIndex = 0;
      });
    } else if (index == 4) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(username: 'Sharath'),
        ),
      );
      setState(() {
        _currentIndex = 0;
      });
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredImages = _currentIndex == 0 ? allImages : [];

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: _currentIndex == 0
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  searchTerm = value;
                                  // You can add filtering logic here if needed
                                });
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for ideas',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: filteredImages.isEmpty
                        ? const Center(
                            child: Text(
                              'No images found.',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : MasonryGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            padding: const EdgeInsets.all(8),
                            itemCount: filteredImages.length,
                            itemBuilder: (context, index) {
                              final image = filteredImages[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(imagePath: image),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'Tab $_currentIndex is selected.\nAdd content here!',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
