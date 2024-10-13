import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/shared/components/components.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class AddPostScreen extends StatelessWidget {

  var postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is UploadPostSuccessState){
          toastMessage(
              message: 'Your Post Published Successfully',
              color: Colors.blue,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Create Post'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconBroken.Arrow___Left_2),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if(SocialCubit.get(context).postImage == null){
                      SocialCubit.get(context).uploadPost(
                        image: SocialCubit.get(context).userModel!.image!,
                        name: SocialCubit.get(context).userModel!.name!,
                        dateTime: Timestamp.now(),
                        text: postController.text,
                        postImage: '',
                        uid: SocialCubit.get(context).userModel!.uid!,
                      );
                    }else{
                      SocialCubit.get(context).uploadPostImage(
                        dateTime: Timestamp.now(),
                        text: postController.text,
                      );
                    }
                  },
                  child: Text(
                    'POST',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ),
                const SizedBox(width: 5,)
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if(state is UploadPostLoadingState)
                    const LinearProgressIndicator(),
                  if(state is UploadPostLoadingState)
                    const SizedBox(height: 6,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(SocialCubit.get(context).userModel!.image!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        SocialCubit.get(context).userModel!.name!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  TextFormField(
                    controller: postController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      hintText: 'What is in your mind ?',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  // Spacer(),
                  if(SocialCubit.get(context).postImage != null)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: FileImage(SocialCubit.get(context).postImage!),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            SocialCubit.get(context).removePostImage();
                          },
                          icon: const Icon(
                            IconBroken.Close_Square,
                          )
                          )
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          }, 
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: (){}, 
                          child: const Text(
                                '# tags',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
