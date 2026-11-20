import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/shared/components/colors.dart';
import 'package:social_application/shared/components/constants.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class ImageViewScreen extends StatelessWidget {
  UserModel userModel;
  ImageViewScreen(this.userModel, {super.key});

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SocialCubit model = SocialCubit.get(context);
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 18, 17, 33),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Colors.black.withOpacity(0),
            leading: const Text(''),
            actions: [
              IconButton(
                  padding: const EdgeInsets.only(top: 20),
                  onPressed: () {
                    Navigator.pop(context);
                    model.messageImage = null;
                  },
                  icon: const Icon(
                    IconBroken.Close_Square,
                    color: Colors.white,
                    size: 30,
                  )
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(
                  bottom: 200,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(model.messageImage!),
                        fit: BoxFit.contain)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 160,
                          minHeight: 58,
                        ),
                        child: TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Add Description',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: defaultColor,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(30.0)),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            model.uploadmessageImage(userModel.uid!).then((value){
                              model.sendMessage(
                                receiverUid: userModel.uid!, 
                                senderUid: uid!, 
                                text: descriptionController.text.trim(), 
                                imageUrl: value!
                              );
                            });
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            IconBroken.Send,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
