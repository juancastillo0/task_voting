import 'package:file_system_access/file_system_access.dart';
import 'package:mobx/mobx.dart';
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/notifiers/app_notifier.dart';
import 'package:task_voting/src/util/image_value.dart';
import 'package:task_voting/src/util/prelude.dart';
import 'package:task_voting/src/util/string.dart';

class ChoiceModel with StoreSerde {
  ChoiceModel({String? id}) : id = id ?? randomKey();

  final Id id;

  @override
  String get name => id;

  static final typeSerde = Serde.fromStore(
    (json) => ChoiceModel(id: (json as Map)['id'] as String),
  );

  final Obs<String> title = Obs('title', '');
  final Obs<ImageValue?> image = Obs(
    'image',
    null,
    serde: ImageValue.typeSerde,
  );
  final Obs<String?> description = Obs('description', null);

  final Obs<List<ImageValue>?> additionalImages = Obs(
    'additionalImages',
    null,
    serde: ImageValue.typeSerde.list(),
  );
  final pros = ObsList<String>('pros');
  final cons = ObsList<String>('cons');

  final isExpanded = Obs<bool?>('areItemsExpanded', null);

  late final iceAssessment = ItemICEAssessment('iceAssessment');
  final rankingPoints = Obs('rankingPoints', 0);

  void selectImages() async {
    final images = await FileSystem.instance.showOpenFilePickerWebSafe(
      const FsOpenOptions(
        multiple: true,
        startIn: AppPlatform.kIsWeb
            ? FsStartsInOptions.path(WellKnownDirectory.pictures)
            : null,
        types: [
          FilePickerAcceptType(
            description: 'Images',
            accept: {
              'image/*': ['.png', '.gif', '.jpeg', '.jpg']
            },
          )
        ],
      ),
    );
    if (images.isNotEmpty) {
      runInAction(name: 'selectImage', () {
        image.set(ImageValue(
          handle: images.first.handle,
          xFile: images.first.file,
        ));
        if (images.length > 1) {
          additionalImages.set(
            images
                .skip(1)
                .map(
                  (e) => ImageValue(
                    handle: e.handle,
                    xFile: e.file,
                  ),
                )
                .toList(),
          );
        } else {
          additionalImages.set(null);
        }
      });
    }
  }

  void removeImages() {
    image.set(null);
    additionalImages.set(null);
  }

  @override
  late final List<ToJson> serdeProperties = [
    ToJson.constant('id', id),
    title,
    image,
    description,
    additionalImages,
    pros,
    cons,
    isExpanded,
    iceAssessment,
    rankingPoints,
  ];
}
