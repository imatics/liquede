import 'package:flutter/material.dart';

import 'flavor_config.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;

  const FlavorBanner({required this.child});

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  late BannerConfig bannerConfig;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!FlavorConfig.isProduction()){
      bannerConfig ??= _getDefaultBanner();
    Future.delayed(const Duration(milliseconds: 500),(){
      // _buildBanner(context, bannerConfig);
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color
    );
  }


}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({
    required this.bannerName,
    required this.bannerColor}
    );
}


void _buildBanner(BuildContext context, BannerConfig bannerConfig) {
  return Overlay.of(context)!.insert(
    OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      print(size.width);
      return Positioned(
        width: size.width,
        height: 25,
        top: 20,
        left: 0,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => null,
            child:CustomPaint(
              painter: BannerPainter(
                  message: bannerConfig.bannerName,
                  textDirection: Directionality.of(context),
                  layoutDirection: Directionality.of(context),
                  location: BannerLocation.topStart,
                  // color: bannerConfig.bannerColor
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   child: Text(FlavorConfig.instance.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),),
            //   decoration: BoxDecoration(color: FlavorConfig.instance.color),
            // ),
          ),
        ),
      );
    }),
  );
}
