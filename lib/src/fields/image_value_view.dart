import 'dart:io';

import 'package:file_system_access/file_system_access.dart';
import 'package:flutter/foundation.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/util/image_value.dart';

class ImageValueView extends StatefulWidget {
  const ImageValueView({
    Key? key,
    required this.image,
    this.widget,
  }) : super(key: key);
  final ImageValue image;
  final Image? widget;

  @override
  State<ImageValueView> createState() => _ImageValueViewState();
}

class _ImageValueViewState extends State<ImageValueView> {
  XFile? file;
  PermissionStateEnum? permissionState;

  @override
  void initState() {
    super.initState();
    setUpFile();
  }

  @override
  void didUpdateWidget(covariant ImageValueView oldWidget) {
    super.didUpdateWidget(oldWidget);
    setUpFile();
  }

  Future<void> setUpFile() async {
    final handle = widget.image.handle;
    if (handle == null) {
      file = widget.image.xFile;
      permissionState = null;
      if (mounted) {
        setState(() {});
      }
    } else {
      try {
        final value =
            await handle.requestPermission(mode: FileSystemPermissionMode.read);
        permissionState = value;
      } catch (e) {
        permissionState = PermissionStateEnum.prompt;
      }
      if (!mounted) return;
      setState(() {});

      if (permissionState != PermissionStateEnum.granted) return;
      final file = await handle.getFile();
      if (mounted && handle == widget.image.handle) {
        setState(() {
          this.file = file;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final ImageProvider provider;
    if (widget.image.url != null) {
      final url = widget.image.url!;
      if (url.startsWith('assets')) {
        provider = AssetImage(url);
      } else {
        provider = NetworkImage(url);
      }
    } else {
      if (permissionState != null &&
          permissionState != PermissionStateEnum.granted) {
        return Container(
          width: 300,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  loc.viewImagePermissionError,
                  textAlign: TextAlign.center,
                ),
              ),
              OutlinedButton(
                onPressed: setUpFile,
                child: Text(loc.retry),
              ),
            ],
          ),
        );
      }
      if (file == null) {
        return const CircularProgressIndicator();
      }
      final path = file!.path;
      if (kIsWeb) {
        provider = NetworkImage(path);
      } else {
        provider = FileImage(File(path));
      }
    }
    final imageWidget = widget.widget ?? Image.asset('');
    final child = Image(
      image: provider,
      frameBuilder: imageWidget.frameBuilder,
      loadingBuilder: imageWidget.loadingBuilder,
      errorBuilder: imageWidget.errorBuilder,
      semanticLabel: imageWidget.semanticLabel,
      excludeFromSemantics: imageWidget.excludeFromSemantics,
      width: imageWidget.width,
      height: imageWidget.height,
      color: imageWidget.color,
      opacity: imageWidget.opacity,
      colorBlendMode: imageWidget.colorBlendMode,
      fit: imageWidget.fit,
      alignment: imageWidget.alignment,
      repeat: imageWidget.repeat,
      centerSlice: imageWidget.centerSlice,
      matchTextDirection: imageWidget.matchTextDirection,
      gaplessPlayback: imageWidget.gaplessPlayback,
      isAntiAlias: imageWidget.isAntiAlias,
      filterQuality: imageWidget.filterQuality,
      key: imageWidget.key,
    );

    return InkWell(
      onTap: () {
        showSimpleAlertDialog(context, child);
      },
      child: child,
    );
  }
}
