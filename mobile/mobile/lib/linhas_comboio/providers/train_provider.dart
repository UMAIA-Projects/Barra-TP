import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/train_line.dart';

final trainLinesProvider = Provider<List<TrainLine>>((ref) {
  return [
    TrainLine(
      id: '1',
      type: TrainType.ap,
      name: 'Linha do Norte',
      color: '#6BF051',
    ),
    TrainLine(
      id: '2',
      type: TrainType.ic,
      name: 'Linha da Beira Baixa',
      color: '#9C7BB2',
    ),
    TrainLine(
      id: '3',
      type: TrainType.ic,
      name: 'Linha do Norte',
      color: '#6BF051',
    ),
    TrainLine(
      id: '4',
      type: TrainType.ir,
      name: 'Caíde - Régua',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '5',
      type: TrainType.ir,
      name: 'Marco de Canaveses - Porto Campanhã',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '6',
      type: TrainType.ir,
      name: 'Pocinho - Régua',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '7',
      type: TrainType.ir,
      name: 'Marco de Canaveses - Porto São Bento',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '8',
      type: TrainType.ir,
      name: 'Linha do Minho',
      color: '#7390EF',
    ),
    TrainLine(
      id: '9',
      type: TrainType.ir,
      name: 'Linha do Norte',
      color: '#6BF051',
    ),
    TrainLine(
      id: '10',
      type: TrainType.ir,
      name: 'Marco de Canaveses - Régua',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '11',
      type: TrainType.ir,
      name: 'Linha do Douro',
      color: '#00E5FF',
    ),
    TrainLine(
      id: '12',
      type: TrainType.r,
      name: 'Aveiro - Granja',
      color: '#F0B851',
    ),
    TrainLine(
      id: '13',
      type: TrainType.r,
      name: 'Linha de Aveiro',
      color: '#F8D825',
    ),
    TrainLine(
      id: '14',
      type: TrainType.r,
      name: 'Linha de Braga',
      color: '#29AC02',
    ),
    TrainLine(
      id: '15',
      type: TrainType.r,
      name: 'Linha de Guimarães',
      color: '#FF0000',
    ),
    TrainLine(
      id: '16',
      type: TrainType.r,
      name: 'Linha de Leixões',
      color: '#E642D1',
    ),
    TrainLine(
      id: '17',
      type: TrainType.r,
      name: 'Linha de Caíde | Marco',
      color: '#3FB9DA',
    ),
    TrainLine(
      id: '18',
      type: TrainType.r,
      name: 'Porto São Bento - Valongo',
      color: '#8375FB',
    ),
    TrainLine(
      id: '19',
      type: TrainType.r,
      name: 'Caíde - Régua',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '20',
      type: TrainType.r,
      name: 'Linha da Beira Alta',
      color: '#70BF57',
    ),
    TrainLine(
      id: '21',
      type: TrainType.r,
      name: 'Marco de Canaveses - Porto Campanhã',
      color: '#FFFFFF',
    ),
    TrainLine(
      id: '22',
      type: TrainType.r,
      name: 'Linha do Norte',
      color: '#6BF051',
    ),
    TrainLine(
      id: '23',
      type: TrainType.r,
      name: 'Linha do Vouga',
      color: '#EE9B00',
    ),
  ];
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredTrainLinesProvider = Provider<List<TrainLine>>((ref) {
  final allLines = ref.watch(trainLinesProvider);
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) {
    return allLines;
  }

  return allLines
      .where((line) => line.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
});

final selectedTabProvider = StateProvider<String>((ref) => 'comboio');
