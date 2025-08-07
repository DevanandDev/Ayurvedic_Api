// my_home.dart
import 'package:ayurved/feature/user/viewmodel/patients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<PatientsProvider>(context, listen: false).getPatientProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Patients List")),
      body: Consumer<PatientsProvider>(
        builder: (context, provider, _) {
          if (provider.isload) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.patient.length,
            itemBuilder: (context, index) {
              final patient = provider.patient[index];
              return Card(
                child: ListTile(
                  title: Text(patient.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ${patient.phone}"),
                     
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
