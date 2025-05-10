import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:shimmer/shimmer.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article, required this.isBookmark});

  final ArticlesModel article;
  final bool isBookmark;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 4,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage,
            height: 75.w,
            width: 80.w,
            fit: BoxFit.fill,
            placeholder:
                (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey,
                  child: Container(
                    height: 75.w,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text(
          article.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            isBookmark ? RouteNames.bookmarkDetail : RouteNames.newsDetail,
            arguments: article,
          );
        },
      ),
    );
  }
}
