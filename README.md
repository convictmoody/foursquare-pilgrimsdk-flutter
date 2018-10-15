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
| Function | Description |
| --- | --- |
| void *start*() | Starts the SDK and begins to monitor visits |
| void *stop*() | Stops the SDK |
| Future<bool> get *isEnabled* | Returns true if the SDK is enabled, false otherwise |
| Future<String> get *installId* | Returns the user's unique install ID |
| Future<String> get *debugInfo* | Returns debug information from the SDK |
| void *fireTestVisit*(String confidence, String type, bool isExit) | Fires a test visit to the SDK |
| void *sendConnectedTestVisit*(String venueId, String confidence, String type, bool isExit) | Sends a test visit to the SDK via Foursquare servers |
| Stream<dynamic> get *visitStream* | Returns a Stream of visits from the SDK |

## TODO
- [x] Base Flutter project
- [x] Android implementation
- [ ] iOS implementation
- [ ] Better credentials management
- [ ] Better structure for visit payload from native to Flutter
- [ ] More support for additional methods in Pilgrim 2.0

## Links
- https://enterprise.foursquare.com/pilgrim
- https://developer.foursquare.com/docs/pilgrim-sdk/overview
