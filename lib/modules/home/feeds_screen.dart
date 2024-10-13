import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/shared/components/components.dart';
import 'package:social_application/shared/styles/icon_broken.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is AddCommentSuccessState){
          Navigator.pop(context);
          toastMessage(
            message: 'Comment Added', 
            color: Colors.green,
            );
        }
      },
      builder: (context, state) {
        return SocialCubit.get(context).posts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => postBuilder(
                    context, SocialCubit.get(context), index, state),
                itemCount: SocialCubit.get(context).posts.length,
              );
      },
    );
  }

  Widget postBuilder(BuildContext context, SocialCubit model, int index,
          SocialStates state) =>
      Card(
        color: Colors.grey[300],
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        NetworkImage('${model.posts[index].image}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.posts[index].name}',
                          style: const TextStyle(fontSize: 17, height: 1.4),
                        ),
                        Text(
                          timeago.format(model.posts[index].dateTime!.toDate()),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(height: 1.4, color: Colors.grey[500]),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // model.getComments(index);
                      },
                      icon: const Icon(
                        IconBroken.More_Circle,
                      ))
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              Text(
                '${model.posts[index].text}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(height: 1.3, letterSpacing: .01),
              ),
              const SizedBox(
                height: 10,
              ),
              /*Container(
            width: double.infinity,
            child: Wrap(
              children: [
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#gaza',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#free_gaza',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#palestine',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#free_palestine',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#support_for_gaza',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#stop_war_in_gaza',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: MaterialButton(
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      '#support_for_palestine',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: defaultColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
              const SizedBox(
                height: 10,
              ),
              if (model.posts[index].postImage != '')
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage('${model.posts[index].postImage}'),
                        fit: BoxFit.cover,
                      )),
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          const Icon(
                            IconBroken.Heart,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${model.postsLikesCount[index]}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                      onTap: () {
                        print('like');
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            IconBroken.Chat,
                            color: Colors.blue,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${model.postsCommentsCount[index]} comment',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (context) => bottomSheetBuilder(
                              context: context,
                              autoFocus: false,
                              index: index,
                              model: model,
                              state: state),
                          isScrollControlled: true,
                        );
                        model.getComments(index);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 17,
                        backgroundImage:
                            NetworkImage('${model.userModel?.image}'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          model.getComments(index);
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            builder: (context) => bottomSheetBuilder(
                                context: context,
                                autoFocus: true,
                                index: index,
                                model: model,
                                state: state),
                            isScrollControlled: true,
                          );
                        },
                        child: Text(
                          'write a comment ...',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        color: model.myLikesOnPosts[index]
                            ? Colors.red
                            : Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: TextStyle(
                          color: model.myLikesOnPosts[index]
                              ? Colors.red
                              : Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    model.likeOrUnlikePost(index);
                  },
                ),
                const SizedBox(
                  width: 10,
                )
              ]),
            ],
          ),
        ),
      );

  Widget bottomSheetBuilder({
    required context,
    required autoFocus,
    required int index,
    required SocialCubit model,
    required SocialStates state,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) =>
                Stack(
                  children: [
                    if (state is GetCommentLoadingState)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      model.comments.isEmpty
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.comments_disabled,
                                    size: 70,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'No Comments',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                top: 30,
                                right: 10,
                                left: 10,
                              ),
                              controller: scrollController,
                              // padding: const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: MediaQuery.of(context).viewInsets,),
                              // decoration: const BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              // ),
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                              '${model.comments[index].image}'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${model.comments[index].name}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      '${model.comments[index].text}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                )),
                                            Text(
                                              timeago.format(model
                                                  .comments[index].dateTime!
                                                  .toDate()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 25,
                                    ),
                                    itemCount: model.comments.length,
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: commentController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          autofocus: autoFocus,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'comment required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).addComment(
                                      index: index,
                                      dateTime: Timestamp.now(),
                                      text: commentController.text
                                  );
                                },
                                icon: state is AddCommentLoadingState
                                  ?const CircularProgressIndicator() 
                                  :const Icon(IconBroken.Send)),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
      );
}
