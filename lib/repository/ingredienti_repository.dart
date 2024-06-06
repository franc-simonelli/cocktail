import 'package:cocktail/models/ingredienti_model.dart';
import 'package:cocktail/network/network_client.dart';

class IngredientiRepository {
  final _networkClient = NetworkClient();

  Future<List<IngredientiModel>> getAllIngredienti() async {
    final response = await _networkClient
        .getDio(showLoading: false)
        .post('v1/1/list.php?i=list');
    final content = response.data['drinks'] as List;
    return content.map((e) => IngredientiModel.fromJson(e)).toList();
  }
}
