import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      themeMode: ThemeMode.system,
      home: const ExamBuddyApp(),
    );
  }
}

class ExamBuddyApp extends StatefulWidget {
  const ExamBuddyApp({Key? key}) : super(key: key);

  @override
  State<ExamBuddyApp> createState() => _ExamBuddyAppState();
}

class _ExamBuddyAppState extends State<ExamBuddyApp> {
  int _selectedIndex = 0;
  Topic? _selectedTopic;

  final List<Topic> _topics = [
    // Original topics
    Topic(
      id: 'algorithms',
      name: 'Algorithms & Data Structures',
      iconData: Icons.code,
      description:
          'Master sorting, searching, and optimal problem solving techniques',
      resources: [
        Resource(
          name: 'GeeksforGeeks - DSA',
          url: 'https://www.geeksforgeeks.org/data-structures/',
          description:
              'Comprehensive tutorials on data structures with visualizations',
        ),
        Resource(
          name: 'Tutorialspoint - Algorithms',
          url: 'https://www.tutorialspoint.com/data_structures_algorithms/',
          description: 'Step-by-step algorithm explanations with examples',
        ),
        Resource(
          name: 'W3Schools - Data Structures',
          url: 'https://www.w3schools.in/data-structures/',
          description: 'Interactive lessons on fundamental data structures',
        ),
        Resource(
          name: 'Tpointtech - Algorithm Analysis',
          url: 'https://www.tpointtech.com/blog/algorithm-analysis/',
          description: 'Analysis techniques for algorithm performance',
        ),
      ],
    ),
    Topic(
      id: 'databases',
      name: 'Database Systems',
      iconData: Icons.storage,
      description:
          'Understand SQL, NoSQL, and database optimization techniques',
      resources: [
        Resource(
          name: 'W3Schools - SQL',
          url: 'https://www.w3schools.com/sql/',
          description: 'Interactive SQL tutorials with practice exercises',
        ),
        Resource(
          name: 'GeeksforGeeks - DBMS',
          url: 'https://www.geeksforgeeks.org/dbms/',
          description: 'Database concepts explained with examples',
        ),
        Resource(
          name: 'Tutorialspoint - MongoDB',
          url: 'https://www.tutorialspoint.com/mongodb/',
          description: 'NoSQL database tutorials for beginners',
        ),
        Resource(
          name: 'Tpointtech - Database Design',
          url: 'https://www.tpointtech.com/blog/database-design/',
          description: 'Best practices for efficient database design',
        ),
      ],
    ),
    Topic(
      id: 'webdev',
      name: 'Web Development',
      iconData: Icons.web,
      description: 'Learn frontend and backend techniques for modern web apps',
      resources: [
        Resource(
          name: 'W3Schools - HTML/CSS/JS',
          url: 'https://www.w3schools.com/',
          description: 'Complete web development tutorials with examples',
        ),
        Resource(
          name: 'GeeksforGeeks - Web Tech',
          url: 'https://www.geeksforgeeks.org/web-technology/',
          description: 'Advanced web concepts and frameworks',
        ),
        Resource(
          name: 'Tutorialspoint - React',
          url: 'https://www.tutorialspoint.com/reactjs/',
          description: 'Modern frontend development with React',
        ),
        Resource(
          name: 'Tpointtech - Full Stack',
          url: 'https://www.tpointtech.com/blog/full-stack-development/',
          description: 'Full stack development guides and best practices',
        ),
      ],
    ),
    Topic(
      id: 'networking',
      name: 'Computer Networks',
      iconData: Icons.router,
      description: 'Explore protocols, network security, and architecture',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Networks',
          url: 'https://www.geeksforgeeks.org/computer-network-tutorials/',
          description: 'Complete network concepts from basics to advanced',
        ),
        Resource(
          name: 'Tutorialspoint - Networking',
          url:
              'https://www.tutorialspoint.com/data_communication_computer_network/',
          description: 'Data communication and networking fundamentals',
        ),
        Resource(
          name: 'W3Schools - Cybersecurity',
          url: 'https://www.w3schools.com/cybersecurity/',
          description: 'Network security principles and practices',
        ),
        Resource(
          name: 'Tpointtech - Network Design',
          url: 'https://www.tpointtech.com/blog/network-architecture/',
          description: 'Best practices for network architecture design',
        ),
      ],
    ),

    // Additional topics
    Topic(
      id: 'c-programming',
      name: 'C Programming',
      iconData: Icons.code_rounded,
      description: 'Learn the foundational language for systems programming',
      resources: [
        Resource(
          name: 'GeeksforGeeks - C Programming',
          url: 'https://www.geeksforgeeks.org/c-programming-language/',
          description: 'C language fundamentals with practical examples',
        ),
        Resource(
          name: 'Tutorialspoint - C',
          url: 'https://www.tutorialspoint.com/cprogramming/',
          description: 'Comprehensive C programming tutorials with examples',
        ),
        Resource(
          name: 'W3Schools - C Tutorial',
          url: 'https://www.w3schools.in/c-tutorial/',
          description: 'Interactive C language lessons for beginners',
        ),
        Resource(
          name: 'Tpointtech - C Projects',
          url: 'https://www.tpointtech.com/blog/c-programming-projects/',
          description: 'Hands-on C programming projects to build skills',
        ),
      ],
    ),
    Topic(
      id: 'python',
      name: 'Python',
      iconData: Icons.code_off_rounded,
      description:
          'Master Python for applications in data science, AI, and web development',
      resources: [
        Resource(
          name: 'W3Schools - Python',
          url: 'https://www.w3schools.com/python/',
          description: 'Interactive Python tutorials with examples',
        ),
        Resource(
          name: 'GeeksforGeeks - Python',
          url: 'https://www.geeksforgeeks.org/python-programming-language/',
          description: 'Python programming concepts with practical examples',
        ),
        Resource(
          name: 'Tutorialspoint - Python',
          url: 'https://www.tutorialspoint.com/python/',
          description: 'Comprehensive Python tutorials from basics to advanced',
        ),
        Resource(
          name: 'Tpointtech - Python Libraries',
          url: 'https://www.tpointtech.com/blog/python-libraries/',
          description: 'Essential Python libraries for different domains',
        ),
      ],
    ),
    Topic(
      id: 'java',
      name: 'Java',
      iconData: Icons.coffee,
      description:
          'Learn Java for enterprise applications and Android development',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Java',
          url: 'https://www.geeksforgeeks.org/java/',
          description: 'Java programming fundamentals and advanced concepts',
        ),
        Resource(
          name: 'W3Schools - Java',
          url: 'https://www.w3schools.com/java/',
          description: 'Interactive Java tutorials with examples',
        ),
        Resource(
          name: 'Tutorialspoint - Java',
          url: 'https://www.tutorialspoint.com/java/',
          description: 'Comprehensive Java programming guide with examples',
        ),
        Resource(
          name: 'Tpointtech - Java Frameworks',
          url: 'https://www.tpointtech.com/blog/java-frameworks/',
          description: 'Popular Java frameworks for enterprise development',
        ),
      ],
    ),
    Topic(
      id: 'digital-electronics',
      name: 'Digital Electronics',
      iconData: Icons.memory,
      description:
          'Understand digital circuits, logic gates, and electronic components',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Digital Electronics',
          url:
              'https://www.geeksforgeeks.org/digital-electronics-logic-design-tutorials/',
          description: 'Digital circuit design fundamentals and logic gates',
        ),
        Resource(
          name: 'Tutorialspoint - Digital Circuits',
          url: 'https://www.tutorialspoint.com/digital_circuits/',
          description: 'Circuit analysis and design principles',
        ),
        Resource(
          name: 'W3Schools - Electronics',
          url: 'https://www.w3schools.in/electronics/',
          description: 'Basic electronics concepts for beginners',
        ),
        Resource(
          name: 'Tpointtech - Digital Systems',
          url: 'https://www.tpointtech.com/blog/digital-systems/',
          description: 'Advanced digital systems and design methodologies',
        ),
      ],
    ),
    Topic(
      id: 'cpp',
      name: 'C++ Programming',
      iconData: Icons.add_circle_outline,
      description:
          'Learn object-oriented programming with C++ for high-performance applications',
      resources: [
        Resource(
          name: 'W3Schools - C++',
          url: 'https://www.w3schools.com/cpp/',
          description: 'Interactive C++ tutorials with examples',
        ),
        Resource(
          name: 'GeeksforGeeks - C++',
          url: 'https://www.geeksforgeeks.org/c-plus-plus/',
          description: 'C++ programming concepts with practical examples',
        ),
        Resource(
          name: 'Tutorialspoint - C++',
          url: 'https://www.tutorialspoint.com/cplusplus/',
          description: 'Comprehensive C++ tutorials with examples',
        ),
        Resource(
          name: 'Tpointtech - C++ STL',
          url: 'https://www.tpointtech.com/blog/cpp-stl/',
          description: 'Standard Template Library usage and best practices',
        ),
      ],
    ),
    Topic(
      id: 'system-analysis',
      name: 'System Analysis and Design',
      iconData: Icons.architecture,
      description:
          'Learn methodologies for analyzing, designing, and implementing information systems',
      resources: [
        Resource(
          name: 'Tutorialspoint - System Analysis',
          url: 'https://www.tutorialspoint.com/system_analysis_and_design/',
          description: 'System analysis and design methodologies',
        ),
        Resource(
          name: 'GeeksforGeeks - SDLC',
          url:
              'https://www.geeksforgeeks.org/software-development-life-cycle-sdlc/',
          description: 'Software development life cycle models',
        ),
        Resource(
          name: 'W3Schools - UML',
          url: 'https://www.w3schools.in/uml/',
          description: 'UML diagrams and modeling techniques',
        ),
        Resource(
          name: 'Tpointtech - Requirements Engineering',
          url: 'https://www.tpointtech.com/blog/requirements-engineering/',
          description: 'Requirements gathering and analysis techniques',
        ),
      ],
    ),
    Topic(
      id: 'internet-applications',
      name: 'Internet Applications',
      iconData: Icons.language,
      description: 'Develop web and mobile applications for the internet',
      resources: [
        Resource(
          name: 'W3Schools - Web Applications',
          url: 'https://www.w3schools.com/whatis/whatis_application.asp',
          description: 'Web application fundamentals and architecture',
        ),
        Resource(
          name: 'GeeksforGeeks - Web Applications',
          url: 'https://www.geeksforgeeks.org/web-application-architecture/',
          description: 'Web application architecture and design patterns',
        ),
        Resource(
          name: 'Tutorialspoint - REST API',
          url: 'https://www.tutorialspoint.com/restful/',
          description: 'RESTful web services design and implementation',
        ),
        Resource(
          name: 'Tpointtech - Progressive Web Apps',
          url: 'https://www.tpointtech.com/blog/progressive-web-apps/',
          description: 'Building modern progressive web applications',
        ),
      ],
    ),
    Topic(
      id: 'operating-system',
      name: 'Operating System',
      iconData: Icons.computer,
      description:
          'Understand OS concepts, process management, and resource allocation',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Operating Systems',
          url: 'https://www.geeksforgeeks.org/operating-systems/',
          description: 'OS concepts, process management, and memory management',
        ),
        Resource(
          name: 'Tutorialspoint - OS',
          url: 'https://www.tutorialspoint.com/operating_system/',
          description: 'Comprehensive OS tutorials with examples',
        ),
        Resource(
          name: 'W3Schools - OS Basics',
          url: 'https://www.w3schools.in/operating-system/',
          description: 'Operating system fundamentals for beginners',
        ),
        Resource(
          name: 'Tpointtech - Linux Kernel',
          url: 'https://www.tpointtech.com/blog/linux-kernel/',
          description: 'Linux kernel architecture and internals',
        ),
      ],
    ),
    Topic(
      id: 'computer-graphics',
      name: 'Computer Graphics',
      iconData: Icons.brush,
      description: 'Learn 2D and 3D rendering techniques and visual computing',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Graphics',
          url: 'https://www.geeksforgeeks.org/computer-graphics-2/',
          description: 'Computer graphics algorithms and techniques',
        ),
        Resource(
          name: 'Tutorialspoint - Computer Graphics',
          url: 'https://www.tutorialspoint.com/computer_graphics/',
          description: 'Fundamentals of computer graphics with examples',
        ),
        Resource(
          name: 'W3Schools - Canvas Graphics',
          url: 'https://www.w3schools.com/graphics/',
          description: 'Web-based graphics programming tutorials',
        ),
        Resource(
          name: 'Tpointtech - 3D Modeling',
          url: 'https://www.tpointtech.com/blog/3d-modeling/',
          description: '3D modeling techniques and tools',
        ),
      ],
    ),
    Topic(
      id: 'cloud-computing',
      name: 'Cloud Computing',
      iconData: Icons.cloud,
      description:
          'Explore cloud services, virtualization, and distributed systems',
      resources: [
        Resource(
          name: 'GeeksforGeeks - Cloud Computing',
          url: 'https://www.geeksforgeeks.org/cloud-computing/',
          description: 'Cloud computing concepts and service models',
        ),
        Resource(
          name: 'Tutorialspoint - Cloud Computing',
          url: 'https://www.tutorialspoint.com/cloud_computing/',
          description: 'Comprehensive cloud computing tutorials',
        ),
        Resource(
          name: 'W3Schools - AWS',
          url: 'https://www.w3schools.com/aws/',
          description: 'Amazon Web Services tutorials for beginners',
        ),
        Resource(
          name: 'Tpointtech - Cloud Security',
          url: 'https://www.tpointtech.com/blog/cloud-security/',
          description: 'Security best practices for cloud environments',
        ),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedTopic = null;
    });
  }

  void _selectTopic(Topic topic) {
    setState(() {
      _selectedTopic = topic;
    });
  }

  void _closeTopicDetails() {
    setState(() {
      _selectedTopic = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Study Recommendations',
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: _selectedTopic == null
          ? _buildMainContent()
          : TopicDetailScreen(
              topic: _selectedTopic!,
              onClose: _closeTopicDetails,
            ),
    );
  }

  Widget _buildMainContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildRecommendationsScreen();
      // case 1:
      //   return const SavedResourcesScreen();
      // case 2:
      //   return const SettingsScreen();
      default:
        return _buildRecommendationsScreen();
    }
  }

  Widget _buildRecommendationsScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (var topic in _topics)
          TopicCard(
            topic: topic,
            onTap: () => _selectTopic(topic),
          ),
      ],
    );
  }
}

// Topic Card Widget
class TopicCard extends StatelessWidget {
  final Topic topic;
  final VoidCallback onTap;

  const TopicCard({
    Key? key,
    required this.topic,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: Icon(
                  topic.iconData,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      topic.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

// Topic Detail Screen
class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  final VoidCallback onClose;

  const TopicDetailScreen({
    Key? key,
    required this.topic,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onClose,
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: Icon(
                  topic.iconData,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  topic.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            topic.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recommended Resources',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: topic.resources.length,
            itemBuilder: (context, index) {
              final resource = topic.resources[index];
              return ResourceCard(resource: resource);
            },
          ),
        ),
      ],
    );
  }
}

// Resource Card Widget
class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _saveResource(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Get the existing saved resources list
    final savedResources = prefs.getStringList('saved_resources') ?? [];

    // Check if resource is already saved
    if (!savedResources.contains(resource.id)) {
      // Add the resource ID to the list
      savedResources.add(resource.id);
      await prefs.setStringList('saved_resources', savedResources);

      // Save the resource details
      await prefs.setString(
          'resource_${resource.id}', jsonEncode(resource.toMap()));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resource saved successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resource already saved')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => _launchUrl(resource.url),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      resource.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.open_in_new,
                    size: 20,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                resource.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Chip(
                    label: Text('Recommended'),
                    backgroundColor: Colors.green,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => _saveResource(context),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data Models
class Topic {
  final String id;
  final String name;
  final IconData iconData;
  final String description;
  final List<Resource> resources;

  Topic({
    required this.id,
    required this.name,
    required this.iconData,
    required this.description,
    required this.resources,
  });
}

class Resource {
  final String name;
  final String url;
  final String description;
  String id; // Added ID field

  Resource({
    required this.name,
    required this.url,
    required this.description,
  }) : id = '$name-${DateTime.now().millisecondsSinceEpoch}'; // Generate a unique ID

  // Add conversion methods
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
    };
  }

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      name: map['name'],
      description: map['description'],
      url: map['url'],
    )..id = map['id']; // Set ID after construction
  }
}
