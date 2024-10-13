import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/models/comment_model.dart';
import 'package:social_application/models/post_model.dart';
import 'package:social_application/models/user_model.dart';
import 'package:social_application/modules/add%20post/add_post_screen.dart';
import 'package:social_application/modules/chats/chats_screen.dart';
import 'package:social_application/modules/home/feeds_screen.dart';
import 'package:social_application/modules/setting/setting_screen.dart';
import 'package:social_application/modules/users/users_screen.dart';
import 'package:social_application/shared/components/components.dart';
import 'package:social_application/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit():super(SocialInitialState());

  static SocialCubit get(context)=>BlocProvider.of(context);

  UserModel? userModel;
  getUserData(){
    if(uid != null){
      emit(GetUserDataLoadingState());
      FirebaseFirestore
      .instance
      .collection('Users')
      .doc(uid).get()
      .then((value){
        userModel = UserModel.fromJson(value.data()!);
        emit(GetUserDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetUserDataErrorState(error.toString()));
      });
    }
  }

  int currentIndex = 0;

  List screens =[
    FeedScreen(),
    ChatsScreen(),
    null,
    UsersScreen(),
    SettingScreen()
  ];

  changeButtonNavBar(index, context){
   if(index == 2){
    navigateTo(context, AddPostScreen());
   }else{
     currentIndex = index;
    emit(ChangeNavBarState());
   }

  }

  List titles = [
    'Home',
    'Chats',
    null,
    'Users',
    'Setting',
  ];

  File? profileImage;
  var picker = ImagePicker();
  Future<void> getImage() async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null)
    {
     profileImage = File(pickedFile.path);
     emit(ImagePickedSuccessState());
    } else
      {
        emit(ImagePickedErrorState());
        print( 'No image selected.');
      }
  }
  File? coverImage;
  Future<void> getCover() async
  {
    final pickedFile = await picker.pickImage(
     source: ImageSource.gallery,
    );
    if (pickedFile != null)
    {
      coverImage = File(pickedFile.path);
      emit(CoverPickedSuccessState());
    } else
      {
       emit(CoverPickedErrorState());
       print( 'No image selected.');
      }
  }

  Future uploadProfileImage() async {
    String? profileImageURL;
    await firebase_storage.FirebaseStorage.instance
       .ref()
       .child('users/$uid/profileImage/${Uri.file(profileImage!.path).pathSegments.last}')
       .putFile(profileImage!)
       .then((value) async {
          emit(ImageUploadSuccessState());
			    await value.ref.getDownloadURL().then((value)
          {
            profileImageURL = value;
		      // print(value);
          }).catchError((error) {});
       }).catchError((error) {
        emit(ImageUploadErrorState());
       });  
       return profileImageURL;
  }


  Future uploadcoverImage() async {
    String? coverImageURL;
    await firebase_storage.FirebaseStorage.instance
       .ref()
       .child('users/$uid/coverImage/${Uri.file(coverImage!.path).pathSegments.last}')
       .putFile(coverImage!)
       .then((value) async {
          emit(CoverUploadSuccessState());
			    await value.ref.getDownloadURL().then((value)
          {
            coverImageURL = value;
		      // print(value);
          }).catchError((error) {});
       }).catchError((error) {
        emit(CoverUploadErrorState());
       });  
       return coverImageURL;
  }

  updateUserData({
    required name,
    required bio,
    required phone,
    required image,
    required cover,
    required context,
  }){
    emit(UpdateUserDataLoadingState());
    FirebaseFirestore
        .instance
        .collection('Users')
        .doc(uid).update({
          'name': name,
          'bio': bio,
          'phone': phone,
          'image': image,
          'cover': cover
        }).then((value){
          getUserData();
          Navigator.pop(context);
          emit(UpdateUserDataSuccessState());
        }).catchError((error){
          emit(UpdateUserDataErrorState());
        });
  }

  updateProfile({
    required name,
    required bio,
    required phone,
    required context,
  }){
    emit(UpdateProfileLoadingState());
    if(profileImage != null && coverImage == null){
      uploadProfileImage().then((profile){
        updateUserData(
          name: name,
          bio: bio,
          phone: phone,
          image: profile,
          cover: userModel!.cover,
          context: context,
        );
        updateProfileImageInAllTheApp(profile);
        emit(UpdateProfileSuccessState());
      }).catchError((error){
        emit(UpdateProfileErrorState());
      });
    }
    if(profileImage == null && coverImage != null){
      uploadcoverImage().then((cover){
        updateUserData(
          name: name,
          bio: bio,
          phone: phone,
          image:userModel!.image ,
          cover: cover,
          context: context,
        );
        emit(UpdateProfileSuccessState());
      }).catchError((error){
        emit(UpdateProfileErrorState());
      });
    }
    if(profileImage != null && coverImage != null){
      uploadProfileImage().then((profile){
        uploadcoverImage().then((cover){
         updateUserData(
           name: name,
           bio: bio,
           phone: phone,
           image: profile,
           cover: cover,
           context: context,
         );
         emit(UpdateProfileSuccessState());
       }).catchError((error){
         emit(UpdateProfileErrorState());
       });
       updateProfileImageInAllTheApp(profile);
      }).catchError((error){
        emit(UpdateProfileErrorState());
      });
    }
    if(profileImage == null && coverImage == null){
      updateUserData(
        name: name,
        bio: bio,
        phone: phone,
        image: userModel!.image,
        cover: userModel!.cover,
        context: context,
      );
      emit(UpdateProfileSuccessState());
    }
  }

  updateProfileImageInAllTheApp(String profile) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    CollectionReference collRef = FirebaseFirestore.instance.collection('Posts');
    collRef.where('uid',isEqualTo: uid).get().then((value){
      value.docs.forEach((element){
        batch.update(element.reference, {'image':profile});
      });
    }).catchError((error){});
    collRef.get().then((value){
      value.docs.forEach((element){
        element.reference.collection('Comments').where('uid',isEqualTo: uid).get().then((value){
          value.docs.forEach((element){
            batch.update(element.reference, {'image':profile});
          });
        });
      });
    });
    await batch.commit();
    getPosts();
  }

  File? postImage;
  Future<void> getPostImage() async
  {
     final pickedFile = await picker.pickImage(
       source: ImageSource.gallery,
     );
     if (pickedFile != null)
     {
       postImage = File(pickedFile.path);
       emit(PostImagePickedSuccessState());
     } else
       {
        emit(PostImagePickedErrorState());
       print( 'No image selected.');
       }
  }

  uploadPostImage({
    required Timestamp dateTime,
    required String text,
  }) async {
    emit(UploadPostLoadingState());
  // String? profileImageURL;
    await firebase_storage.FirebaseStorage.instance
        .ref()
       .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
       .putFile(postImage!)
       .then((value) async {
          emit(PostImageUploadSuccessState());
			    await value.ref.getDownloadURL().then((postImageURL)
          {
            uploadPost(
              image: userModel!.image!,
              name: userModel!.name!,
              dateTime: dateTime,
              text: text,
              postImage: postImageURL,
              uid: userModel!.uid!,
            );
            postImage = null;
            // profileImageURL = value;
		      // print(value);
          }).catchError((error) {
            emit(PostImageUploadErrorState());
          });
       }).catchError((error) {
         emit(PostImageUploadErrorState());
       });  
      //  return profileImageURL;
  }
  uploadPost({
    required String image,
    required String name,
    required Timestamp dateTime,
    required String text,
    required String postImage,
    required String uid,
  }) async {
    PostModel postModel = PostModel(
      image: image,
      name: name,
      dateTime: dateTime,
      text: text,
      postImage: postImage,
      uid: uid,
    );
    emit(UploadPostLoadingState());
    DocumentReference postDocRef = await FirebaseFirestore
       .instance
       .collection('Posts')
       .add(postModel.toMap());
    emit(UploadPostSuccessState());
    getPosts();
    await postDocRef.collection('Likes').doc('0').set({}).then((value){}).catchError((error){
      emit(UploadPostErrorState());
    }).catchError((error){
     emit(UploadPostErrorState());
    });


  }

  removePostImage(){
    postImage = null;
    emit(RemovePostImageState());
  }

  List<PostModel> posts = [];
  List postID = [];
  List<int> postsLikesCount = [];
  List<int> postsCommentsCount = [];
  List<bool> myLikesOnPosts = [];

  getPosts(){
    if(uid != null){
      posts.clear();
      postID.clear();
      postsLikesCount.clear();
      postsCommentsCount.clear();
      myLikesOnPosts.clear();
      emit(GetPostsLoadingState());
      FirebaseFirestore.instance
          .collection('Posts')
          .get().then((value){
            value.docs.forEach((element){
              List<String> likesDocId = [];
              element.reference.collection('Likes').get().then((value){
                value.docs.forEach((likesDoc){
                  likesDocId.add(likesDoc.id);
                });
                if(likesDocId.contains(userModel?.uid)){
                  myLikesOnPosts.add(true);
                }else{
                  myLikesOnPosts.add(false);
                }
                postsLikesCount.add(value.size-1);
                element.reference.collection('Comments').get().then((value){
                  postsCommentsCount.add(value.size);
                  posts.add(PostModel.fromJson(element.data()));
                  postID.add(element.id);
                  emit(GetPostsSuccessState());
                }).catchError((error){emit(GetPostsErrorState(error));});
              }).catchError((error){emit(GetPostsErrorState(error));});
            });
          }).catchError((error){
            emit(GetPostsErrorState(error));
          });
    }
  }

  likeOrUnlikePost(int index){
    DocumentReference postLikesRef = FirebaseFirestore.instance
        .collection('Posts')
        .doc(postID[index])
        .collection('Likes')
        .doc(userModel?.uid);
    if(myLikesOnPosts[index]){
      myLikesOnPosts[index] = false;
      postsLikesCount[index] = postsLikesCount[index]-1;
      emit(LocalUnlikePostSuccessState());
      postLikesRef.delete().then((value){
        emit(UnlikePostSuccessState());
      }).catchError((error){
        emit(UnlikePostErrorState());
      });
    }else{
      myLikesOnPosts[index] = true;
      postsLikesCount[index] = postsLikesCount[index]+1;
      emit(LocalLikePostSuccessState());
      postLikesRef.set(<String,dynamic>{}).then((value){
        emit(LikePostSuccessState());
      }).catchError((error){
        emit(LikePostErrorState());
      });
    }
  }

  addComment({
    required int index,
    required Timestamp dateTime,
    required String text,
    }){
      emit(AddCommentLoadingState());
      CommentModel commentModel = CommentModel(
        name: userModel?.name, 
        image: userModel?.image, 
        dateTime: dateTime, 
        text: text,
        uid: uid,
      );
      FirebaseFirestore.instance
        .collection('Posts')
        .doc(postID[index])
        .collection('Comments')
        .add(commentModel.toMap()).then((value){
          emit(AddCommentSuccessState());
          postsCommentsCount[index] = postsCommentsCount[index]+1;
          getComments(index);
        }).catchError((error){emit(AddCommentErrorState());});
      }

  List<CommentModel> comments = [];
  getComments(index){
    comments.clear();
    emit(GetCommentLoadingState());
    FirebaseFirestore.instance
    .collection('Posts')
    .doc(postID[index])
    .collection('Comments')
    .get().then((value){
      for (var element in value.docs) {
        comments.add(CommentModel.fromJson(element.data()));
      }
      emit(GetCommentSuccessState());
    }).catchError((error){
      emit(GetCommentErrorState());
    });
  }


}