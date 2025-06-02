import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class SuperBarColor {
  Color topBarColor;
  Color botBarColor;
  SuperBarColor({
    this.topBarColor = Colors.white,
    this.botBarColor = Colors.white,
  });

  factory SuperBarColor.defaultValue() {
    return SuperBarColor(
      botBarColor: Colors.transparent,
      topBarColor: Colors.transparent,
    );
  }
}

SuperBarColor defaultSuperBar = SuperBarColor(
  botBarColor: Colors.transparent,
  topBarColor: Colors.transparent,
);

class FlutterSuperScaffold extends StatefulWidget {
  final Widget body;
  final SuperBarColor? superBarColor;
  final Color backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool isTopSafe;
  final bool isBotSafe;
  final bool isResizeToAvoidBottomInset;
  final FloatingActionButton? floatingActionButton;
  final VoidCallback? onWillPop;
  final bool isWillPop;
  const FlutterSuperScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.superBarColor,
    this.backgroundColor = Colors.white,
    this.appBar,
    this.isBotSafe = true,
    this.isTopSafe = true,
    this.isResizeToAvoidBottomInset = true,
    this.onWillPop,
    this.isWillPop = true,
  });

  @override
  State<FlutterSuperScaffold> createState() => _FlutterSuperScaffoldState();
}

class _FlutterSuperScaffoldState extends State<FlutterSuperScaffold>
    with RouteAware {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle();
  SystemUiOverlayStyle androidStyle = const SystemUiOverlayStyle();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
    child: SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: widget.appBar,
        backgroundColor: widget.backgroundColor,
        floatingActionButton: widget.floatingActionButton,
        resizeToAvoidBottomInset: widget.isResizeToAvoidBottomInset,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  if (widget.isTopSafe) {
                    if (widget.superBarColor != null) {
                      return topPadding(widget.superBarColor!.topBarColor);
                    } else {
                      return topPadding(Colors.transparent);
                    }
                  } else {
                    return Container();
                  }
                },
              ),
              Expanded(child: widget.body),
              Builder(
                builder: (context) {
                  if (widget.isBotSafe) {
                    if (widget.superBarColor != null) {
                      return topPadding(widget.superBarColor!.botBarColor);
                    } else {
                      return topPadding(Colors.transparent);
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget topPadding(Color color) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).padding.top,
      color: color,
    );
  }

  Widget botPadding(Color color) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).padding.bottom,
      color: color,
    );
  }
}
