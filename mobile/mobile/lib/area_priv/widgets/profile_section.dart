import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: isMobile ? 150 : 182,
                height: isMobile ? 150 : 182,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEBEBEB),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: isMobile ? 70 : 94,
                  color: const Color(0xFF365F67),
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Gertrudes Silva',
                style: TextStyle(
                  fontFamily: 'DaysOne',
                  fontSize: isMobile ? 13 : 15,
                  color: const Color(0xFF365F67),
                ),
              ),
            ],
          ),
          SizedBox(width: isMobile ? 16 : 24),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 20.0 : 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // centraliza tudo
                children: [
                  Text(
                    '@gertrudess',
                    style: TextStyle(
                      fontFamily: 'DaysOne',
                      fontSize: isMobile ? 28 : 34, // @ maior
                      color: const Color(0xFF365F67),
                    ),
                  ),
                  SizedBox(height: isMobile ? 4 : 6),
                  Text(
                    'gertrudesilva467@gmail.com',
                    style: TextStyle(
                      fontFamily: 'DaysOne',
                      fontSize: isMobile ? 12 : 14, // email menor
                      color: const Color(0xFF365F67),
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 30 : 46,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'editar',
                        style: TextStyle(
                          fontFamily: 'DaysOne',
                          fontSize: isMobile ? 11 : 13,
                          color: const Color(0xFF365F67),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
