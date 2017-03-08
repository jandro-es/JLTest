# JLTest

**JLTest** is a simple test application using `John Lewis` api.

## Dependencies

JLTest uses **Cocoapods** to handle dependencies. After cloning the repository please execute the following command in the terminal:

```bash
pod install
```

The dependencies used and their purpose:

* **Firebase** for analytics.
* **Fabric** and **Crashlytics** for crash reporting.
* **Alamofire** as a network wrapper.
* **AlamofireImage** for loading remote images.
* **SwiftLint** for handling codebase consistency.

## Build

After fetching the dependencies open in `XCode` the file **JLTest.xcworkspace** and build it as any other project.

## Assumptions

* It's only compatible with devices on iOS 9 or superior.
* No user error handling has been implemented, TODO markers where it should go.
* No offline usage implemented.
