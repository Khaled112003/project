import 'package:auth/dashboard/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class firebase_repo{
   static firebase_repo instance = firebase_repo();

  Future<List<ProductModel>> fetch() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('products').get();
    return querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;

      return ProductModel.fromJson(data, e.id);
    }).toList();
  }
    
   }

   Future<void> addProduct(ProductModel product) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await 
    users.add(product);

  
}


  

// class ProductService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<ProductModel>> getProducts() async {
//     QuerySnapshot querySnapshot = await _firestore.collection('products').get();
//     return querySnapshot.docs.map((doc) {
//       return ProductModel.fromJson(doc.data(), doc.id);
//     }).toList();
//   }

//   Future<void> addProduct(ProductModel product) async {
//     await _firestore.collection('products').add(product.toJson());
//   }

//   Future<void> updateProduct(ProductModel product) async {
//     await _firestore.collection('products').doc(product.id).update(product.toJson());
//   }
// }