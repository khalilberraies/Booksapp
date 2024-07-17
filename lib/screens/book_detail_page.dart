import 'package:flutter/material.dart';
import 'home_page.dart';
import 'all_books_page.dart';
import 'package:bookstore_app/screens/profile_page.dart';

class BookDetailPage extends StatefulWidget {
  final String bookTitle;
  final String bookImagePath;

  BookDetailPage({required this.bookTitle, required this.bookImagePath});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
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
    } else if (index == 0) { // Books icon tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllBooksPage()),
      );
    } else if (index == 2) { // Home icon tapped
      Navigator.pop(context); // Go back to the previous screen (Back button functionality)
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
          'assets/logo.png', // Path to your logo image
          width: 53.26,
          height: 58.49,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBookDetails(),
              SizedBox(height: 20),
              _buildDescription(),
              SizedBox(height: 20),
              _buildSuggestions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBookDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150, // Increased width for larger image
          height: 220, // Increased height for larger image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.bookImagePath, // Use widget.bookImagePath
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.bookTitle, // Use widget.bookTitle
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildDetailLine('Author', 'Shari Lapena'),
              _buildDetailLine('Genre', 'Romance, Thriller'),
              _buildDetailLine('Language', 'Français'),
              _buildDetailLine('Number of Pages', '304 P'),
              SizedBox(height: 8),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailLine(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: $value',
            style: TextStyle(
              fontSize: 14, // Smaller font size
              fontFamily: 'Poppins',
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 2),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(top: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean at facilisis lacus, eget eleifend mi. Proin laoreet porttitor magna ut finibus. Cras in semper turpis. Phasellus vulputate, leo quis congue rutrum, nisi ex scelerisque nibh, varius eleifend libero lacus a lacus. Nam eget convallis purus. Integer vulputate elit id tempus accumsan.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestions() {
    final List<Map<String, String>> suggestedBooks = [
      {
        'image': 'assets/books/book2.png',
        'title': 'Book 2',
      },
      {
        'image': 'assets/books/book3.png',
        'title': 'Book 3',
      },
      {
        'image': 'assets/books/book4.png',
        'title': 'Book 4',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggestions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: suggestedBooks.map((book) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle book tap
                  },
                  child: Container(
                    width: 120, // Adjusted width for larger image
                    height: 180, // Adjusted height for larger image
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        book['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
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
            offset: Offset(0, -1),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1.0,
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
          iconSize: 30,
          selectedItemColor: Colors.blue.shade900,
          unselectedItemColor: Colors.blue.shade700,
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
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: _selectedIndex == index ? '' : label,
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
