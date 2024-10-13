
abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class PasswordVisibilityState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends RegisterStates{
  final String uid;
  CreateUserSuccessState(this.uid);
}

class CreateUserErrorState extends RegisterStates{
  final String error;
  CreateUserErrorState(this.error);
}