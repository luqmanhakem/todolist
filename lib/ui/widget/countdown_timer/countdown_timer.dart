import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

/// A Countdown.
/// 
/// Clone from https://github.com/wuweijian1997/FlutterCountdownTimer
class CountdownTimer extends StatefulWidget {
  final bool isCompleted;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final int endTime;
  final String defaultDays;
  final String defaultHours;
  final String defaultMin;
  final String defaultSec;
  final String daysSymbol;
  final String hoursSymbol;
  final String minSymbol;
  final String secSymbol;
  final TextStyle textStyle;
  final TextStyle daysTextStyle;
  final TextStyle hoursTextStyle;
  final TextStyle minTextStyle;
  final TextStyle secTextStyle;
  final TextStyle daysSymbolTextStyle;
  final TextStyle hoursSymbolTextStyle;
  final TextStyle minSymbolTextStyle;
  final TextStyle secSymbolTextStyle;
  final void Function() onEnd;
  final Widget emptyWidget;
  static final Widget _defaultEmptyWidget = const Center(
    child: Text(
      'Expired',
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
    ),
  );

  CountdownTimer({
    Key key,
    this.isCompleted,
    this.startDateTime,
    this.endDateTime,
    this.endTime,
    this.defaultDays = "--",
    this.defaultHours = "--",
    this.defaultMin = "--",
    this.defaultSec = "--",
    this.daysSymbol = "天",
    this.hoursSymbol = ":",
    this.minSymbol = ":",
    this.secSymbol = "",
    this.textStyle,
    this.daysTextStyle,
    this.hoursTextStyle,
    this.minTextStyle,
    this.secTextStyle,
    this.daysSymbolTextStyle,
    this.hoursSymbolTextStyle,
    this.minSymbolTextStyle,
    this.secSymbolTextStyle,
    this.onEnd,
    emptyWidget,
  })  : this.emptyWidget = emptyWidget ?? _defaultEmptyWidget,
        super(key: key);
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountdownTimer> {
  DiffDate diffDate;
  Timer _diffTimer;
  final defaultTextStyle = TextStyle(fontSize: 20);

  DiffDate getDateData() {
    int diff;
    // int additionalHour;

    if (widget.endTime == null) return null;

    // Hold timer if havent start date
    if (DateTime.now().isBefore(widget.startDateTime)) {
      //print('not yet');

      // additionalHour =
      //     widget.endDateTime.difference(widget.startDateTime).inHours;
      // print(additionalHour);

      diff = ((widget.endTime - widget.startDateTime.millisecondsSinceEpoch) /
              1000)
          .floor();
    } else {
      diff = ((widget.endTime - DateTime.now().millisecondsSinceEpoch) / 1000)
          .floor();
    }

    if (diff < 0) {
      return null;
    }
    int days, hours, min, sec = 0;
    if (diff >= 86400) {
      days = (diff / 86400).floor();
      diff -= days * 86400;
    } else {
      // if days = -1 => Don't show;
      days = -1;
    }
    if (diff >= 3600) {
      hours = (diff / 3600).floor();
      diff -= hours * 3600;
    } else {
//      hours = days == -1 ? -1 : 0;
      hours = 0;
    }
    if (diff >= 60) {
      min = (diff / 60).floor();
      diff -= min * 60;
    } else {
//      min = hours == -1 ? -1 : 0;
      min = 0;
    }
    sec = diff.toInt();

    if (days >= 1) {
      for (int i = 0; i <= days; i++) {
        hours += 24;
      }
    }

    return DiffDate(days: days, hours: hours, min: min, sec: sec);
  }

  @override
  void initState() {
    timerDiffDate();
    super.initState();
  }

  timerDiffDate() {
    DiffDate data = getDateData();
    if (data != null) {
      setState(() {
        diffDate = data;
      });
    } else {
      return null;
    }
    disposeDiffTimer();
    const period = const Duration(seconds: 1);
    _diffTimer = Timer.periodic(period, (timer) {
      //到时回调
      DiffDate data = getDateData();
      if (data != null) {
        setState(() {
          diffDate = data;
        });
        checkDateEnd(data);
      } else {
        disposeDiffTimer();
      }
    });
  }

  @override
  void dispose() {
    disposeDiffTimer();
    super.dispose();
  }

  disposeDiffTimer() {
    _diffTimer?.cancel();
    _diffTimer = null;
  }

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    if (oldWidget.endTime != widget.endTime) {
      timerDiffDate();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _items(),
    );
  }

  _getTextStyle(textStyle) {
    return textStyle ?? widget.textStyle ?? defaultTextStyle;
  }

  _items() {
    List<Widget> list = [];
    if (diffDate == null) {
      list.add(widget.emptyWidget);
      return list;
    }

    if (widget.isCompleted) {
      // Show done
      list.add(Text(
        'N/A',
        style: _getTextStyle(widget.hoursTextStyle),
      ));
      return list;
    }

    if (diffDate.hours != -1) {
      var hours = _getNumberAddZero(diffDate.hours);
      list.add(Text(
        '${hours ?? widget.defaultHours}',
        style: _getTextStyle(widget.hoursTextStyle),
      ));
      list.add(Text(
        widget.hoursSymbol,
        style: _getTextStyle(widget.hoursSymbolTextStyle),
      ));
    }
    if (diffDate.min != -1) {
      var min = _getNumberAddZero(diffDate.min);
      list.add(Text(
        '${min ?? widget.defaultMin}',
        style: _getTextStyle(widget.minTextStyle),
      ));
      list.add(Text(
        widget.minSymbol,
        style: _getTextStyle(widget.minSymbolTextStyle),
      ));
    }
    return list;
  }

  String _getNumberAddZero(int number) {
    if (number == null) {
      return null;
    }
    if (number < 10) {
      return "0" + number.toString();
    }
    return number.toString();
  }

  void checkDateEnd(DiffDate data) {
    if (data.days == -1 && data.hours == 0 && data.min == 0 && data.sec == 0) {
      widget.onEnd();
      disposeDiffTimer();
    }
  }
}

class DiffDate {
  final int days;
  final int hours;
  final int min;
  final int sec;

  DiffDate({this.days, this.hours, this.min, this.sec});
}
