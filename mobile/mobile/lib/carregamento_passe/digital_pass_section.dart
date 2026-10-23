import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalPassSection extends StatefulWidget {
  const DigitalPassSection({Key? key}) : super(key: key);

  @override
  DigitalPassSectionState createState() => DigitalPassSectionState();
}

class DigitalPassSectionState extends State<DigitalPassSection> {
  bool _paid = false;

  void updatePaymentStatus() {
    setState(() {
      _paid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFF407079),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Passe Digital',
                  style: GoogleFonts.daysOne(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: _paid ? Colors.purple : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF407079),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFF407079),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                'Carregar Passe',
                style: GoogleFonts.daysOne(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: _paid ? Colors.purple : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
