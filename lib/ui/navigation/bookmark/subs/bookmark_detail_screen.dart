import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/bloc/bookmark/bookmark_bloc.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:newsly/utils/extensions/extensions.dart';
import 'package:newsly/utils/theme/app_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class BookmarkDetailScreen extends StatelessWidget {
  final ArticlesModel article;

  const BookmarkDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.sourceName),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("Remove Bookmark"),
                    content: Text(
                      "Do you want to remove this article from your bookmarks?",
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Yes"),
                        onPressed: () {
                          context.read<BookmarkBloc>().add(
                            RemoveBookmarkNewsEvent(id: article.id.toString()),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        height: 220.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.w),
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Icon(Icons.image_not_supported),
              ),
            ),
            16.ph,
            Text(
              article.title,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            8.ph,
            // Text(
            //   formatDateTime(article.publishedAt),
            //   style: TextStyle(color: Colors.grey[600]),
            // ),
            16.ph,
            Text(article.description, style: TextStyle(fontSize: 16.sp)),
            12.ph,
            Text(article.content, style: TextStyle(fontSize: 16.sp)),
            16.ph,
            Text("Author: ${article.author}"),
            Text("Source: ${article.sourceName}"),
            24.ph,
            ElevatedButton.icon(
              onPressed:
                  () => Navigator.pushNamed(
                    context,
                    RouteNames.webView,
                    arguments: article.url,
                  ),
              icon: Icon(Icons.open_in_browser),
              label: Text(
                "Open in web",
                style: TextStyle(fontSize: 16.sp, color: AppTheme.primaryColor),
              ),
              style: ElevatedButton.styleFrom(
                iconColor: AppTheme.primaryColor,
                minimumSize: Size(double.infinity, 48.h),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppTheme.primaryColor,
        onPressed: () {
          SharePlus.instance.share(ShareParams(uri: Uri.parse(article.url)));
        },
        icon: Icon(Icons.share),
        label: Text('Share'),
      ),
    );
  }
}
