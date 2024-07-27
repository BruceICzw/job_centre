import 'package:flutter/material.dart';
import 'package:job_centre/job_feed_service.dart';
import 'package:job_centre/models/job_post.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final JobFeedService _jobFeedService = JobFeedService();
  List<JobPost> _jobPosts = [];

  @override
  void initState() {
    super.initState();
    _fetchJobPosts();
  }

  Future<void> _fetchJobPosts() async {
    try {
      final jobPosts = await _jobFeedService.fetchJobPosts();
      setState(() {
        _jobPosts = jobPosts;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VacancyBox Jobs",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple, // Customize the background color
        elevation: 4.0,
      ),
      body: ListView.builder(
        itemCount: _jobPosts.length,
        itemBuilder: (context, index) {
          return Card(
            // Wrap ListTile with Card for elevation and rounded corners
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListTile(
              leading: CircleAvatar(
                // Leading widget as an avatar
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  _jobPosts[index]
                      .title[0]
                      .toUpperCase(), // First letter of the title
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                _jobPosts[index].title,
                style:
                    TextStyle(fontWeight: FontWeight.bold), // Bold title text
              ),
              subtitle: Text(
                _jobPosts[index].company ?? '',
                overflow:
                    TextOverflow.ellipsis, // Prevent subtitle from overflowing
              ),
              trailing: IconButton(
                // Trailing widget for actions like 'favorite'
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // TODO: Implement favorite functionality
                },
              ),
              onTap: () {
                //TODO: Add onTap functionality
              },
            ),
          );
        },
      ),
    );
  }
}
