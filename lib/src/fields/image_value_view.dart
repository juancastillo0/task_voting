import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/sample_feature/sample_item.dart';
import 'package:cross_file/cross_file.dart';

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

  @override
  void initState() {
    setUpFile();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ImageValueView oldWidget) {
    super.didUpdateWidget(oldWidget);
    setUpFile();
  }

  void setUpFile() async {
    final handle = widget.image.file;
    if (handle == null) {
      file = widget.image.xFile;
    } else {
      final file = await handle.getFile();
      if (mounted && handle == widget.image.file) {
        setState(() {
          this.file = file;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider provider;
    if (widget.image.url != null) {
      final url = widget.image.url!;
      if (url.startsWith('assets')) {
        provider = AssetImage(url);
      } else {
        provider = NetworkImage(url);
      }
    } else {
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
