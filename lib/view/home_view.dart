import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/controller/data_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(getDataFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
      body: viewModel.listDataModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.listDataModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      viewModel.listDataModel[index].title!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      viewModel.listDataModel[index].body!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    leading: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        viewModel.listDataModel[index].id.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
