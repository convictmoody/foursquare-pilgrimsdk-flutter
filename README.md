# Pilgrim SDK for Flutter
This is a Flutter plugin for the Foursquare Pilgrim SDK.

## Getting Started
Add this git as a dependency in `pubspec.yaml` of your Flutter project.
```yaml
dependencies:
  foursquare_pilgrimsdk:
    git: git://github.com/matthewhuie/foursquare-pilgrimsdk-flutter.git
```

Import the package into your project.
```dart
import 'package:foursquare_pilgrimsdk/foursquare_pilgrimsdk.dart';
```

You'll need your JFrog Artifactory and Foursquare API credentials for both Android and iOS libraries.

## Functions
**start**() → void  
Starts the SDK and begins to monitor visits.

**stop**() → void  
Stops the SDK.

**isEnabled** → Future&lt;bool&gt;  
Returns true if the SDK is enabled, false otherwise.

**installId** → Future&lt;String&gt;  
Returns the user's unique install ID.

**visitStream** → Stream&lt;dynamic&gt;  
Returns a Stream, containing visits from the SDK.

**debugInfo** → Future&lt;String&gt;  
Returns debug information from the SDK.

**fireTestVisit**(String confidence, String type, bool isExit) → void  
Fires a test visit to the SDK.

**sendConnectedTestVisit**(String venueId, String confidence, String type, bool isExit) → void  
Sends a test visit to the SDK via Foursquare servers.

## TODO
- [x] Base Flutter project
- [x] Basic Android implementation
- [x] Basic iOS implementation
- [ ] Deeper Android/iOS implementation
- [ ] More documentation
- [ ] Better credentials management
- [ ] Better structure for visit payload from native to Flutter
- [ ] More support for additional methods in Pilgrim 2.0

## Links
- https://enterprise.foursquare.com/pilgrim
- https://developer.foursquare.com/docs/pilgrim-sdk/overview
