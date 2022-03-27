import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zingoapp/common/widgets/stateless/item_online.dart';
import 'package:zingoapp/common/widgets/stateless/page_shadow.dart';
import 'package:zingoapp/modules/post/models/user.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class StoryItem extends StatefulWidget {
  final User user;
  final String? name;
  final String? imageStory;
  const StoryItem({Key? key, this.name, this.imageStory, required this.user})
      : super(key: key);

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: size.width / 2.5,
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: (widget.user.profile?.coverImages == null ||
                      widget.user.profile!.coverImages!.isEmpty)
                  ? CachedNetworkImage(
                      height: size.height / 4.55,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://i.jeuxactus.com/datas/jeux/j/u/jump-force/xl/jump-force-5dbbdab8280bb.jpg',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : CachedNetworkImage(
                      height: size.height / 4.55,
                      fit: BoxFit.cover,
                      imageUrl:
                          widget.user.profile!.coverImages![0].url.toString(),
                      // widget.user.avatar!.url.toString(),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
            const PageShadow(),
            Positioned(
                left: size.width / 2.5 * 0.05,
                top: size.width / 2.95,
                child: Row(
                  children: [
                    ItemOnline(avatarUrl: widget.user.avatar!.url),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.user.firstName.toString() +
                          " " +
                          widget.user.lastName.toString(),
                      style: AppStyles.h6.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
    //     ,
    //     Positioned(
    //         left: size.width / 2.5 * 0.05,
    //         top: size.width / 3,
    //         child: Row(
    //           children: [
    //             const ItemOnline(
    //               avatarUrl:
    //                   'https://ae01.alicdn.com/kf/HTB1USU9KVXXXXXFaXXXq6xXFXXXc/Bleach-10th-Division-Captain-Toshiro-Hitsugaya-Cosplay-Trang-Ph-c-Mi-n-Ph-V-n-Chuy.jpg_Q90.jpg_.webp',
    //             ),
    //             const SizedBox(
    //               width: 5,
    //             ),
    //             Text(
    //               widget.name!.toString(),
    //               style: AppStyles.h6.copyWith(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.amber,
    //                   fontSize: 16),
    //               overflow: TextOverflow.clip,
    //               maxLines: 1,
    //             )
    //           ],
    //         )
    // );
  }
}
