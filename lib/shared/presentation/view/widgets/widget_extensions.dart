import 'package:flutter/widgets.dart';

extension WidgetExtensions <T extends Widget> on T
{
  Widget visibleIf(bool Function() block)
  {
    if(block())
    {
      return this;
    }
    else
    {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }

  Widget setVisible(bool isVisible)
  {
    if(isVisible) {
      return this;
    }
    else {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
