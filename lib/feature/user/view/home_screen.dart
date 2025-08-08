import 'package:ayurved/feature/user/viewmodel/patients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients List")),
      body: Consumer<PatientsProvider>(
        builder: (context, provider, child) {
          if (provider.isload) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.patient.isEmpty) {
            return const Center(child: Text("No patients found"));
          }

          return ListView.builder(
            itemCount: provider.patient.length,
            itemBuilder: (context, index) {
              final p = provider.patient[1];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(p.name ?? "No Name"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ${p.phone ?? '-'}"),
                      Text("Branch: ${p.branch?.name ?? '-'}"),
                      if (p.patientdetailsSet != null &&
                          p.patientdetailsSet!.isNotEmpty)
                        Text(
                          "Treatment: ${p.patientdetailsSet![0].treatmentName ?? '-'}",
                        ),
                    ],
                  ),
                  trailing: Text("₹${p.totalAmount ?? 0}"),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PatientsProvider>().getPatientProvider();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
