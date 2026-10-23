import 'package:flutter/material.dart';
import 'package:desktop/Login/screens/login_screen.dart';
import 'package:desktop/Sign Up/screens/signup_screen.dart';
import 'package:desktop/Recuperar_password/screens/recuperar_password_screen.dart';
import 'package:desktop/Consulta/HomePage/screens/home_screen.dart';
import 'package:desktop/Consulta/Pesquisa/screens/pesquisa_screen.dart';
import 'package:desktop/Avaliacao/screens/avaliacao_screen.dart';
import 'package:desktop/Suporte_Operacional/screens/suporte_operacional_screen.dart';
import 'package:desktop/AI_Gertrudes/screens/ai_gertrudes_screen.dart';
import 'package:desktop/Saber_Mais/screens/saber_mais_screen.dart';
import 'package:desktop/areaprivada/ap_comprar_passe/screens/comprar_passe_screen.dart';
import 'package:desktop/Alertas/screens/alertas_screen.dart';
import 'package:desktop/Definicoes/screens/definicoes_screen.dart';
import 'package:desktop/Planeamento/screens/planeamento_inicial_screen.dart';
import 'package:desktop/linhas/screens/linhas_favoritas_screen.dart';
import 'package:desktop/Aluguer/Aluguer/screens/aluguer_screen.dart';
import 'package:desktop/Aluguer/Compra/screens/aluguer_compra_screen.dart';
import 'package:desktop/Mapa_Offiline/pages/mapa_offline_satelite_screen.dart';
import 'package:desktop/areaprivada/areaprivada_1/screens/area_privada_screen.dart';
import 'package:desktop/areaprivada/ap_carregar_passe/screens/carregar_passe_screen.dart';
import 'package:desktop/areaprivada/ap_passse_digital/screens/passe_digital_screen.dart';


class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String signup = '/signup';
  static const String recuperar = '/recuperar';
  static const String consulta = '/consulta';
  static const String pesquisa = '/pesquisa';
  static const String definicoes = '/definicoes';
  static const String alertas = '/alertas';
  static const String comprarPasse = '/comprarPasse';
  static const String carregarPasse = '/carregarPasse';
  static const String passeDigital = '/passeDigital';    
  static const String planeamento = '/planeamento';
  static const String linhas = '/linhas';
  static const String aluguer = '/aluguer';
  static const String compraAluguer = '/compraAluguer';
  static const String mapaOffiline = '/mapaOffiline';
  static const String areaprivada = '/areaprivada';
  static const String avaliacao = '/avaliacao';
  static const String suporte = '/suporte';
  static const String aiGertrudes = '/ai-gertrudes';
  static const String saberMais = '/saber-mais';

  // Routes map
  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginScreen(),
      signup: (context) => const SignUpScreen(),
      recuperar: (context) => const RecuperarPasswordScreen(),
      consulta: (context) => const HomeScreen(),
      pesquisa: (context) => const PesquisaScreen(),
      definicoes: (context) => const DefinicoesScreen(),
      alertas: (context) => const AlertasScreen(),
      comprarPasse: (context) => const ComprarPasseScreen(),
      carregarPasse: (context) => const CarregarPasseScreen(),
      passeDigital: (context) => const PasseDigitalScreen(),
      planeamento: (context) => const PlaneamentoInicialScreen(),
      linhas: (context) => const LinhasFavoritasScreen(),
      aluguer: (context) => const AluguerScreen(),
      compraAluguer: (context) => const AluguerCompraScreen(),
      mapaOffiline: (context) => const MapaOffline_Satelite_Screen(),
      areaprivada: (context) => const AreaprivadaScreen(),
      avaliacao: (context) => const AvaliacaoScreen(),
      suporte: (context) => const SuporteOperacionalScreen(),
      aiGertrudes: (context) => const AiGertrudesScreen(),
      saberMais: (context) => const SaberMaisScreen(),
    };
  }
}