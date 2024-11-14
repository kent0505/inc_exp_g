import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/newss.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.newss,
  });

  final Newss newss;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: CuperButton(
        onPressed: () {
          context.push('/home/detailnews', extra: newss);
        },
        child: Row(
          children: [
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: newss.url,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    newss.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 16,
                      fontFamily: Fonts.ns700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    newss.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 10,
                      fontFamily: Fonts.ns400,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        'Finance',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 10,
                          fontFamily: Fonts.ns700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        dateToString(newss.date),
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 10,
                          fontFamily: Fonts.ns700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
