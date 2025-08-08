import 'package:ayurved/core/constants/color_const.dart';
import 'package:ayurved/core/constants/text_const.dart';
import 'package:ayurved/core/widgets/button.dart';
import 'package:ayurved/feature/user/viewmodel/patients_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  MyHome({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Icon(Icons.notifications_none_sharp, size: 30),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: TextConst.searchTreatment,
                        prefixIcon: Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 80,
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorConst.darkGreen,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        TextConst.search,
                        style: TextStyle(color: ColorConst.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Divider(),
              Consumer<PatientsProvider>(
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
                            title: Text("${index + 1}. ${patient.name}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone: ${patient.phone ?? ''}"),
                                Text("Date: ${patient.dateNdTime ?? 'No '}"),
                                Divider(),
                                GestureDetector(
                                  onTap: () => context.push('/userDetails'),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(TextConst.bookinDetail),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: ColorConst.darkGreen,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              submitBtn(() => context.push('/userBooking')),
              const SizedBox(height: 30),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<PatientsProvider>().getPatientProvider();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
