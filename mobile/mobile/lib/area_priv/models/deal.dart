class Deal {
  final int id;
  final String imageUrl;
  final String from;
  final String to;
  final String price;

  Deal({
    required this.id,
    required this.imageUrl,
    required this.from,
    required this.to,
    required this.price,
  });
}

final List<Deal> deals = [
  Deal(
    id: 1,
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/b943e41b10b2037f59c13ddfc75d2a5dcc1c7991?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
    from: 'Lisboa (todas as estações)',
    to: 'Porto (Exponor)',
    price: 'Desde 6,95 €',
  ),
  Deal(
    id: 2,
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/b965ff080d8e2b05c055c68f19443fefcdd93adf?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
    from: 'Porto (todas as estações)',
    to: 'Fátima',
    price: 'Desde 7,89 €',
  ),
  Deal(
    id: 3,
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/d9e7c3879e723907bee64b1cf0dfa733cc81a356?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
    from: 'Coimbra',
    to: 'Setúbal',
    price: 'Desde 5,85 €',
  ),
  Deal(
    id: 4,
    imageUrl:
        'https://api.builder.io/api/v1/image/assets/TEMP/92036baa3fa0b77426754363af0aa5ea83bfd65f?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
    from: 'Fátima',
    to: 'Lisboa (Oriente)',
    price: 'Desde 3,99 €',
  ),
];
