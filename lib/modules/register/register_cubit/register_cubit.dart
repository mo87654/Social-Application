import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/modules/register/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_off : Icons.visibility;
    emit(PasswordVisibilityState());
  }


  userRegister ({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
      createUser(
          name: name,
          email: email,
          phone: phone,
          uid: value.user!.uid,
      );
      emit(RegisterSuccessState());
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }

  createUser({
    required String name,
    required String email,
    required String phone,
    required String uid,
}){
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      image: 'https://firebasestorage.googleapis.com/v0/b/social-application-c00b6.appspot.com/o/users%2Fdefault-user-image.jpg?alt=media&token=a1c752a1-374c-4a8b-ae5a-665cded839e0',
      cover: 'https://firebasestorage.googleapis.com/v0/b/social-application-c00b6.appspot.com/o/users%2Fdefault-user-cover.jpg?alt=media&token=20e528be-1fa2-4533-b811-b8ac110d0ad9',
      bio: 'write your bio',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set(model.toMap())
        .then((value){
          emit(CreateUserSuccessState(uid));
        })
        .catchError((error){
          emit(CreateUserErrorState(error.toString()));
        });
  }

}