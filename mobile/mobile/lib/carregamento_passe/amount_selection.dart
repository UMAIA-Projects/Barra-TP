import 'package:flutter/material.dart';

class AmountSelection extends StatefulWidget {
  @override
  _AmountSelectionState createState() => _AmountSelectionState();
}

class _AmountSelectionState extends State<AmountSelection> {
  String selectedAmount = '';
  TextEditingController customAmountController = TextEditingController();

  final List<Map<String, String>> amounts = [
    {'value': '5', 'label': '5€'},
    {'value': '50', 'label': '50€'},
    {'value': '500', 'label': '500€'},
    {'value': '20', 'label': '20€'},
    {'value': '100', 'label': '100€'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 415),
      decoration: BoxDecoration(
        color: Color(0xFF71717A).withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Montantes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF475569),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 84,
            height: 1,
            color: Color(0xFF475569),
          ),
          SizedBox(height: 6),
          Text(
            'Selecione uma opção:',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF475569),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: amounts.take(3).map((amount) =>
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedAmount = amount['value']!),
                  child: Row(
                    children: [
                      Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF475569)),
                          borderRadius: BorderRadius.circular(6),
                          color: selectedAmount == amount['value']
                            ? Color(0xFF475569)
                            : Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          amount['label']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).toList(),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ...amounts.skip(3).map((amount) =>
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedAmount = amount['value']!),
                    child: Row(
                      children: [
                        Container(
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF475569)),
                            borderRadius: BorderRadius.circular(6),
                            color: selectedAmount == amount['value']
                              ? Color(0xFF475569)
                              : Colors.transparent,
                          ),
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            amount['label']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedAmount = 'custom'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF475569)),
                          borderRadius: BorderRadius.circular(6),
                          color: selectedAmount == 'custom'
                            ? Color(0xFF475569)
                            : Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Personalizado',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (selectedAmount == 'custom') ...[
            SizedBox(height: 8),
            Container(
              width: 150,
              child: TextField(
                controller: customAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Insira o valor',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF475569)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF475569)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF475569), width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}