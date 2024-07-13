import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/model/widgets.dart';
import '../model/cubit/auth_cubit.dart';
import '../model/shared/cache_helper.dart';
import '../model/shared/enum.dart';
import '../view_model/routes/route_name.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool hide = true;
  togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            hide = !hide;
          });
        },
        icon: hide == true
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }

  GlobalKey<FormState> createForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.login);
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Image.asset(
                      "assets/images/Logo.jpg",
                      height: 20,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: createForm,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headline(text: "Create Account"),
                          const SizedBox(
                            height: 5,
                          ),
                          normalText(
                              text:
                                  "Please create an account to find your dream job"),
                          const SizedBox(
                            height: 30,
                          ),
                          textField(
                              obscureText: false,
                              controller: AppCubit.get(context).name,
                              onChanged: (String name) {
                                AppCubit.get(context).name.text = name;
                              },
                              hintText: "Name",
                              prefix: const Icon(Icons.person_outline),
                              validator: (name) => name!.length < 3
                                  ? "Name should be more than 3 characters"
                                  : null),
                          const SizedBox(
                            height: 25,
                          ),
                          textField(
                              onChanged: (String email) {
                                AppCubit.get(context).email.text = email;
                              },
                              obscureText: false,
                              controller: AppCubit.get(context).email,
                              hintText: "Email",
                              prefix: const Icon(Icons.email_outlined),
                              validator: (email) {
                                if (email!.isEmpty || email.length < 3) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 25,
                          ),
                          textField(
                              onChanged: (String password) {
                                AppCubit.get(context).password.text = password;
                              },
                              obscureText: hide,
                              controller: AppCubit.get(context).password,
                              hintText: "Password",
                              prefix: const Icon(Icons.lock_outline),
                              suffix: togglePassword(),
                              validator: (password) => password!.length <= 8
                                  ? "Password must be at least 8 characters"
                                  : null),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalText(text: "Already have an account?"),
                              textButton(
                                  text: "Login",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.login);
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              AuthCubit authCubit = AuthCubit.get(context);
                              AppCubit appCubit = AppCubit.get(context);

                              return defaultButton(
                                  text: "Create account",
                                  onPressed: () async {
                                    if (createForm.currentState!.validate()) {
                                      await authCubit.register(
                                        name: appCubit.name.text,
                                        email: appCubit.email.text,
                                        password: appCubit.password.text,
                                      );
                                      if (state is RegSuccess) {
                                        CacheHelper.putString(
                                          key: SharedKeys.email,
                                          value: appCubit.email.text,
                                        );
                                        CacheHelper.putString(
                                          key: SharedKeys.password,
                                          value: appCubit.password.text,
                                        );
                                        CacheHelper.putString(
                                          key: SharedKeys.name,
                                          value: appCubit.name.text,
                                        );
                                        Navigator.pushNamed(
                                            context, AppRouter.workType);
                                        appCubit.password.clear();
                                      }
                                    } else if (state is RegFailure) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("error"),
                                        backgroundColor: Colors.red,
                                        showCloseIcon: true,
                                        duration: Duration(seconds: 10),
                                      ));
                                    }
                                  });
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                height: 2,
                                width: 60,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              normalText(text: "Or sign up With Account"),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                height: 2,
                                width: 60,
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GoogleAuthButton(
                                  onPressed: () {},
                                  text: "Google",
                                  style: const AuthButtonStyle(
                                      buttonType: AuthButtonType.icon,
                                      iconType: AuthIconType.secondary,
                                      textStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                FacebookAuthButton(
                                  onPressed: () {},
                                  text: "Facebook",
                                  style: const AuthButtonStyle(
                                    buttonType: AuthButtonType.icon,
                                    iconType: AuthIconType.secondary,
                                  ),
                                ),
                              ]),
                        ]),
                  ),
                ),
              ));
        });
  }
}
