import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/network/network_client.dart';

class DrinkRepository {
  final _networkClient = NetworkClient();

  Future<List<DrinkModel>> getDrinksByIngrediente(String ingrediente) async {
    final response = await _networkClient
        .getDio(showLoading: false)
        .post('v1/1/filter.php?i=$ingrediente');
    final content = response.data['drinks'] as List;
    return content.map((e) => DrinkModel.fromJson(e)).toList();
  }
}
