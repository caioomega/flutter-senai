import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'inter'),
      home: Scaffold(
        backgroundColor: const Color(0xFF1C1C1E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1C1E),
          elevation: 0,
          title: const Text(
            'Meus Cartões',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ─── CARTÃO GOLD ────────────────────────────────────────────
              _buildCard(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF8C00), Color(0xFFFF5500)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                logoColor: Colors.white,
                textColor: Colors.white,
                subTextColor: Colors.white70,
                numero: '4716 **** **** 3821',
                nome: 'JOÃO DA SILVA',
                agencia: '0001',
                conta: '12345-6',
                validade: '09/27',
                tipo: 'Gold',
                tipoColor: Colors.white70,
              ),

              const SizedBox(height: 28),

              // ─── CARTÃO PLATINUM ─────────────────────────────────────────
              _buildCard(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6E6E73), Color(0xFF3A3A3C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                logoColor: Colors.white,
                textColor: Colors.white,
                subTextColor: Colors.white60,
                numero: '5239 **** **** 7841',
                nome: 'JOÃO DA SILVA',
                agencia: '0001',
                conta: '12345-6',
                validade: '03/28',
                tipo: 'Platinum',
                tipoColor: Colors.white60,
              ),

              const SizedBox(height: 28),

              // ─── CARTÃO BLACK ─────────────────────────────────────────────
              _buildCard(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2C2C2E), Color(0xFF1C1C1E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                logoColor: const Color(0xFFFF6600),
                textColor: Colors.white,
                subTextColor: Colors.white38,
                numero: '5500 **** **** 1193',
                nome: 'JOÃO DA SILVA',
                agencia: '0001',
                conta: '12345-6',
                validade: '11/29',
                tipo: 'Black',
                tipoColor: Colors.white38,
                borderColor: const Color(0xFF3A3A3C),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildCard({
  required Gradient gradient,
  required Color logoColor,
  required Color textColor,
  required Color subTextColor,
  required String numero,
  required String nome,
  required String agencia,
  required String conta,
  required String validade,
  required String tipo,
  required Color tipoColor,
  Color borderColor = Colors.transparent,
}) {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: borderColor, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    padding: const EdgeInsets.all(22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // Linha 1 – Logo inter + tipo do cartão
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: logoColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'i',
                      style: TextStyle(
                        color: logoColor == Colors.white
                            ? const Color(0xFFFF6600)
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'inter',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            Text(
              tipo,
              style: TextStyle(
                color: tipoColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),

        // Linha 2 – Chip SIM + ícone contactless
        Row(
          children: [
            Icon(Icons.sim_card, color: textColor.withOpacity(0.85), size: 28),
            const SizedBox(width: 8),
            RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.wifi, color: textColor.withOpacity(0.7), size: 20),
            ),
          ],
        ),

        // Linha 3 – Número do cartão
        Text(
          numero,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
          ),
        ),

        // Linha 4 – Nome | Validade | Mastercard
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Nome + ag/conta
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Ag $agencia  Cc $conta',
                  style: TextStyle(color: subTextColor, fontSize: 10),
                ),
              ],
            ),

            // Validade
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'VALIDADE',
                  style: TextStyle(color: subTextColor, fontSize: 8, letterSpacing: 1),
                ),
                Text(
                  validade,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),

            // Mastercard logo
            SizedBox(
              width: 44,
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEB001B).withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF79E1B).withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}