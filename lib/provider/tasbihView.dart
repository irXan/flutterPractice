import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_01/provider/tasbih.dart';
import 'package:provider/provider.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    final tasbihProvider = context.watch<TasbihProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("TASBIH APP", style: GoogleFonts.orbitron(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Current Count", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                      Text(
                        "${tasbihProvider.count}",
                        style: GoogleFonts.orbitron(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text("Total: ${tasbihProvider.tasbihCount}", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: theme.colorScheme.primaryContainer,
                    ),
                    onPressed: () => tasbihProvider.reset(),
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                    ),
                    onPressed: () => tasbihProvider.inc(),
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text("Increment"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}