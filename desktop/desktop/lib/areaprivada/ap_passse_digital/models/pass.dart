class Pass {
  final String id;
  final String name;
  final String description;
  final bool isActive;

  Pass({
    required this.id,
    required this.name,
    required this.description,
    this.isActive = false,
  });
}

class PassType {
  final String name;

  PassType({required this.name});
}

final List<PassType> passTypes = [
  PassType(name: 'Animália'),
  PassType(name: 'Jovem'),
  PassType(name: 'Estudante'),
  PassType(name: 'Sénior'),
  PassType(name: 'Trabalhador'),
  PassType(name: 'Militar'),
  PassType(name: 'Inclusivo'),
  PassType(name: 'Pessoal'),
];

final List<Pass> userPasses = [
  Pass(
    id: '1',
    name: 'Passe Animália',
    description: 'Passe para animais',
    isActive: true,
  ),
  Pass(
    id: '2',
    name: 'Passe Jovem',
    description: 'Passe para jovens',
  ),
  Pass(
    id: '3',
    name: 'Passe Inclusivo',
    description: 'Passe inclusivo',
  ),
];
