import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'dart:convert';

class SavedResourcesPage extends StatefulWidget {
  const SavedResourcesPage({Key? key}) : super(key: key);

  @override
  State<SavedResourcesPage> createState() => _SavedResourcesPageState();
}

class _SavedResourcesPageState extends State<SavedResourcesPage> {
  List<Resource> _savedResources = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedResources();
  }

  Future<void> _loadSavedResources() async {
    setState(() {
      _isLoading = true;
    });

    final resources = await getSavedResources();

    setState(() {
      _savedResources = resources;
      _isLoading = false;
    });
  }

  Future<List<Resource>> getSavedResources() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList('saved_resources') ?? [];

    List<Resource> resources = [];
    for (String id in savedIds) {
      final json = prefs.getString('resource_$id');
      if (json != null) {
        resources.add(Resource.fromMap(jsonDecode(json)));
      }
    }

    return resources;
  }

  Future<void> _removeResource(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final savedResources = prefs.getStringList('saved_resources') ?? [];

    savedResources.remove(id);
    await prefs.setStringList('saved_resources', savedResources);

    setState(() {
      _savedResources.removeWhere((resource) => resource.id == id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Resource removed from saved list')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Saved Resources'),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: const Text("Saved Resources",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            )),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _savedResources.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No saved resources yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Resources you save will appear here',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _savedResources.length,
                  itemBuilder: (context, index) {
                    final resource = _savedResources[index];
                    return SavedResourceCard(
                      resource: resource,
                      onRemove: () => _removeResource(resource.id),
                    );
                  },
                ),
    );
  }
}

class SavedResourceCard extends StatelessWidget {
  final Resource resource;
  final VoidCallback onRemove;

  const SavedResourceCard({
    Key? key,
    required this.resource,
    required this.onRemove,
  }) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await url_launcher.launchUrl(
      uri,
      mode: url_launcher.LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
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
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: onRemove,
                      ),
                      const Icon(
                        Icons.open_in_new,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}

class Resource {
  final String id;
  final String name;
  final String description;
  final String url;

  const Resource({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
  });

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
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
    );
  }
}
