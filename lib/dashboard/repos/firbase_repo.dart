import 'package:auth/dashboard/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class firebase_repo{
  static firebase_repo instance = firebase_repo();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();
    return querySnapshot.docs.map((doc) {
      // Cast the result of doc.data() to Map<String, dynamic>
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ProductModel.fromJson(data, doc.id);
    }).toList();
  }




   

  // Future<List<ProductModel>> fetch() async {
  //    return await FirebaseFirestore.instance.collection('products').get().then( (QuerySnapshot querySnapshot) {
  //     return querySnapshot.docs.map((e) {
  //       final Map data = e.data() as Map;

  //       Map m = {
  //         'title': data.containsKey('title') ? data['title'] : "XX",
  //         'desc': data.containsKey('desc') ? data['desc'] : "XXXX",
  //         'id': e.reference.id,
  //       };
  //       return ProductModel.fromJson(m);
  //     }).toList();
  //   });
  // }
    
  

   Future<void> addProduct(ProductModel product) async {
    CollectionReference users = FirebaseFirestore.instance.collection('products');
    await 
    users.add(product);

}
}