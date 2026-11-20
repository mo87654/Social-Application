import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/modules/chat_messages/chat_messages_screen.dart';
import 'package:social_application/shared/components/components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => buildChatItem(context: context, index: index, model: SocialCubit.get(context).users[index]),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
          ),
          itemCount: SocialCubit.get(context).users.length,
        );
      },
    );
  }

  buildChatItem({
    required BuildContext context,
    required int index,
    required UserModel model
    }) => InkWell(
      onTap: () {
        navigateTo(context, ChatMessagesScreen(model));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('${model.image}'),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                '${model.name}',
                style: const TextStyle(fontSize: 17, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
}
