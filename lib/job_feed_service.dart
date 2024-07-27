import "package:http/http.dart" as http;
import "package:job_centre/models/job_post.dart";
import "package:webfeed/webfeed.dart";

class JobFeedService {
  final String rssFeedUrl =
      "https://vacancybox.co.zw/?feed=job_feed&job_types&search_location&job_categories&search_keywords";

  Future<List<JobPost>> fetchJobPosts() async {
    final response = await http.get(Uri.parse(rssFeedUrl));
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      return feed.items!.map((item) {
        return JobPost(
          title: item.title!,
          link: item.link!,
          description: item.description!,
          company: item.dc?.creator,
          location: item.dc?.creator,
          postedDate: item.pubDate?.toString(),
        );
      }).toList();
    } else {
      throw Exception('Failed to load job feed');
    }
  }
}
