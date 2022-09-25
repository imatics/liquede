
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquede/main.dart';
import 'package:provider/provider.dart';
import 'package:liquede/commons/reusables.dart';
import 'package:liquede/extensions/widget.dart';
import 'package:liquede/services/network_service_state.dart';
import 'constants.dart';

class BaseScaffold extends StatefulWidget {
  late final PreferredSizeWidget? baseAppBar;
  late final Widget? baseBody;
  late final List<Widget>? trailing;
  late final String? title;
  late final bool networkSateAware;
  late final bool removeAppbar;
  late final bool implyLeading;
  late final bool withBackground;
  late final Function(bool) onNetworkStateChange;
  late final BuildContext context;
  late final Widget? bottomBar;
  late final Widget? floatingActionButton;
  late final Widget? drawer;


   BaseScaffold(
      {this.baseAppBar,
        this.baseBody,
        this.trailing,
        this.title,
        this.removeAppbar = false,
        this.withBackground = true,
        this.networkSateAware = true,
        this.bottomBar,
        this.floatingActionButton,
        this.drawer,
        this.implyLeading = true,
        required this.context});

  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State<BaseScaffold> {
  bool showTopBar = false;
  bool lastState = false;

  @override
  void initState() {
    super.initState();
    showTopBar = !networkState.networkActive && widget.networkSateAware;
    if(BaseWidgetState.getInstance(context).isOverlayShowing) {
      BaseWidgetState.getInstance(context).isOverlayShowing = false;
    }}


  late OverlayEntry _menuOverlay;

  OverlayEntry _buildMenuOverlay() {
    return OverlayEntry(
      builder: (context) {
          return Consumer<NetworkServiceState2>(
            builder: (context, networkState, _) {
              return Positioned(
                top: (Theme.of(context).platform == TargetPlatform.android)?50:80,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  child: SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: AnimatedContainer(
                      onEnd: (){
                        if(networkState.networkActive){
                          closeOverlayMenu();
                        }
                        //
                      },
                      color: (networkState.networkActive && widget.networkSateAware)
                          ? Colors.green[800]
                          : Colors.red[700],
                      duration:const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      height: showTopBar ? 20 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.signal_cellular_connected_no_internet_4_bar,
                            color: white,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          getText(
                              networkState.networkActive
                                  ? "Connection restored"
                                  : "No Internet connection",
                              color: white,
                              w: FontWeight.w400,
                              size: 11),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        },);
  }


  bool isNetWorkOverlayOpen = false;
  void openNetworkOverlay() {
    if (isNetWorkOverlayOpen) {
      Overlay.of(context)!.setState(() {
      });
      return;
    }

    if(!widget.removeAppbar){
      closeOverlayMenu();
      return;
    }

    _menuOverlay = _buildMenuOverlay();
    Overlay.of(context)!.insert(_menuOverlay);
    isNetWorkOverlayOpen = true;
  }

  void closeOverlayMenu() {
    print("good bye");
    try {
      _menuOverlay.remove();
      isNetWorkOverlayOpen = false;
    } catch (e) {
      print(e);
    }
    // setState(() {
    // });
  }


  Widget getNetWorkNotifierWidget(NetworkServiceState2 state){
    return  AnimatedContainer(
      color: (state.networkActive)
          ? Colors.green[700]
          : Colors.red[700],
      duration:const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      height: showTopBar ? 20 : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration:const Duration(milliseconds: 500),
            opacity: showTopBar ? 1 : 0,
            child: const Icon(
              Icons.signal_cellular_alt_sharp,
              color: white,
              size: 13,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          getText(
              state.networkActive
                  ? "Internet Connection restored"
                  : "Internet Connection Error",
              color: white,
              w: FontWeight.w400,
              size: 11),
        ],
      ),
    );
  }

  Widget getOverlayWidget(BaseWidgetState widgetState){
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: Consumer<BaseWidgetState>(
        builder: (context,state, child) => SizedBox(
          height: 150,
          width: 150,
          child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: buildLoaderStatusWidget(widgetState.status).center),
        ),
      ),
    );
  }

  Widget buildLoaderStatusWidget(OverlayStatus status){
    switch(status){
      case OverlayStatus.normal: return appLoadingWidget;
      case OverlayStatus.success: return appLoadingWidget;
      case OverlayStatus.error: return appLoadingWidget;
    }
  }


  Widget getWidgetBody(BaseWidgetState state){
    return Stack(
      children: [
        // widget.withBackground?Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   // decoration: BoxDecoration(
        //   //   image: DecorationImage(image: AssetImage("background".imagePng), fit: BoxFit.cover)
        //   // ),
        // ):
        //
       // const SizedBox(),
        widget.baseBody??const SizedBox(),
        state.isOverlayShowing
            ? getOverlayWidget(state)
            : const SizedBox()
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer2<NetworkServiceState2, BaseWidgetState>(
      builder: (context, networkState, baseWidgetState, _) {
        _showBar(networkState.networkActive);
        return WillPopScope(
          onWillPop: ()async {
            if(baseWidgetState.isOverlayShowing) {
              await Future.delayed(const Duration(milliseconds: 500));
              baseWidgetState.isOverlayShowing = false;
              await Future.delayed(const Duration(milliseconds: 500));
            }
            return true;
          },
          child: BaseScaffoldWidget(
            title: widget.title,
            baseBody: widget.removeAppbar?Stack(
              children: [
                getWidgetBody(baseWidgetState),
                Container(
                    transform: Matrix4.translationValues(0, 60, 0),
                    child: getNetWorkNotifierWidget(networkState))
              ],
            ): Column(
              children: [
               getNetWorkNotifierWidget(networkState),
                Expanded(
                  child:getWidgetBody(baseWidgetState),
                ),
              ],
            ),
            context: widget.context,
            trailing: widget.trailing,
            baseAppBar: widget.baseAppBar,
            removeAppBar: widget.removeAppbar,
            bottomAppBar: widget.bottomBar,
            fab: widget.floatingActionButton,
            mDrawer: widget.drawer,
            implyLeading: widget.implyLeading,
          ),
        );
      },
    );
  }

  void _showBar(bool b) {
    if (b != lastState) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        lastState = b;
        if(mounted) {
          setState(() {
            showTopBar = !b;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    if(mounted){
      if(BaseWidgetState.getInstance(context).isOverlayShowing) {
      BaseWidgetState.getInstance(context).isOverlayShowing = false;
    }
    }
    super.dispose();
  }
}

class BaseScaffoldWidget extends Scaffold {
  final PreferredSizeWidget? baseAppBar;
  final Widget? baseBody;
  final List<Widget>? trailing;
  final String? title;
  final bool showBottomNav;
  final bool removeAppBar;
  final bool implyLeading;
  final BuildContext? context;
  final Widget? bottomAppBar;
  final Widget? fab;
  final Widget? mDrawer;

  BaseScaffoldWidget(
      {Key? key, this.baseAppBar,
        this.baseBody,
        this.context,
        this.showBottomNav = true,
        this.removeAppBar = false,
        this.implyLeading = true,
        this.title,
        this.bottomAppBar,
        this.fab,
        this.mDrawer,
        this.trailing}) : super(key: key) {
    assert(context != null, "context can not be null");
  }

  @override
  // TODO: implement resizeToAvoidBottomInset
  bool? get resizeToAvoidBottomInset => false;

  @override
  // TODO: implement appBar
  PreferredSizeWidget? get appBar => removeAppBar?null:baseAppBar
      ??
      AppBar(
        title: getText(title ?? "", w: FontWeight.bold, size: 16),
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: implyLeading,
        actions: trailing,
      );


  @override
  // TODO: implement body
  Widget get body => SafeArea(top: false, bottom: true, child: baseBody!);

  @override
  // TODO: implement body
  Widget? get floatingActionButton => fab;



  @override
  // TODO: implement extendBodyBehindAppBar
  bool get extendBodyBehindAppBar => false;
  // @override
  // FloatingActionButtonLocation? get floatingActionButtonLocation => FloatingActionButtonLocation.endDocked; //specify the location of the FAB

  @override
  Widget? get bottomNavigationBar => bottomAppBar;



  @override
  // TODO: implement drawer
  Widget? get drawer => mDrawer;

}


