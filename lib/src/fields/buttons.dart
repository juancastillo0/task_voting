import 'package:task_voting/src/fields/prelude.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.size,
  }) : super(key: key);

  final VoidCallback? onTap;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (onTap == null) {
      color = Theme.of(context).iconTheme.color?.withOpacity(0.3);
    }
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
