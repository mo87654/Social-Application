import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/modules/register/register_cubit/register_cubit.dart';
import 'package:social_application/modules/register/register_cubit/register_states.dart';
import '../../layout/social_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){
          if(state is CreateUserSuccessState)
          {
            uid = state.uid;
            navigateToAndReplace(context, LayoutScreen());
            CacheHelper.savaData(key: 'uid', value: state.uid);
            SocialCubit.get(context).getUserData();
            SocialCubit.get(context).getPosts();
          }else if(state is RegisterErrorState)
          {
            toastMessage(
                message: state.error,
                color: Colors.red
            );
          }else if(state is CreateUserErrorState)
          {
            toastMessage(
                message: state.error,
                color: Colors.red
            );
          }
        },
        builder: (context, state){
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Register and meet new friends',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultTextField(
                            label: 'Name',
                            controller: nameController,
                            prefix: Icons.person_outline,
                            inputType: TextInputType.name,
                            inputAction: TextInputAction.next,
                            validFunction: (value){
                              if(value.isEmpty)
                              {
                                return 'Enter your Name';
                              }
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            label: 'Email',
                            controller: emailController,
                            prefix: Icons.email_outlined,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            validFunction: (value){
                              if(value.isEmpty)
                              {
                                return 'Enter your Email';
                              }
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: passwordController,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            inputType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.next,
                            isPassword: RegisterCubit.get(context).isPassword,
                            suffix: RegisterCubit.get(context).suffix,
                            suffixFunction: (){
                              RegisterCubit.get(context).changePasswordVisibility();
                            },
                            validFunction: (value){
                              if(value.isEmpty)
                              {
                                return 'Enter your Password';
                              }
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            label: 'Phone',
                            controller: phoneController,
                            prefix: Icons.phone_android_outlined,
                            inputType: TextInputType.phone,
                            inputAction: TextInputAction.done,
                            validFunction: (value){
                              if(value.isEmpty)
                              {
                                return 'Enter your phone number';
                              }
                            }
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        state is! RegisterLoadingState?
                        defaultButton(
                          text: 'REGISTER',
                          height: 58,
                          width: double.infinity,
                          pressFunction: (){
                            if(formkey.currentState!.validate())
                            {
                              RegisterCubit.get(context).userRegister(
                                  name   : nameController.text,
                                  email   : emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                              );
                            }
                          },

                        ):Center(
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: (){
                                  navigateTo(context, LoginScreen());
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        )
                      ],
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}