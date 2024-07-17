import 'package:flutter/material.dart';
import 'all_books_page.dart';
import 'home_page.dart';
import 'login_page.dart'; // Import the login page

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _passwordVisible = false;
  int _selectedIndex = 4; // Default to Profile icon selected

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
    } else if (index == 4) { // Profile icon tapped (already on profile page)
      // Do nothing or handle additional profile actions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x80E4C8A1), // #E4C8A180
              Color(0x80888888), // #88888880
              Color(0x8011306E), // #11306E80
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Profile Page',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile.png'), // Add your profile image path
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome Khalil', // Replace with actual user name
                  style: TextStyle(
                    fontFamily: 'Poppins', // Use the Poppins font
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildInfoItem('Email', 'khalil@gmail.com'), // Replace with actual email
                _buildInfoItem('Phone Number', '+1234567890'), // Replace with actual phone number
                _buildInfoItem('Language', 'English'), // Replace with actual language
                _buildInfoItem('City', 'Rades'), // New: Display city name
                _buildInfoItem('Country', 'Tunisia'), // New: Display country name
                _buildPasswordItem('Password', 'khalilberraies'), // New: Display password
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle change password action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade900, // Text color
                  ),
                  child: Text(
                    'Change My Password',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Use the Poppins font
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add some space between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, // Text color
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Use the Poppins font
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildGradientBottomNavigationBar(),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontFamily: 'Poppins', // Use the Poppins font
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins', // Use the Poppins font
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontFamily: 'Poppins', // Use the Poppins font
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              _passwordVisible ? value : '*********', // Display password based on visibility state
              style: TextStyle(
                fontFamily: 'Poppins', // Use the Poppins font
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility, // Toggle icon based on visibility state
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible; // Toggle password visibility
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGradientBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x80E4C8A1), // #E4C8A180
            Color(0x80888888), // #88888880
            Color(0x8011306E), // #11306E80
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
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
      body: Center(
        child: Text('This is an empty page.'),
      ),
    );
  }
}
