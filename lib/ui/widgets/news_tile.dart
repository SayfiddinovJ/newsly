import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/data/models/news/everything/articles_model.dart';
import 'package:newsly/ui/route/app_route.dart';
import 'package:newsly/utils/extensions/extensions.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article, required this.onTap});

  final ArticlesModel article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CachedNetworkImage(
          imageUrl: article.urlToImage,
          height: 50.w,
          width: 60.w,
          fit: BoxFit.fill,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      title: Text(article.title, maxLines: 1),
      subtitle: Text(
        article.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Text(formatDateTime(article.publishedAt), maxLines: 2),
      onTap: () {
        Navigator.pushNamed(context, RouteNames.newsDetail, arguments: article);
      },
    );
  }
}
