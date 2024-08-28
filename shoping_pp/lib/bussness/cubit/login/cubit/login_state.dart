part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.showPassword = true,
    required this.formKey,
    this.loadingType = LoadingType.initi,
    required this.userController,
    required this.passwordController,
    this.masegeState = "",
  });
  final bool showPassword;

  final GlobalKey<FormState> formKey;
  final LoadingType loadingType;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final String masegeState;
  @override
  List<Object> get props => [
        formKey,
        userController,
        passwordController,
        loadingType,
        showPassword,
        masegeState,
      ];
  LoginState copyWith({
    String? masegeState,
    bool? showPassword,
    GlobalKey<FormState>? formKey,
    LoadingType? loadingType,
    TextEditingController? userController,
    TextEditingController? passwordController,
  }) =>
      LoginState(
        masegeState: masegeState ?? this.masegeState,
        showPassword: showPassword ?? this.showPassword,
        loadingType: loadingType ?? this.loadingType,
        formKey: formKey ?? this.formKey,
        userController: userController ?? this.userController,
        passwordController: passwordController ?? this.passwordController,
      );
}
