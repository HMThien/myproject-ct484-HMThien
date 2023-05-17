import '../../models/product.dart';

class ProductsManager {
  final List<Product> _item = [    
  ]
    int get itemCount {
      return _item.length;
    }

    List<Product> get items{
      return [..._item];
    }
    
    List<Product> get favoriteItems{
      return _item.where((item) => item.isFavorite).toList() ;
    }
}
