import 'package:flutter/material.dart';
import 'package:bookstore_app/screens/all_books_page.dart';
import 'package:bookstore_app/screens/book_detail_page.dart';
import 'package:bookstore_app/screens/login_page.dart';
import 'package:bookstore_app/widgets/book_item.dart';
import 'package:bookstore_app/screens/profile_page.dart';
import '../widgets/see_all_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; // Initial selected index, starting with 'Home'

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1 || index == 3) { // Search or Saved icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmptyPage()), // Replace EmptyPage with your empty page widget
      );
    } else if (index == 0) { // Books icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllBooksPage()),
      );
    } else if (index == 2) { // Home icon tapped
      // No action needed here as we're already on the Home page
    } else if (index == 4) { // Profile icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
      );
    }
  }

  bool isLoggedIn = false; // Placeholder for authentication status

  void _navigateToBookDetail(String bookImagePath, String bookTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
          bookTitle: bookTitle,
          bookImagePath: bookImagePath,
        ),
      ),
    );
  }

  final List<Map<String, String>> newBooks = [
    {'image': 'assets/new_books/book1.png', 'title': 'New Book 1'},
    {'image': 'assets/new_books/book2.png', 'title': 'New Book 2'},
    {'image': 'assets/new_books/book3.png', 'title': 'New Book 3'},
    {'image': 'assets/new_books/book4.png', 'title': 'New Book 4'},
  ];

  final List<Map<String, String>> books = [
    {'image': 'assets/books/book1.png', 'title': 'Book 1'},
    {'image': 'assets/books/book2.png', 'title': 'Book 2'},
    {'image': 'assets/books/book3.png', 'title': 'Book 3'},
    {'image': 'assets/books/book4.png', 'title': 'Book 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            width: 53.26, // Specified width
            height: 58.49, // Specified height
          ),
        ),
        centerTitle: true, // To center the logo in the AppBar
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionTitle(title: 'New Books'),
                  SeeAllButton(
                    label: 'See All',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllBooksPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: newBooks.map((book) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToBookDetail(book['image']!, book['title']!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 140, // Adjusted width for more space
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              child: Image.asset(
                                book['image']!,
                                fit: BoxFit.cover,
                                height: 220, // Increased height
                                width: 140, // Specified width
                              ),
                            ),
                            SizedBox(height: 4), // Space between image and text
                            Text(
                              book['title']!,
                              style: TextStyle(
                                fontFamily: 'Poppins', // Use the Poppins font
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Author', // Placeholder text, can be replaced with actual author
                              style: TextStyle(
                                fontFamily: 'Poppins', // Use the Poppins font
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionTitle(title: 'Books'),
                  SeeAllButton(
                    label: 'See All',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllBooksPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: books.map((book) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToBookDetail(book['image']!, book['title']!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 140, // Adjusted width for more space
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              child: Image.asset(
                                book['image']!,
                                fit: BoxFit.cover,
                                height: 220, // Increased height
                                width: 140, // Specified width
                              ),
                            ),
                            SizedBox(height: 4), // Space between image and text
                            Text(
                              book['title']!,
                              style: TextStyle(
                                fontFamily: 'Poppins', // Use the Poppins font
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Author', // Placeholder text, can be replaced with actual author
                              style: TextStyle(
                                fontFamily: 'Poppins', // Use the Poppins font
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SectionTitle(title: 'Genres'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GenreRow(),
                ],
              ),
            ),
            SizedBox(height: 20), // Adjust as needed for spacing
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, -1), // Shadow position
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0, // Increased border width
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 30, // Increased icon size
            selectedItemColor: Colors.blue.shade900, // Darker shade of blue
            unselectedItemColor: Colors.blue.shade700, // Darker shade of blue
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              _buildNavigationBarItem(Icons.book, 'Books', 0),
              _buildNavigationBarItem(Icons.search, 'Search', 1),
              _buildNavigationBarItem(Icons.home, 'Home', 2),
              _buildNavigationBarItem(Icons.save, 'Saved', 3),
              _buildNavigationBarItem(Icons.person, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }
  BottomNavigationBarItem _buildNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: _selectedIndex == index ? '' : label, // Hide label when selected
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins', // Use the Poppins font
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BookRow extends StatelessWidget {
  final String category;
  final Function(String, String) onTap; // Update to include bookTitle

  BookRow({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 4; i++) // Updated to 4 books (adjust as needed)
          GestureDetector(
            onTap: () {
              onTap('assets/$category/book$i.png', 'Book Title $i'); // Pass bookTitle
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 140, // Adjusted width for more space
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      child: Image.asset(
                        'assets/$category/book$i.png',
                        fit: BoxFit.cover,
                        height: 220, // Increased height
                        width: 140, // Specified width
                      ),
                    ),
                    SizedBox(height: 4), // Space between image and text
                    Text(
                      'Book Title $i', // Placeholder text, should be replaced with actual book title
                      style: TextStyle(
                        fontFamily: 'Poppins', // Use the Poppins font
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Author', // Placeholder text, can be replaced with actual author
                      style: TextStyle(
                        fontFamily: 'Poppins', // Use the Poppins font
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class GenreRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final genres = [
      {'name': 'Drama', 'image': 'assets/genres/drama.png'},
      {'name': 'Thriller', 'image': 'assets/genres/thriller.png'},
      {'name': 'Romance', 'image': 'assets/genres/romance.png'},
      {'name': 'Sci-Fi', 'image': 'assets/genres/sci-fi.png'},
      {'name': 'Comedy', 'image': 'assets/genres/comedy.png'},
    ];

    return Row(
      children: [
        for (var genre in genres)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle genre tap action if needed
                  },
                  child: Image.asset(
                    genre['image']!,
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60, // Ensure consistent width for all genre images
                  ),
                ),
                SizedBox(height: 5), // Adjust spacing as needed
                Text(
                  genre['name']!,
                  style: TextStyle(
                    fontFamily: 'Poppins', // Use the Poppins font
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Page'),
      ),
      body: Center(
        child: Text('This is an empty page.'),
      ),
    );
  }
}
