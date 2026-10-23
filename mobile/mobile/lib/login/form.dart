import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Login',
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
          const SizedBox(height: 36),
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
              'Password',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF78716C),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Container(
            width: double.infinity,
            //constraints: const BoxConstraints(maxWidth: 327),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment
                  .start, //align top, if removed, aligns center
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary, // const Color(0xFF1D79B3),
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
                    'Entrar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/newpass');
                      },
                      child: const Text(
                        'Alterar Password',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF0891B2),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0891B2),
                        ),
                      ),
                    ),
                  ),
                ),
                /*
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Alterar Password',
                    style: TextStyle(
                      fontSize: 18, //16
                      color: Color(0xFF0891B2),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0891B2),
                    ),
                  ),
                ),
                */
                /*
                const SizedBox(width: 90),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF0891B2),
                    ),
                    child: const Text(
                      'Alterar Password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
