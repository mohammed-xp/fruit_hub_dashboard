import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({
    required this.imagesRepo,
    required this.productsRepo,
  }) : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var urlResult =
        await imagesRepo.uploadImage(image: addProductInputEntity.image);

    urlResult.fold(
      (f) {
        emit(AddProductFailer(message: f.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;

        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(AddProductFailer(message: f.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
