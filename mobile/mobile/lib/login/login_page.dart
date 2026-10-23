import 'package:flutter/material.dart';
import '../common/header.dart';
import 'form.dart';
import 'options.dart';
import '../common/footer.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                                  LoginForm(),
                                  SizedBox(height: 32),
                                  LoginOptions(),
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
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300,
              minHeight: 400,
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF475569)),
                ),
                child: Column(
                  children: [
                    const LoginHeader(),
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
                              LoginForm(),
                              SizedBox(height: 32),
                              LoginOptions(),
                              SizedBox(height: 32),
                              LoginFooter(),
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
      ),
    );
    */
    /*
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            //maxWidth: 480,
            minHeight: 400,
            //maxHeight: 800,
          ),

          //constraints: const BoxConstraints(maxWidth: 480),
          //constraints: const BoxConstraints(minWidth: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF475569)),
          ),
          child: Column(
            children: [
              const LoginHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    //color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16, //16
                      vertical: 32, //40
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 32), //48
                        LoginForm(),
                        SizedBox(height: 32), //48
                        LoginOptions(),
                        SizedBox(height: 32), //64
                        LoginFooter(),
                        //SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    */
  }
}
