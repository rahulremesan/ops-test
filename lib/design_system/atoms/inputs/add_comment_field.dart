import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class AddCommentField extends StatelessWidget {
  final TextEditingController? commentController;
  final VoidCallback? onSend;
  const AddCommentField({
    super.key,
    this.commentController,
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dreamyCloud,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,0,8,0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profileImage.jpeg'),
              radius: 13,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: TextFormField(
                controller: commentController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(
                      color: AppColors.neutral_300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    )),
                    onFieldSubmitted: (value){
                      if(onSend != null){
                        onSend!();
                      }
                    },
              ),
            ),
            IconButton(
                onPressed: onSend,
                icon: const Icon(
                  Icons.send,
                  color: AppColors.neutral_300,
                  size: 16,
                ))
          ],
        ),
      ),
    );
  }
}
