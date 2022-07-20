import 'package:file_system_access/file_system_access.dart';
import 'package:task_voting/src/notifiers/app_notifier.dart';
import 'package:task_voting/src/settings/settings_service.dart';
import 'package:task_voting/src/util/prelude.dart';

class ImageValue {
  final String? url;
  final FileSystemFileHandle? handle;
  final XFile? xFile;

  ImageValue({
    this.url,
    this.handle,
    this.xFile,
  }) {
    if (handle == null && url == null && xFile == null) {
      throw Exception();
    }
  }

  static final typeSerde = Serde<ImageValue>(
    fromJson: (json) {
      final file = (json as Map)['file'];
      FileSystemPersistanceItem? item;
      if (file is int && SettingsService.webFilePersistence != null) {
        item = SettingsService.webFilePersistence!.get(file);
      }

      final value = ImageValue(
        url: json['url'] as String?,
        xFile: file is String ? XFile(file) : item?.persistedFile?.file,
        handle: item?.handle as FileSystemFileHandle?,
      );
      return value;
    },
    toJson: (json) async {
      // TODO: should this be necessary?
      if (json == null) return null;

      final Object? file;
      if (json.handle != null) {
        if (AppPlatform.kIsWeb && SettingsService.webFilePersistence != null) {
          file = await SettingsService.webFilePersistence!
              .put(json.handle!)
              .then((value) => value.id);
        } else {
          file = await json.handle!.getFile().then((value) => value.path);
        }
      } else if (json.xFile != null) {
        if (AppPlatform.kIsWeb && SettingsService.webFilePersistence != null) {
          file = await SettingsService.webFilePersistence!
              .putFile(json.xFile!)
              .then((value) => value.id);
        } else {
          file = json.xFile!.path;
        }
      } else {
        file = null;
      }

      return {
        if (json.url != null) 'url': json.url,
        if (file != null) 'file': file,
      };
    },
  );
}
