# <img width="23" alt="icon" src="https://user-images.githubusercontent.com/55185591/129075248-daddfb8a-e382-49e7-8c21-fdef1dec763f.png"> CameraRoll
![facebook_cover_photo_1](https://user-images.githubusercontent.com/55185591/129035859-00637e5f-e86a-44cf-a2dd-d94323e48aeb.png)
<sub><sup>this logo was generated with https://hatchful.shopify.com ⤴️</sup></sub>

## Requirements: 

<img width="15" alt="swift" src="https://developer.apple.com/swift/images/swift-og.png">  iOS 14+ / Swift 5.5

<img width="15" alt="xcode" src="https://upload.wikimedia.org/wikipedia/ru/0/0c/Xcode_icon.png">  **Xcode 13 beta**

<img width="15" alt="tuist" src="https://docs.tuist.io/img/logo.svg">  Tuist https://github.com/tuist/tuist

## Build steps:
1. Download project
2. Open folder in **Terminal**
3. Run `tuist generate --open`
4. Select your **dev team (for all targets)** before building for Device, no additional work for Simulator
5. Build with **Xcode** or `tuist build` and have fun
6. <sub>If you see issue with file permisions run `chmod +x swiftlint.sh`</sub>

## Dependencies:
1. **Tuist** for project generation
2. **SPM** for obvious things
3. **Moya** for network communication
4. **Localize_Swift, PartialSheet and SwiftDate** just in case


## Project description
This is a simple pictures viewer with interface similar to native Photos app.

From a strict user point of view, a camera roll is a vertical list displaying a list of pictures. Nothing more 😁. 

From an engineering standpoint, it’s a scrolling container that should display images as efficiently as possible, using techniques like multi-threading, caching, etc.

It uses https://randomuser.me/ API as a backend for pictures. 


https://user-images.githubusercontent.com/55185591/129115906-f4956140-4682-48b4-9842-439bb6229039.mov



## Architecture and key technologies

1. **Modular architecture** with separate UI and BL targets

  Please look at [Project.swift](https://github.com/vlad-mr/CameraRoll/blob/dev/Project.swift) file for project's and targets' settings.
  
  Or run `tuist graph` to see project graph.
  
  ![graph](https://user-images.githubusercontent.com/55185591/129115294-8cc28098-6b62-4533-b1be-8dbee079a2fc.png)


2. **MVVM + Coordinators** for presentation layer
4. **Swift UI and Combine** for fun and reactive programming

## Thanks, you guys are awesome
1. [Rohit Mehta](mailto:rohit.mehta@freshii.com) for sweet design ideas
2. https://randomuser.me/ for photos
3. https://hatchful.shopify.com for logos
4. https://appicon.co for icons generation

# Attention ⚠️
## Development is in progress
## Features in development:

🔜 Person details

🔜 Favourites

🔜 Albums

🔜 Search favourites by name, email, etc.

❔ Unit tests
