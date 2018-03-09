# photo-feed—iospusher

iOS app that shows photos in a feed in realtime from a [Raspberry Pi Python process](https://github.com/eh3rrera/picamera-pusher) using Pusher.

You can follow the [tutorial](https://pusher.com/tutorials/photo-feed-swift-raspberrypi/) to build this application or jump straight to the code.

## Getting Started
1. Clone this repository and `cd` into it.
2. Execute `open photo-feed-ios.xcworkspace` to open the project in Xcode.
3. Replace your Pusher app key in the `ViewController.swift` file
4. Run the project in the simulator and execute the [Python process](https://github.com/eh3rrera/picamera-pusher) or use the [Pusher Debug Console on your dashboard](http://dashboard.pusher.com/) to start sending photos.

### Prerequisites

- Xcode 8
- [Pusher account](https://pusher.com/signup)

## Built With

* [Pusher](https://pusher.com/) - APIs to enable devs building realtime features
* [Xcode](https://developer.apple.com/xcode/) - Includes everything you need to create apps for iPhone, iPad, Mac, Apple Watch, and Apple TV.

## Acknowledgments

* Thanks to [Pusher](https://pusher.com/) for sponsoring this tutorial.

## License
MIT
