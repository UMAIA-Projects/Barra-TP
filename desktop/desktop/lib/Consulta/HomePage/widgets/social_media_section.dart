import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class SocialLink {
  final String name;
  final String iconUrl;
  final String alt;

  SocialLink({
    required this.name,
    required this.iconUrl,
    required this.alt,
  });
}

final List<SocialLink> socialLinks = [
  SocialLink(
    name: 'Facebook',
    iconUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/fa1b83655a51ec9e02de4d0e29befd5e80426e5b?width=156',
    alt: 'Facebook',
  ),
  SocialLink(
    name: 'Instagram',
    iconUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/cda52e84fbd720e15b831cdb207bdf991e0377bc?width=156',
    alt: 'Instagram',
  ),
  SocialLink(
    name: 'Youtube',
    iconUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/211cb18b72475797064174741f2cee0480f42a7e?width=156',
    alt: 'Youtube',
  ),
  SocialLink(
    name: 'Twitter',
    iconUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/67a3d6531b04afbc51fd6ef8c8ab238c7e805a01?width=156',
    alt: 'Twitter',
  ),
];

class SocialSectionWidget extends StatelessWidget {
  const SocialSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Redes Sociais',
          style: GoogleFonts.nunitoSans(
            color: AppColors.barraTeal,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Partilhe os seus melhores momentos connosco!',
          style: GoogleFonts.nunitoSans(
            color: AppColors.barraTeal,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Siga-nos e partilhe os seus melhores momentos com #BarraTP nas redes sociais.\nDesfrute do que Portugal tem de melhor para lhe oferecer.\nVamos viajar com #PortugalMaisPerto',
          style: GoogleFonts.nunitoSans(
            color: AppColors.barraTeal,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),
        // Social icons row
        _buildSocialIconsRow(context),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSocialIconsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialLinks.asMap().entries.map((entry) {
        final social = entry.value;
        final index = entry.key;
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 0 : 80,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  // Adicionar navegação para redes sociais aqui
                  print('Clicked on ${social.name}');
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    social.iconUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.barraTeal,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.error,
                          size: 30,
                          color: AppColors.barraTeal,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                social.name,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraTeal,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}