import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UiKitBlockEmpty extends StatelessWidget {
  const UiKitBlockEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Icon(Icons.hourglass_empty, size: 50, color: Colors.grey[300]),
          UiKitText(AppLocalizations.of(context)?.listIsEmpty ?? '', color: Colors.grey[300]),
          Expanded(child: Container()),
        ],
      ),
    );
  }

}