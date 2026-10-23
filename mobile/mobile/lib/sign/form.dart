import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      //print('Form submitted');
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Form(
        key: _formKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign Up',
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do utilizador',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF78716C),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF78716C),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF78716C),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmação da Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF78716C),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            /*
            Container(
              width: double.infinity,
              //constraints: const BoxConstraints(maxWidth: 359),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: const Text(
                'Nome do utilizador ou email',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF78716C),
                ),
              ),
            ),
            */
            const SizedBox(height: 36),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
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
                  'Criar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            /*
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
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
                  'Criar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
