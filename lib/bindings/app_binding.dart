import 'package:get/get.dart';
import 'package:way_data_technical_challenge/data/datasources/character_service.dart';
import 'package:way_data_technical_challenge/data/repositories/character_repository_impl.dart';
import 'package:way_data_technical_challenge/domain/repositories/character_repository.dart';
import 'package:way_data_technical_challenge/domain/usecases/get_all_characters_usecase.dart';
import 'package:way_data_technical_challenge/presentation/controllers/character_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterService>(() => CharacterService());

    Get.lazyPut<CharacterRepository>(
      () => CharacterRepositoryImpl(characterService: Get.find()),
    );
    
    Get.lazyPut<GetAllCharactersUsecase>(
      () => GetAllCharactersUsecase(repository: Get.find()),
    );

    Get.lazyPut<CharacterController>(
      () => CharacterController(getAllCharactersUsecase: Get.find()),
    );
  }
}