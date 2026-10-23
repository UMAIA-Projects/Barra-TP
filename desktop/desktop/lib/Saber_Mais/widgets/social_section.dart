import 'package:flutter/material.dart';
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
        const Text(
          'Redes Sociais',
          style: TextStyle(
            color: AppColors.barraTeal,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'NunitoSans',
            shadows: [
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromARGB(64, 0, 0, 0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Divider
        Container(
          width: double.infinity,
          height: 2,
          color: AppColors.barraTeal,
        ),
        const SizedBox(height: 32),
        // Social text
        Center(
          child: SizedBox(
            width: 800,
            child: Text(
              'Siga as nossas redes sociais partilhe os seus melhores momentos com #BarraTP. Desfrute do que Portugal tem de melhor para lhe oferecer.\n\nVamos viajar com #PortugalMaisPerto',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.barraTeal,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'NunitoSans',
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Social icons grid
        _buildSocialIconsGrid(context),
      ],
    );
  }

  Widget _buildSocialIconsGrid(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialLinks.asMap().entries.map((entry) {
            final social = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
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
                  const SizedBox(height: 16),
                  Text(
                    social.name,
                    style: const TextStyle(
                      color: AppColors.barraTeal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NunitoSans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}