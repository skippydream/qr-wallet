import 'package:flutter/material.dart';
import 'package:qrwallet/utils/custom_icons.dart';
import 'package:qrwallet/utils/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsCard extends StatelessWidget {
  final String description;
  final String url;
  final Image image;
  final String? github;
  final String? playstore;
  final String? linkedin;
  final String? youtube;
  final String? site;
  final String? twitter;
  final String? instagram;
  final String? facebook;
  final Color? rippleColor;

  CreditsCard({
    required this.description,
    required this.url,
    required this.image,
    this.github,
    this.playstore,
    this.linkedin,
    this.youtube,
    this.site,
    this.twitter,
    this.instagram,
    this.facebook,
    this.rippleColor,
  });

  // Launch an url inside the browser (use forceWebView: true for in app launch)
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Globals.borderRadius),
      ),
      elevation: 4,
      child: InkWell(
        splashColor:
            rippleColor != null ? Theme.of(context).splashColor : rippleColor,
        highlightColor:
            rippleColor != null ? Theme.of(context).splashColor : rippleColor,
        borderRadius: BorderRadius.circular(Globals.borderRadius),
        onTap: () {
          // Open the required site
          _launchURL(url);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                description,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CircleAvatar(
                    radius: Globals.avatarRadius + 4,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    child: CircleAvatar(
                      child: ClipOval(child: image),
                      radius: Globals.avatarRadius,
                    ),
                  ),
                  ..._renderLinks(context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Renders and return a max of four links
  List<Widget> _renderLinks(BuildContext context) {
    List<Widget> _links = [];
    var _linksRendered = 0;
    final _iconColor = Theme.of(context).colorScheme.secondaryVariant;
    final _maxLinks = Globals.maxLinksNumber;

    // Github
    if (github != null && github!.isNotEmpty && _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(github!);
          },
          icon: Icon(CustomIcons.github),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // Play Store
    if (playstore != null &&
        playstore!.isNotEmpty &&
        _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(playstore!);
          },
          icon: Icon(CustomIcons.google_play),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // LinkedIn
    if (linkedin != null &&
        linkedin!.isNotEmpty &&
        _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(linkedin!);
          },
          icon: Icon(CustomIcons.linkedin),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // YouTube
    if (youtube != null && youtube!.isNotEmpty && _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(youtube!);
          },
          icon: Icon(CustomIcons.youtube),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // Site
    if (site != null && site!.isNotEmpty && _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(site!);
          },
          icon: Icon(CustomIcons.link),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // Twitter
    if (twitter != null && twitter!.isNotEmpty && _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(twitter!);
          },
          icon: Icon(CustomIcons.twitter),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // Instagram
    if (instagram != null &&
        instagram!.isNotEmpty &&
        _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(instagram!);
          },
          icon: Icon(CustomIcons.instagram),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }
    // Facebook
    if (facebook != null &&
        facebook!.isNotEmpty &&
        _linksRendered < _maxLinks) {
      _linksRendered++;
      _links.add(
        IconButton(
          onPressed: () {
            _launchURL(facebook!);
          },
          icon: Icon(Icons.facebook_rounded),
          iconSize: Globals.linksIconSize,
          color: _iconColor,
        ),
      );
    }

    return _links;
  }
}
