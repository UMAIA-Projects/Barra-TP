import 'package:flutter/material.dart';
import '../../common/header_app.dart';
import '../widgets/navigation.dart';
import '../widgets/page_title.dart';
import '../widgets/search_form.dart';
import '../widgets/travel_suggestions.dart';
import '../../common/navigation_bar.dart';

class Consulta extends StatelessWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 480),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF475569)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 0),
                const HeaderApp(),
                const Navigation(),
                const PageTitle(),
                const SearchForm(),
                const TravelSuggestions(),
                const SizedBox(height: 56),
              ],
            ),
          ),
        ),
      ),
      // A Navigation bar agora usarÃ¡ a mesma cor da tabbar de descontos
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 1,
      ),
    );
  }
}