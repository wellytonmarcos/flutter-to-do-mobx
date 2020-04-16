import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  
  _LoginStore()
  {
    autorun(_)
    {
      print(isFormValid);
    };
  }
  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  bool passwordVisible = false;

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;
  @action
  void togglePasswordVisible(String value) => passwordVisible = !passwordVisible;

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isFormValid => isPasswordValid && isEmailValid;

  @computed
  bool get isVisiblePassword => passwordVisible;
}