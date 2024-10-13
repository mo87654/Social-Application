import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/social_layout.dart';
import 'package:social_application/shared/components/constants.dart';
import 'package:social_application/shared/network/local/cashe_helper.dart';
import '../../shared/components/components.dart';
import '../register/register_screen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state){
          if(state is LoginSuccessState)
          {
            navigateToAndReplace(context, LayoutScreen());
            CacheHelper.savaData(key: 'uid', value: state.uid);
            uid = state.uid;
            SocialCubit.get(context).getUserData();
            SocialCubit.get(context).getPosts();
          }else if(state is LoginErrorState)
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
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login and meet new friends',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
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
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: passwordController,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            inputType: TextInputType.visiblePassword,
                            submitFunction: (value){
                              if(formkey.currentState!.validate())
                              {
                                LoginCubit.get(context).userLogin(
                                    email   : emailController.text,
                                    password: passwordController.text
                                );
                              }
                            },
                            isPassword: LoginCubit.get(context).isPassword,
                            suffix: LoginCubit.get(context).suffix,
                            suffixFunction: (){
                              LoginCubit.get(context).changePasswordVisibility();
                            },
                            validFunction: (value){
                              if(value.isEmpty)
                              {
                                return 'Enter your Password';
                              }
                            }
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        (state is! LoginLoadingState)?
                        defaultButton(
                          text: 'LOGIN',
                          height: 58,
                          width: double.infinity,
                          pressFunction: (){
                            if(formkey.currentState!.validate())
                            {
                              LoginCubit.get(context).userLogin(
                                  email   : emailController.text,
                                  password: passwordController.text
                              );
                            }
                          },

                        ):const Center(
                          child: CircularProgressIndicator(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: (){
                                  navigateTo(context, RegisterScreen());
                                },
                                child: const Text(
                                  'Register',
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
