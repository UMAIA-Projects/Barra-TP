import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/routes.dart';

class RecuperarPasswordScreen extends StatefulWidget {
  const RecuperarPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RecuperarPasswordScreen> createState() => _RecuperarPasswordScreenState();
}

class _RecuperarPasswordScreenState extends State<RecuperarPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      print('Password recovery submitted:');
      print('New Password: ${_newPasswordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully!')),
      );
      
      // Navegar para login após alterar password
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://api.builder.io/api/v1/image/assets/TEMP/d3dbabb20bdce717470d37b44203e4d5032b48a2?width=3456',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 380,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  _buildForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.barraTeal,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:             Text(
              'BARRA TP',
              textAlign: TextAlign.center,
              style: GoogleFonts.daysOne(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          _buildLocationIcon(),
        ],
      ),
    );
  }

  Widget _buildLocationIcon() {
    return const Icon(
      Icons.location_on,
      color: Colors.white,
      size: 48,
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Alterar Password',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.barraTeal,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildInputField(
              controller: _newPasswordController,
              placeholder: 'Nova Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a new password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _confirmPasswordController,
              placeholder: 'Confirmar Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            _buildSubmitButton(),
            const SizedBox(height: 70),
            Container(
              height: 3,
              color: AppColors.divider,
            ),
            const SizedBox(height: 20),
            _buildFooterButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String placeholder,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.barraGray,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.barraBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        fontFamily: 'NunitoSans',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.barraGray,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleSubmit,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.barraBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'Prosseguir',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('Language selected');
            },
            child: Row(
              children: [
                const Text(
                  'Language',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.barraBlue,
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CustomPaint(
                    painter: DropdownArrowPainter(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('Terms and Conditions clicked');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.barraTeal,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 6,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Text(
                'Termos e Condições',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LocationPinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    const double centerX = 25.9184;
    const double centerY = 25.8244;
    const double radius = 7;

    canvas.drawCircle(
      Offset(centerX, centerY),
      radius,
      paint,
    );

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawCircle(
      Offset(centerX, centerY),
      15,
      paint,
    );
  }

  @override
  bool shouldRepaint(LocationPinPainter oldDelegate) => false;
}

class DropdownArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1D79B3)
      ..style = PaintingStyle.fill;

    final Path path = Path();
    
    path.moveTo(size.width * 0.3, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.65);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DropdownArrowPainter oldDelegate) => false;
}