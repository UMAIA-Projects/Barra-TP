import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';

class FiltersModal extends StatefulWidget {
  const FiltersModal({Key? key}) : super(key: key);

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  RangeValues _priceRange = const RangeValues(0, 100);
  bool _directOnly = false;
  bool _hasStops = true;
  bool _isBus = true;
  bool _isPlane = true;
  String _selectedTime = 'Qualquer hora';
  final List<String> _timeOptions = [
    'Qualquer hora',
    'Manhã (06:00-12:00)',
    'Tarde (12:00-18:00)',
    'Noite (18:00-24:00)',
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle para arrastar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.mediumGray,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Cabeçalho
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filtros',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.barrateal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _priceRange = const RangeValues(0, 100);
                          _directOnly = false;
                          _hasStops = true;
                          _isBus = true;
                          _isPlane = true;
                          _selectedTime = 'Qualquer hora';
                        });
                      },
                      child: Text(
                        'Limpar tudo',
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.barraRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Conteúdo rolável
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Faixa de preço
                      _buildSectionTitle('Faixa de Preço'),
                      RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 100,
                        divisions: 20,
                        labels: RangeLabels(
                          '${_priceRange.start.round()}€',
                          '${_priceRange.end.round()}€',
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                        activeColor: AppColors.barrateal,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0€',
                            style: GoogleFonts.nunitoSans(color: AppColors.darkGray),
                          ),
                          Text(
                            '100€',
                            style: GoogleFonts.nunitoSans(color: AppColors.darkGray),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Tipo de viagem
                      _buildSectionTitle('Tipo de Viagem'),
                      Wrap(
                        spacing: 8,
                        children: [
                          FilterChip(
                            label: Text('Direta'),
                            selected: _directOnly,
                            onSelected: (selected) {
                              setState(() {
                                _directOnly = selected;
                              });
                            },
                            backgroundColor: AppColors.lightGray,
                            selectedColor: AppColors.barrateal.withOpacity(0.2),
                            checkmarkColor: AppColors.barrateal,
                          ),
                          FilterChip(
                            label: Text('Com escalas'),
                            selected: _hasStops,
                            onSelected: (selected) {
                              setState(() {
                                _hasStops = selected;
                              });
                            },
                            backgroundColor: AppColors.lightGray,
                            selectedColor: AppColors.barrateal.withOpacity(0.2),
                            checkmarkColor: AppColors.barrateal,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Meio de transporte
                      _buildSectionTitle('Transporte'),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text('Autocarro', style: GoogleFonts.nunitoSans()),
                              value: _isBus,
                              onChanged: (value) {
                                setState(() {
                                  _isBus = value ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: AppColors.barrateal,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: Text('Avião', style: GoogleFonts.nunitoSans()),
                              value: _isPlane,
                              onChanged: (value) {
                                setState(() {
                                  _isPlane = value ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: AppColors.barrateal,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Hora de partida
                      _buildSectionTitle('Hora de Partida'),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _timeOptions.map((time) {
                          return ChoiceChip(
                            label: Text(time),
                            selected: _selectedTime == time,
                            onSelected: (selected) {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                            backgroundColor: AppColors.lightGray,
                            selectedColor: AppColors.barrateal,
                            labelStyle: GoogleFonts.nunitoSans(
                              color: _selectedTime == time ? Colors.white : Colors.black,
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Botões de ação
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: AppColors.mediumGray)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: AppColors.barrateal),
                        ),
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.nunitoSans(
                            color: AppColors.barrateal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Aplicar filtros aqui
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.barrateal,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Aplicar Filtros',
                          style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.barrateal,
        ),
      ),
    );
  }
}