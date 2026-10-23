import 'package:flutter/material.dart';
import '../common/header.dart';
import 'form.dart';
import '../common/footer.dart';
import 'dart:math' as math;

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
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
                                  NewPassForm(),
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
  }
}
