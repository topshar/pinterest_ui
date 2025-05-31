import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;

  const DetailScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final relatedImages = [
      'assets/pexels-optical-chemist-340351297-30819809.jpg',
      'assets/pexels-optical-chemist-340351297-30788910.jpg',
      'assets/pexels-optical-chemist-340351297-30988979.jpg',
      'assets/pexels-optical-chemist-340351297-31042466.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Main content in a scrollable view
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.white24,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Saved to board!"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        'PandaDreams7',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'mens outfit 2025',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Wrap(
                        spacing: 8,
                        children: [
                          Chip(
                            label: Text("#fitness", style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.grey,
                          ),
                          Chip(
                            label: Text("#style", style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.grey,
                          ),
                          Chip(
                            label: Text("#menswear", style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        "More to explore",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: relatedImages.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                relatedImages[index],
                                width: 120,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Exit button at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                label: const Text(
                  "Exit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
