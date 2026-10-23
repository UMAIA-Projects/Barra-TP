import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/linhas/widgets/bus_line_item.dart';
import 'package:desktop/linhas/widgets/train_line_item.dart';
import 'package:desktop/linhas/widgets/metro_line_item.dart';

class StatusSidebar extends StatelessWidget {
  const StatusSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: _buildCard(
          title: '',
          child: Column(
            children: [
              _buildSection(
                title: 'Autocarros em falha',
                child: Column(
                  children: [
                    BusLineItem(
                      number: '504',
                      variant: BusVariant.yellow,
                    ),
                    BusLineItem(
                      number: '203',
                      variant: BusVariant.cyan,
                    ),
                    BusLineItem(
                      number: '5M',
                      variant: BusVariant.outline,
                    ),
                    BusLineItem(
                      number: '1M',
                      variant: BusVariant.outline,
                    ),
                    BusLineItem(
                      number: '604',
                      variant: BusVariant.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              _buildSection(
                title: 'Linhas - Comboio',
                child: SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TrainLineItem(
                          name: 'Guimarães',
                          color: TrainColor.red,
                        ),
                        TrainLineItem(
                          name: 'Aveiro - Granja',
                          color: TrainColor.orange,
                        ),
                        TrainLineItem(
                          name: 'Aveiro',
                          color: TrainColor.yellow,
                        ),
                        TrainLineItem(
                          name: 'Braga',
                          color: TrainColor.green,
                          highlighted: true,
                        ),
                        TrainLineItem(
                          name: 'Caíde - Marco',
                          color: TrainColor.cyan,
                        ),
                        TrainLineItem(
                          name: 'Leixões',
                          color: TrainColor.magenta,
                        ),
                        TrainLineItem(
                          name: 'Porto - Valongo',
                          color: TrainColor.purple,
                        ),
                        TrainLineItem(
                          name: 'Minho',
                          color: TrainColor.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(
                title: 'Linhas - Metro',
                child: Column(
                  children: [
                    MetroLineItem(
                      line: 'A',
                      status: 'Operacional',
                      color: MetroColor.cyan,
                    ),
                    MetroLineItem(
                      line: 'B',
                      status: 'Operacional',
                      color: MetroColor.red,
                    ),
                    MetroLineItem(
                      line: 'Bx',
                      status: 'Operacional',
                      color: MetroColor.red,
                    ),
                    MetroLineItem(
                      line: 'C',
                      status: 'Operacional',
                      color: MetroColor.green,
                    ),
                    MetroLineItem(
                      line: 'D',
                      status: 'Operacional',
                      color: MetroColor.yellow,
                    ),
                    MetroLineItem(
                      line: 'E',
                      status: 'Operacional',
                      color: MetroColor.purple,
                    ),
                    MetroLineItem(
                      line: 'F',
                      status: 'Operacional',
                      color: MetroColor.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: child,
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.headlineLarge ??
              const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: AppColors.barraTeal,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 4,
            color: AppColors.barraTeal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: child,
        ),
      ],
    );
  }
}