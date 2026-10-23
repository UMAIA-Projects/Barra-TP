import 'package:flutter/material.dart';
import 'password_input.dart';
//import 'language_selector.dart';

class NewPassForm extends StatefulWidget {
  const NewPassForm({super.key});

  @override
  State<NewPassForm> createState() => _NewPassFormState();
}

class _NewPassFormState extends State<NewPassForm> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      //print('Form submitted');
      Navigator.pushNamed(context, '/login');
    }
  }

  void _handleTermsClick() {
    // Handle terms and conditions click
    print('Terms and conditions clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        /*
        constraints: const BoxConstraints(
          maxWidth: 437,
          minHeight: 845,
        ),
        */
        /*
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        */
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //const SizedBox(height: 76),
                  const Text(
                    'New Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF475569),
                      shadows: [
                        Shadow(
                          offset: Offset(0, 4), // deslocamento da sombra
                          blurRadius: 4, // suavidade da sombra
                          color: Colors.black26, // cor da sombra
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  PasswordInput(
                    placeholder: 'Nova Password',
                    controller: _newPasswordController,
                  ),
                  const SizedBox(height: 36),
                  PasswordInput(
                    placeholder: 'Confirmar Password',
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(height: 36),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Prosseguir',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  /*
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 178,
                      height: 51,
                      child: ElevatedButton(
                        onPressed: _handleSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0891B2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Prosseguir',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  */
                  //const SizedBox(height: 140),
                  //const SizedBox(height: 59),
                  //const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
