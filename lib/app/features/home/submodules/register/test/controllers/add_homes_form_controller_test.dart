// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ache_um_lar/app/core/services/image_picker_service.dart';

// import '../../controllers/add_homes_form_controller.dart';

// // Mock class for ImagePickerService
// class MockImagePickerService extends Mock implements ImagePickerService {}

// // Mock class for Firestore
// class MockFirestore extends Mock implements FirebaseFirestore {}

// void main() {
//   late AddHomesFormController controller;
//   late MockImagePickerService mockImagePickerService;
//   late MockFirestore mockFirestore;

//   setUp(() {
//     mockImagePickerService = MockImagePickerService();
//     mockFirestore = MockFirestore();
//     controller = AddHomesFormController(mockImagePickerService);
//   });

//   test('Should format and save property data correctly', () async {
//     // Set up the controller with test data
//     controller.cityController.text = 'Test City';
//     controller.stateController.text = 'Test State';
//     controller.countryController.text = 'Test Country';
//     controller.addressController.text = '123 Test St';
//     controller.cepController.text = '12345-678';
//     controller.neighborhoodController.text = 'Test Neighborhood';
//     controller.numberAddressController.text = '123';
//     controller.bedroomsController.text = '3';
//     controller.bathroomsController.text = '2';
//     controller.descriptionController.text = 'Test Description';
//     controller.priceController.text = '1000000';
//     controller.condominiumTaxController.text = '500';
//     controller.iptuController.text = '100';

//     // Call the addProperties method
//     await controller.addProperties();

//     // Verify that the data was saved to Firestore correctly
//     verify(mockFirestore.collection('properties').add({
//       'city': 'Test City',
//       'state': 'Test State',
//       'country': 'Test Country',
//       'address': '123 Test St',
//       'cep': '12345-678',
//       'neighborhood': 'Test Neighborhood',
//       'number': '123',
//       'bedrooms': '3',
//       'bathrooms': '2',
//       'description': 'Test Description',
//       'price': 1000000.0,
//       'condominiumTax': 500.0,
//       'iptu': 100.0,
//     })).called(1);
//   });

//   test('Should handle null or empty values correctly', () async {
//     // Set up the controller with incomplete data
//     controller.cityController.text = '';
//     controller.stateController.text = '';
//     controller.countryController.text = '';
//     controller.addressController.text = '';
//     controller.cepController.text = '';
//     controller.neighborhoodController.text = '';
//     controller.numberAddressController.text = '';
//     controller.bedroomsController.text = '';
//     controller.bathroomsController.text = '';
//     controller.descriptionController.text = '';
//     controller.priceController.text = '';
//     controller.condominiumTaxController.text = '';
//     controller.iptuController.text = '';

//     // Call the addProperties method
//     await controller.addProperties();

//     // Verify that the data was not saved to Firestore due to validation errors
//     //verifyNever(mockFirestore.collection('properties').add(any));
//   });
// }
