import 'package:flutter/material.dart';
import 'book_detail_page.dart'; // Import your BookDetailPage
import 'profile_page.dart'; // Import your ProfilePage

class AllBooksPage extends StatefulWidget {
  @override
  _AllBooksPageState createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  final List<Map<String, String>> books = [
    {'image': 'assets/books/book1.png', 'title': 'Book 1', 'author': 'Author 1'},
    {'image': 'assets/books/book2.png', 'title': 'Book 2', 'author': 'Author 2'},
    {'image': 'assets/books/book3.png', 'title': 'Book 3', 'author': 'Author 3'},
    {'image': 'assets/books/book4.png', 'title': 'Book 4', 'author': 'Author 4'},
    {'image': 'assets/books/book5.png', 'title': 'Book 5', 'author': 'Author 5'},
    {'image': 'assets/books/book6.png', 'title': 'Book 6', 'author': 'Author 6'},
    // Add more books as needed
  ];

  int _selectedIndex = 2; // Default to Home icon selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1 || index == 3) { // Search or Saved icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmptyPage()), // Replace EmptyPage with your empty page widget
      );
    } else if (index == 2) { // Home icon tapped
      Navigator.pop(context); // Go back to the previous screen (Back button functionality)
    } else if (index == 0) { // Books icon tapped
      // No action needed as we are already on the AllBooksPage
    } else if (index == 4) { // Profile icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png', // Replace with your logo path
          width: 53.26,
          height: 58.49,
        ),
        centerTitle: true, // Center the logo in the AppBar
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(
                      bookTitle: books[index]['title']!,
                      bookImagePath: books[index]['image']!,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          spreadRadius: 1.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      books[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    books[index]['author']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
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
      label: index == 2 ? '' : label, // Hide label when selected
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
