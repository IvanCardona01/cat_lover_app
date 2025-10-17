import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/breed_details_viewmodel.dart';

class BreedDetailsView extends GetView<BreedDetailsViewModel> {
   const BreedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breed Details'),
      ),
    );
  }
}