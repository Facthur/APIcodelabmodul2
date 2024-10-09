import 'package:flutter/material.dart';
//import 'package:codelabmodul2/services/api_service.dart';  // Import service API
//import 'package:codelabmodul2/models/article_view.dart';  // Import model hasil QuickType
import '../models/article_view.dart';
import '../services/api_service.dart';
import 'webview_screen.dart';  // Import WebView untuk menampilkan halaman web

class ApiDataScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data dari API'),
      ),
      body: FutureBuilder<Welcome?>(
        future: apiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  child: ListTile(
                    title: Text(article.title),
                    subtitle: Text(article.description),
                    leading: Image.network(article.urlToImage),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: article.url),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
