import 'package:flutter/material.dart';
import '../common/header.dart';
import 'form.dart';
import '../common/footer.dart';
import 'dart:math' as math;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: math.max(300, constraints.maxWidth),
                minHeight: math.max(400, constraints.maxHeight),
              ),
              child: SizedBox(
                width: math.max(300, constraints.maxWidth),
                height: math.max(400, constraints.maxHeight),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 300,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFF475569)),
                    ),
                    child: Column(
                      children: [
                        const Header(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 32,
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 32),
                                  SignUpForm(),
                                  //SizedBox(height: 32),
                                  //LoginOptions(),
                                  SizedBox(height: 32),
                                  Footer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    /*
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF475569)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Column(
          children: [
            LoginHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: SignUpForm(),
              ),
            ),
            LoginFooter(),
          ],
        ),
      ),
    );
    */
  }
}
