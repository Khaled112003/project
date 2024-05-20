import 'package:auth/dashboard/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class firebase_repo {
  static firebase_repo instance = firebase_repo();

  Future<List<ProductModel>> fetch() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('products').get();
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map<String, dynamic> m = {
          'title': data.containsKey('title') ? data['title'] : "XX",
          'desc': data.containsKey('desc') ? data['desc'] : "XXXX",
          'id': e.reference.id,
        };
        return ProductModel.fromJson(m);
      }).toList();
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }
}