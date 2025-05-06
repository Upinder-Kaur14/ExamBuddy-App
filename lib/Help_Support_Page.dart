import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar for help topics
          _buildSearchBar(),
          const SizedBox(height: 24),

          // Frequently Asked Questions
          _buildSectionTitle('Frequently Asked Questions'),
          _buildFaqItem(
              context,
              'How do I create a study plan?',
              'To create a study plan, navigate to the Study Planner section from the home screen. '
                  'Tap on "Create New Plan", select your exam date, and add subjects you want to study. '
                  'ExamBuddy will help you distribute your study time efficiently.'),
          _buildFaqItem(
              context,
              'Can I sync my data across multiple devices?',
              'Yes! Make sure you\'re logged in with the same account on all your devices. '
                  'ExamBuddy automatically syncs your study plans, notes, and progress across all your devices.'),
          _buildFaqItem(
              context,
              'How do I report a bug or issue?',
              'To report a bug, go to Settings > Report an Issue, or contact us directly through '
                  'the Contact Support option below. Please provide details about the issue and steps to reproduce it.'),
          _buildFaqItem(
              context,
              'How do I reset my password?',
              'To reset your password, go to the login screen and tap on "Forgot Password". '
                  'Enter your registered email address and follow the instructions sent to your email.'),
          _buildFaqItem(
              context,
              'Why are my practice tests not loading?',
              'If practice tests aren\'t loading, check your internet connection first. If the problem persists, '
                  'try clearing the app cache (Settings > Storage > Clear Cache) or reinstall the app.'),

          const SizedBox(height: 24),

          // Contact Support options
          _buildSectionTitle('Contact Support'),
          _buildContactItem(
              context,
              Icons.email_outlined,
              'Email Support',
              'Send us a detailed message',
              () => _launchEmail(
                  'support@exambuddy.com', 'ExamBuddy Support Request')),
          _buildContactItem(context, Icons.chat_bubble_outline, 'Live Chat',
              'Chat with our support team', () => _navigateToLiveChat(context)),
          _buildContactItem(
              context,
              Icons.forum_outlined,
              'Community Forum',
              'Get help from other users',
              () => _launchUrl('https://community.exambuddy.com')),

          const SizedBox(height: 24),

          // Troubleshooting Guides
          _buildSectionTitle('Troubleshooting Guides'),
          _buildTroubleshootingItem(
              context,
              'Fixing WebView Issues',
              'If you\'re experiencing problems with in-app web content',
              () => _navigateToGuide(context, 'webview_guide')),
          _buildTroubleshootingItem(
              context,
              'Sync Problems',
              'Solutions for data synchronization issues',
              () => _navigateToGuide(context, 'sync_guide')),
          _buildTroubleshootingItem(
              context,
              'App Performance',
              'Tips to improve app speed and reduce crashes',
              () => _navigateToGuide(context, 'performance_guide')),

          const SizedBox(height: 24),

          // System information
          _buildSectionTitle('System Information'),
          _buildInfoItem('App Version', '2.4.1'),
          _buildInfoItem('Device',
              '${Theme.of(context).platform.toString().split('.').last}'),

          const SizedBox(height: 32),
          Center(
            child: TextButton(
              onPressed: () => _launchUrl('https://exambuddy.com/terms'),
              child: const Text('Terms of Service & Privacy Policy'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for help topics...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      onChanged: (value) {
        // Implement search functionality here
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String title,
      String subtitle, VoidCallback onTap) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildTroubleshootingItem(
      BuildContext context, String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange.withOpacity(0.1),
        child: const Icon(
          Icons.build_outlined,
          color: Colors.orange,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Future<void> _launchEmail(String email, String subject) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      // Handle error
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Handle error
    }
  }

  void _navigateToLiveChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LiveChatScreen(),
      ),
    );
  }

  void _navigateToGuide(BuildContext context, String guideId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TroubleshootingGuideScreen(guideId: guideId),
      ),
    );
  }
}

// Live Chat Screen
class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Chat Support'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Connect with our support team',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Initialize chat functionality
              },
              child: const Text('Start Chat'),
            ),
          ],
        ),
      ),
    );
  }
}

// Troubleshooting Guide Screen
class TroubleshootingGuideScreen extends StatelessWidget {
  final String guideId;

  const TroubleshootingGuideScreen({Key? key, required this.guideId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Content based on guide ID
    String title = '';
    List<Map<String, dynamic>> steps = [];

    switch (guideId) {
      case 'webview_guide':
        title = 'Fixing WebView Issues';
        steps = [
          {
            'title': 'Check Internet Connection',
            'description':
                'Ensure you have a stable internet connection. Try switching between Wi-Fi and mobile data.'
          },
          {
            'title': 'Clear App Cache',
            'description':
                'Go to your device Settings > Apps > ExamBuddy > Storage > Clear Cache.'
          },
          {
            'title': 'Update the App',
            'description':
                'Make sure you\'re using the latest version of ExamBuddy. Check for updates in the app store.'
          },
          {
            'title': 'Restart the App',
            'description': 'Close the app completely and reopen it.'
          },
          {
            'title': 'WebView Specific Solutions',
            'description':
                'If you\'re getting errors like "net::ERR_CACHE_MISS", try toggling the airplane mode on and off, or restart your device.'
          },
        ];
        break;
      case 'sync_guide':
        title = 'Sync Problems';
        steps = [
          {
            'title': 'Check Internet Connection',
            'description': 'Ensure you have a stable internet connection.'
          },
          {
            'title': 'Verify Account Login',
            'description':
                'Make sure you\'re logged in with the correct account across all devices.'
          },
          {
            'title': 'Force Sync',
            'description':
                'Go to Settings > Account > Force Sync to manually trigger data synchronization.'
          },
          {
            'title': 'Clear App Data',
            'description':
                'As a last resort, you can clear app data. Note: This will delete local data. Make sure you\'re logged in so your data can be restored from our servers.'
          },
        ];
        break;
      case 'performance_guide':
        title = 'App Performance';
        steps = [
          {
            'title': 'Close Background Apps',
            'description':
                'Close other apps running in the background to free up memory.'
          },
          {
            'title': 'Update the App',
            'description':
                'Ensure you\'re using the latest version of ExamBuddy.'
          },
          {
            'title': 'Clear Cache',
            'description':
                'Go to Settings > Storage > Clear Cache to remove temporary files.'
          },
          {
            'title': 'Restart Device',
            'description':
                'Restart your device to clear memory and fix potential software glitches.'
          },
          {
            'title': 'Check for Device Updates',
            'description':
                'Make sure your device is running the latest operating system version.'
          },
        ];
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int i = 0; i < steps.length; i++)
            _buildStep(i + 1, steps[i]['title'], steps[i]['description']),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Still having issues?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to contact support
              },
              child: const Text('Contact Support'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
