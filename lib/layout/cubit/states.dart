abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class GetUserDataLoadingState extends SocialStates {}
class GetUserDataSuccessState extends SocialStates {}
class GetUserDataErrorState extends SocialStates {
  final String error;
  GetUserDataErrorState(this.error);
}

class UpdateUserDataLoadingState extends SocialStates {}
class UpdateUserDataSuccessState extends SocialStates {}
class UpdateUserDataErrorState extends SocialStates {}

class ChangeNavBarState extends SocialStates {}

class ImagePickedSuccessState extends SocialStates {}
class ImagePickedErrorState extends SocialStates {}

class ImageUploadSuccessState extends SocialStates {}
class ImageUploadErrorState extends SocialStates {}

class CoverPickedSuccessState extends SocialStates {}
class CoverPickedErrorState extends SocialStates {}

class CoverUploadSuccessState extends SocialStates {}
class CoverUploadErrorState extends SocialStates {}

class UpdateProfileLoadingState extends SocialStates {}
class UpdateProfileSuccessState extends SocialStates {}
class UpdateProfileErrorState extends SocialStates {}

class PostImagePickedSuccessState extends SocialStates {}
class PostImagePickedErrorState extends SocialStates {}

//upload post image
class PostImageUploadSuccessState extends SocialStates {}
class PostImageUploadErrorState extends SocialStates {}

//remove post image
class RemovePostImageState extends SocialStates {}

//upload post
class UploadPostLoadingState extends SocialStates {}
class UploadPostSuccessState extends SocialStates {}
class UploadPostErrorState extends SocialStates {}

//get posts
class GetPostsLoadingState extends SocialStates {}
class GetPostsSuccessState extends SocialStates {}
class GetPostsErrorState extends SocialStates {
  final String error;
  GetPostsErrorState(this.error);
}

//like post
class LikePostSuccessState extends SocialStates {}
class LikePostErrorState extends SocialStates {}
class LocalLikePostSuccessState extends SocialStates {}

//unlike post
class UnlikePostSuccessState extends SocialStates {}
class UnlikePostErrorState extends SocialStates {}
class LocalUnlikePostSuccessState extends SocialStates {}

//add comment
class AddCommentLoadingState extends SocialStates {}
class AddCommentSuccessState extends SocialStates {}
class AddCommentErrorState extends SocialStates {}

//get comment
class GetCommentLoadingState extends SocialStates {}
class GetCommentSuccessState extends SocialStates {}
class GetCommentErrorState extends SocialStates {}