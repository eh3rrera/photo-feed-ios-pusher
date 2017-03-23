# photo-feed—iospusher

iOS app that shows photos in a feed in realtime from a [Raspberry Pi Python process](https://github.com/eh3rrera/picamera-pusher) using Pusher.

# Requirements

- Xcode 8
- [Pusher account](https://pusher.com/signup)

# Installation
1. Clone this repository and `cd` into it.
2. Execute `open photo-feed-ios.xcworkspace` to open the project in Xcode.
3. Replace your Pusher app key in the `ViewController.swift` file
4. Run the project in the simulator and execute the [Python process](https://github.com/eh3rrera/picamera-pusher) or use the [Pusher Debug Console on your dashboard](http://dashboard.pusher.com/) to start sending photos.

# License
MIT
