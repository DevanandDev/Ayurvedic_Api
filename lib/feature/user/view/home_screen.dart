import 'package:ayurved/core/constants/text_const.dart';
import 'package:ayurved/feature/user/viewmodel/patients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PatientsProvider>(
        builder: (context, provider, child) {
          if (provider.isload) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.patient.isEmpty) {
            return const Center(child: Text(TextConst.noPatient));
          }

          return Expanded(
            child: ListView.builder(
              itemCount: provider.patient.length,
              itemBuilder: (context, index) {
                final patient = provider.patient[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(patient.name ?? "No Name"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone: ${patient.phone ?? ''}"),
                        Text("Branch: ${patient.branch?.name ?? ''}"),
                        if (patient.patientdetailsSet != null &&
                            patient.patientdetailsSet!.isNotEmpty)
                          Text(
                            "Treatment: ${patient.patientdetailsSet![0].treatmentName ?? ''}",
                          ),
                      ],
                    ),
                    trailing: Text("₹${patient.totalAmount ?? 0}"),
                  ),
                );
              },
            ),
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
