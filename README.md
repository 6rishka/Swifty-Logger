# Swifty-Logger
SwiftyLogger is a logging library for iOS applications, that helps you track the application flow.

SwiftyLogger encapsulates multiple logging services into a single global ``` Logger ``` instance which provides an easy-to-use interface (defined in ``` LoggerProtocol ```) for logging events and errors within the application. 

It could be used for both development and in-production purposes such as debugging, analyzing user activity, testing and many other.

## Language
Swift

## Supported Platforms

- iOS

## Supported Platforms Versions

#### iOS
```
iOS 11.0 +
```

## Branches & Releases

- ``` main ``` branch keeps the newest major - stable release.
- ``` stable ``` branch keeps the newest minor - stable release.
- ``` beta ``` branch keeps the newest minor - beta release.

## Installation

#### Swift Package Manager
- In Xcode, open your project and navigate to File → Swift Packages → Add Package Dependency.
- Paste the package repository URL ```https://github.com/grikshka/Swifty-Logger``` and click Next.
- For Rules, select Version - Up to Next Major - ``` 1.0.0 ```.
- Select your target projects and click Finish.

#### Swift Package
```
.package(name: "SwiftyLogger", url: "https://github.com/grikshka/Swifty-Logger/", from: "1.0.0")
```

## Additional Setup

#### Firebase Analytics Logger
- Create and setup Firebase project
- Add GoogleService-Info.plist file to your Xcode project
- Add "-ObjC" flag to your project ( Select your project and target -> Build Settings -> Other Linker Flags -> "+")
- Call FirebaseApp.configure() on application launch

## Dependencies
- [Firebase](https://github.com/firebase/firebase-ios-sdk)

## Usage
```swift
import SwiftyLogger

let logger: LoggerProtocol = Logger.shared
logger.registerServices(.consoleLogger, .firebaseAnalyticsLogger)
logger.log(type: .info, name: "ExampleLog", description: "Example Log Description", parameters: ["SwiftyLoggerVersion": "1.0.0"])
```

