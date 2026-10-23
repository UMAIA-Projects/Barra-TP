import 'package:flutter/material.dart';
import 'social_section.dart';

class PassCard {
  final int id;
  final String title;
  final String imageUrl;
  final String alt;

  PassCard({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.alt,
  });
}

final List<PassCard> passCards = [
  PassCard(
    id: 1,
    title: 'Passe Animália',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/09fce0f707637b5845fb3f520d3baa9197ad3a3a?width=594',
    alt: 'Passe Animália - Green card',
  ),
  PassCard(
    id: 2,
    title: 'Passe Jovem',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/f87c64538a7df94229713aeec4054d2400b850c7?width=594',
    alt: 'Passe Jovem - Blue card',
  ),
  PassCard(
    id: 3,
    title: 'Passe Estudante',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/144c8236d20a2be08cc0ea009d5ebdddb74e6dea?width=594',
    alt: 'Passe Estudante - Dark blue card',
  ),
  PassCard(
    id: 4,
    title: 'Passe Sénior',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/65471a6d7363e87f91d55444ac59494db24f9e47?width=594',
    alt: 'Passe Sénior - Gray card',
  ),
  PassCard(
    id: 5,
    title: 'Passe Trabalhador',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/91818ce5fbd77dacfc607f64b62b6cdde02712fd?width=594',
    alt: 'Passe Trabalhador - Orange card',
  ),
  PassCard(
    id: 6,
    title: 'Passe Militar',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/96bff7368c4754322d4641c368aa636e05efb70e?width=594',
    alt: 'Passe Militar - Dark green card',
  ),
  PassCard(
    id: 7,
    title: 'Passe Incluso',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/ecace59b739f8aef33225bbe3f6c8bdac9d76245?width=594',
    alt: 'Passe Incluso - Pink card',
  ),
  PassCard(
    id: 8,
    title: 'Passe Pessoal',
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/f68b27b1e7cee64fe89210d44f615466a518db1c?width=594',
    alt: 'Passe Pessoal - Brown card',
  ),
];

class PassesInfo extends StatelessWidget {
  const PassesInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(text: "Dispomos de vários tipos de passe digitais para todas as suas necessidades e momentos:\n\n"),
              TextSpan(
                text: "Passe Animália",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para amigos de 4 patas e pessoas que viajam com os seus animais.\n"),
              TextSpan(text: "• Nunca deixe o seu companheiro sozinho! Com o passe animália não precisa de se preocupar com despesas adicionais para o seu companheiro.\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo de posse de animal doméstico.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[0]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Jovem",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para todos os jovens até aos 18 anos. Viaje livremente e sem custos.\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo da sua idade como o Cartão de Cidadão na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[1]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Estudante",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para todas as pessoas que estudam em algum estabelecimento de ensino. Viaje sem custos nas linhas que ligam a sua casa e o seu estabelecimento de ensino!\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo de matrícula em algum estabelecimento de ensino na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[2]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Sénior",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para pessoas com mais de 65 anos. Desfrute de um desconto de 30% em todas as suas viagens!\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo da sua idade como o Cartão de Cidadão na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[3]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Trabalhador",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para todas as pessoas que trabalham ativamente. Viaje com 70% desconto nas linhas que ligam a sua casa e o seu estabelecimento de trabalho!\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo da sua atividade de trabalho na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[4]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Militar",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para pessoas que participaram em eventos militares importantes. Encorajamos a sua honra oferecendo-lhe 70% desconto em todas as viagens.\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo da sua atividade militar na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[5]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Incluso",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - exclusivo para pessoas debilitadas. Oferecemos-lhe 90% desconto em todas as viagens e lugares especiais para uma viagem confortável.\n"),
              TextSpan(text: "• Pode adquirir este passe se apresentar um comprovativo médico na compra do passe digital.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[6]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Passe Pessoal",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " - para todas as pessoas, aproveite as vantagens do nosso passe sem compromissos!\n"),
              TextSpan(text: "• Adquira já o seu passe na sua área pessoal.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _PassImage(passCards[7]),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.6,
            ),
            children: [
              TextSpan(
                text: "Porquê o passe digital?\n",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: "• Comece já a poupar com todos os descontos oferecidos, desfrute de viagens sem complicações!\n"),
              TextSpan(text: "• Com o passe digital não precisa de se preocupar em transferir bilhete!\n"),
              TextSpan(text: "• Carregue o seu passe e compre os seus bilhetes rapidamente com apenas alguns cliques.\n\n"),
            ],
          ),
        ),
        const SizedBox(height: 48),
        const SocialSectionWidget(),
      ],
    );
  }
}

class _PassImage extends StatelessWidget {
  final PassCard pass;

  const _PassImage(this.pass);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            pass.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(
                    Icons.credit_card,
                    size: 64,
                    color: Color(0xFF475569),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}