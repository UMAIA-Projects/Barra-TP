class Alert {
  final String id;
  final String date;
  final String title;
  final String description;

  Alert({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
  });
}

final List<Alert> mockAlerts = [
  Alert(
    id: '1',
    date: '4 de novembro de 2025',
    title: 'Atrasos nas linhas ferroviárias do Norte:',
    description:
        'Chuvas intensas e vento forte estão a causar atrasos de 10 a 20 minutos nos serviços Porto–Aveiro e Porto–Braga.\n\nAtualização em tempo real disponível na app.',
  ),
  Alert(
    id: '2',
    date: '10 de setembro de 2025',
    title: 'Circulação suspensa entre Senhora da Hora e Casa da Música:',
    description:
        'Devido a avaria no sistema elétrico, a circulação está interrompida temporariamente.\n\nPrevisão de retoma: 11h30',
  ),
  Alert(
    id: '3',
    date: '1 de agosto de 2025',
    title: '"Volta a Portugal em Bicicleta"',
    description:
        'condiciona diferentes locais em relação a trânsito: verifique se a sua cidade vai incluir alguma restrição às ruas.\n\nDatas condicionadas: 6 a 17 de agosto',
  ),
  Alert(
    id: '4',
    date: '14 de julho de 2025',
    title: 'Greve Parcial CP:',
    description:
        'Greve parcial poderá causar atrasos ou supressões nos comboios das linhas Porto–Aveiro e Porto–Guimarães.\n\nDatas: 14 e 15 de julho',
  ),
  Alert(
    id: '5',
    date: '23 de junho de 2025',
    title: 'Encerramento de várias vias no centro do Porto:',
    description:
        'Entre as 18h00 e as 06h00, o trânsito estará condicionado no eixo Aliados–Ribeira. Linhas afetadas: STCP 600, 601, 602, 305.\n\nSugestão: Planeie deslocações com antecedência.',
  ),
  Alert(
    id: '6',
    date: '5 de maio de 2025',
    title: 'Greve na CP - Comboios Portugal:',
    description:
        'Serviços urbanos e regionais com perturbações. Greve parcial poderá causar atrasos ou supressões nos comboios das linhas Porto–Aveiro e Porto–Guimarães.\n\nDatas condicionadas: 5 e 6 de maio',
  ),
];
