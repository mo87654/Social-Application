import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/shared/components/components.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class EditeProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialCubit.get(context);
        nameController.text = model.userModel!.name!;
        bioController.text = model.userModel!.bio!;
        phoneController.text = model.userModel!.phone!;
        return Scaffold(
            appBar: AppBar(
              title: Text('Edite Profile'),
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                IconBroken.Arrow___Left_2
              ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    model.updateProfile(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                      context: context,
                    );
                    // await Future.delayed(Duration(seconds: 2));
                  },
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ),
                const SizedBox(width: 5,)
              ],
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.all(8),
              child: Column(
                children: [
                  if(state is UpdateProfileLoadingState)
                    const LinearProgressIndicator(),
                  if(state is UpdateProfileLoadingState)
                    const SizedBox(height: 5,),
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: model.coverImage==null? NetworkImage('${model.userModel!.cover}') :FileImage(model.coverImage!,) as ImageProvider<Object>,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: (){
                                  model.getCover();
                                },
                                icon: Icon(
                                  IconBroken.Camera,
                                )
                                ),
                            )
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 63,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                 radius: 60,
                                 backgroundImage: model.profileImage == null? NetworkImage('${model.userModel!.image}') :FileImage(model.profileImage!,) as ImageProvider<Object>,
                                ),
                              ),
                              CircleAvatar(
                              child: IconButton(
                                onPressed: (){
                                  model.getImage();
                                },
                                icon: Icon(
                                  IconBroken.Camera,
                                )
                              ),
                             )
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultTextField(
                    controller: nameController,
                    label: 'Name',
                    inputType: TextInputType.name,
                    prefix: IconBroken.User,
                    inputAction: TextInputAction.next,
                    validFunction: (value){
                      if(value.isEmpty){
                        return 'Enter your name';
                      }
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextField(
                    controller: bioController,
                    label: 'bio',
                    inputType: TextInputType.text,
                    prefix: IconBroken.Info_Circle,
                    inputAction: TextInputAction.next,
                    validFunction: (value){
                      if(value.isEmpty){
                        return 'Enter your bio';
                      }
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextField(
                    controller: phoneController,
                    label: 'phone',
                    inputType: TextInputType.phone,
                    prefix: IconBroken.Call,
                    inputAction: TextInputAction.next,
                    validFunction: (value){
                      if(value.isEmpty){
                        return 'Enter your phone';
                      }
                    }
                  )
                ],
              ),
            ));
      },
    );
  }
}
