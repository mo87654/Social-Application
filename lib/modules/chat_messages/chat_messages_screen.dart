import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/models/message_model.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/shared/components/colors.dart';
import 'package:social_application/shared/components/constants.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class ChatMessagesScreen extends StatelessWidget {

  final UserModel model;
  ChatMessagesScreen(this.model,{super.key});

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getMessages(model.uid!);
        return BlocConsumer<SocialCubit,SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SocialCubit sociaModel = SocialCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(
                    IconBroken.Arrow___Left_2
                  )
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: defaultColor,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage('${model.image}'),
                      ),
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
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          if(sociaModel.messages[index].senderUid == uid) {
                            return buildMyMessage(context: context, model: sociaModel.messages[index]);
                          }else{
                            return buildMessage(context: context, model: sociaModel.messages[index]);
                          }
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10,),
                        itemCount: sociaModel.messages.length,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 160,
                                minHeight: 58,
                              ),
                              child: TextFormField(
                                controller: messageController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                textInputAction: TextInputAction.newline,
                                decoration: const InputDecoration(
                                  hintText: 'Type Your Message',
                                  hintStyle: TextStyle(
                                    color: Colors.grey
                                  ),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  if(value.trim().isEmpty){
                                    sociaModel.changeChatButton(value);
                                  }else if(value.trim().length ==1){
                                    sociaModel.changeChatButton(value);
                                  }
                                },
                              ),
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        Container(
                          decoration: const BoxDecoration(
                            color: defaultColor,
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(8.0)),
                          ),
                          child: MaterialButton(
                            height: 60,
                            minWidth: 1.0,
                            onPressed: (){
                              if(sociaModel.sendIcon){
                                sociaModel.sendMessage(
                                  receiverUid: model.uid!, 
                                  senderUid: uid!, 
                                  text: messageController.text.trim(), 
                                  imageUrl: ''
                                );
                                messageController.clear();
                                sociaModel.sendIcon = false;
                              }else{
                                sociaModel.getmessageImage(context, model);
                              } 
                            },
                            child: Icon(
                              sociaModel.sendIcon? IconBroken.Send : IconBroken.Image,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,)
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }

  Widget buildMyMessage({
    required BuildContext context,
    required MessageModel model,
  })=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      margin: const EdgeInsetsDirectional.only(start: 50),
      padding: const EdgeInsetsDirectional.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(15),
          topEnd: Radius.circular(15),
          bottomStart: Radius.circular(15),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(model.imageUrl!.isNotEmpty)
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${model.imageUrl}',),
                  fit: BoxFit.cover
                  )
              ),
            ),
          if(model.text!.isNotEmpty)
            Text(
              '${model.text}',
            ),
          const SizedBox(height: 5,),
          Text(
            SocialCubit.get(context).formatTime(model.dateTime!.toDate()),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ),
  );
  
  Widget buildMessage({
    required BuildContext context,
    required MessageModel model,
  })=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      margin: const EdgeInsetsDirectional.only(end: 50),
      padding: const EdgeInsetsDirectional.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(15),
          topEnd: Radius.circular(15),
          bottomEnd: Radius.circular(15),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if(model.imageUrl!.isNotEmpty)
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${model.imageUrl}',),
                  fit: BoxFit.cover
                  )
              ),
            ),
          if(model.text!.isNotEmpty)
            Text(
              '${model.text}'
            ),
          const SizedBox(height: 5,),
          Text(
            SocialCubit.get(context).formatTime(model.dateTime!.toDate()),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ),
  );
}