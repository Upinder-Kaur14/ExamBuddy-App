import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final Function(String)? onProfileUpdate;

  const ProfilePage({
    Key? key,
    this.onProfileUpdate,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isProfileComplete = false;
  bool _isEditing = true; // Start in editing mode

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _rollNumberController.dispose();
    _courseController.dispose();
    _semesterController.dispose();
    _institutionController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _checkProfileCompletion() {
    setState(() {
      _isProfileComplete = _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _rollNumberController.text.isNotEmpty &&
          _courseController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    // Add listeners to check profile completion status
    _nameController.addListener(_checkProfileCompletion);
    _emailController.addListener(_checkProfileCompletion);
    _rollNumberController.addListener(_checkProfileCompletion);
    _courseController.addListener(_checkProfileCompletion);
  }

  // Load saved data from SharedPreferences
  Future<void> _loadProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _nameController.text = prefs.getString('currentUserName') ?? '';
        _emailController.text = prefs.getString('currentUserEmail') ?? '';
        _rollNumberController.text = prefs.getString('rollNumber') ?? '';
        _courseController.text = prefs.getString('course') ?? '';
        _semesterController.text = prefs.getString('semester') ?? '';
        _institutionController.text = prefs.getString('institution') ?? '';
        _phoneController.text = prefs.getString('phone') ?? '';

        // Set editing mode based on whether profile is filled
        _checkProfileCompletion();
        _isEditing = !_isProfileComplete;
      });
    } catch (e) {
      print('Error loading profile data: $e');
      // Handle error gracefully
    }
  }

  // Save data to SharedPreferences
  Future<void> _saveProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // After saving the profile data
      if (widget.onProfileUpdate != null) {
        widget.onProfileUpdate!(_nameController.text);
      }
      await prefs.setString('name', _nameController.text);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('rollNumber', _rollNumberController.text);
      await prefs.setString('course', _courseController.text);
      await prefs.setString('semester', _semesterController.text);
      await prefs.setString('institution', _institutionController.text);
      await prefs.setString('phone', _phoneController.text);

      // Check profile completion after saving
      _checkProfileCompletion();
    } catch (e) {
      print('Error saving profile data: $e');
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                if (_formKey.currentState!.validate()) {
                  // Save profile
                  _saveProfileData();
                  setState(() {
                    _isEditing = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Profile updated successfully'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 2),
                  ));
                }
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 180,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: _nameController.text.isNotEmpty
                              ? Text(
                                  _getInitials(_nameController.text),
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                  ),
                                )
                              : Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.blue.shade700,
                                ),
                        ),
                        if (_isEditing)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blue.shade700,
                                size: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _nameController.text.isNotEmpty
                          ? _nameController.text
                          : "Complete Your Profile",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_rollNumberController.text.isNotEmpty)
                      Text(
                        _rollNumberController.text,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Profile details form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!_isProfileComplete && !_isEditing)
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.amber.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.amber.shade800,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Complete your profile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Fill in your details to personalize your ExamBuddy experience",
                                    style: TextStyle(
                                      color: Colors.amber.shade900,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isEditing = true;
                                });
                              },
                              child: const Text("Edit"),
                            ),
                          ],
                        ),
                      ),

                    // Personal Information section
                    _buildSectionHeader("Personal Information"),

                    _buildProfileField(
                      "Full Name",
                      _nameController,
                      Icons.person_outline,
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    _buildProfileField(
                      "Email Address",
                      _emailController,
                      Icons.email_outlined,
                      enabled: _isEditing,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      hint: "example@email.com",
                    ),

                    _buildProfileField(
                      "Phone Number",
                      _phoneController,
                      Icons.phone_outlined,
                      enabled: _isEditing,
                      keyboardType: TextInputType.phone,
                      hint: "(Optional) Add your phone number",
                    ),

                    // Academic Information section
                    _buildSectionHeader("Academic Information"),

                    _buildProfileField(
                      "Institution/University",
                      _institutionController,
                      Icons.account_balance_outlined,
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your institution';
                        }
                        return null;
                      },
                      hint: "Enter your college or university name",
                    ),

                    _buildProfileField(
                      "Roll Number/Student ID",
                      _rollNumberController,
                      Icons.badge_outlined,
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your roll number';
                        }
                        return null;
                      },
                      hint: "Enter your university roll number",
                    ),

                    _buildProfileField(
                      "Course/Program",
                      _courseController,
                      Icons.school_outlined,
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your course';
                        }
                        return null;
                      },
                      hint: "e.g., B.Tech Computer Science",
                    ),

                    _buildProfileField(
                      "Current Semester",
                      _semesterController,
                      Icons.calendar_today_outlined,
                      enabled: _isEditing,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your semester';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      hint: "e.g., 1, 2, 3...",
                    ),

                    const SizedBox(height: 24),

                    if (_isEditing)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Call save function here - this was missing!
                              _saveProfileData();
                              setState(() {
                                _isEditing = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Profile updated successfully'),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Save Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    if (!_isEditing && _isProfileComplete)
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green.shade600,
                                size: 48,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Profile Complete",
                                style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Your ExamBuddy profile is set up and ready to go!",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: Colors.blue.shade100),
        ],
      ),
    );
  }

  Widget _buildProfileField(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool enabled = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    String? hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade500, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red.shade300),
          ),
          filled: !enabled,
          fillColor: !enabled ? Colors.grey.shade50 : null,
          enabled: enabled,
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return (nameParts[0][0] + nameParts[1][0]).toUpperCase();
    } else if (name.isNotEmpty) {
      return name[0].toUpperCase();
    }
    return '';
  }
}
