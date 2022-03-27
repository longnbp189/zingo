import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zingoapp/common/widgets/stateless/avatar.dart';
import 'package:zingoapp/modules/post/models/post.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class PostItem extends StatefulWidget {
  final Post post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // return Container(
    //   decoration: const BoxDecoration(boxShadow: [
    //     BoxShadow(
    //       color: Colors.black,
    //       blurRadius: 20.0,
    //       offset: Offset(
    //         5.0, // Move to right 10  horizontally
    //         5.0, // Move to bottom 10 Vertically
    //       ),
    //     )
    //   ]),
    //   child: Card(
    //     color: AppColor.background,
    //     shadowColor: Colors.orange,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     elevation: 10,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         ListTile(
    //           leading: Avatar(
    //             avatarUrl: widget.post.user!.avatar!.url,
    //             // avatarUrl: FirebaseAuth.instance.currentUser!.photoURL,
    //           ),
    //           title: Text(
    //             widget.post.user!.firstName! +
    //                 ' ' +
    //                 widget.post.user!.lastName!,
    //             style: AppStyles.h2,
    //           ),
    //           subtitle: Text(
    //             parseDate(widget.post.createdAt!.toString()),
    //             style: AppStyles.h4.copyWith(color: AppColor.textGray),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(158, 27, 32, 41),
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Card(
        color: AppColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Avatar(
                      avatarUrl: widget.post.user!.avatar!.url,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.user!.firstName! +
                            ' ' +
                            widget.post.user!.lastName!,
                        style: AppStyles.h2,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        parseDate(widget.post.createdAt!.toString()),
                        style: AppStyles.h4.copyWith(color: AppColor.textGray),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Text(
                widget.post.description.toString(),
                style: AppStyles.h3,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: size.height / 4.55,
                  width: size.width,
                  fit: BoxFit.cover,
                  imageUrl: widget.post.images![0].url.toString(),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Text(
              //     widget.post.description.toString(),
              //     style: AppStyles.h3,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
