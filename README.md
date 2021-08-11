# Attention ⚠️
## Development is in progress
## Features in development:
1. Image loader component will be updated 
2. API loading
3. Lazy VGrid with photos 

# CameraRoll
![facebook_cover_photo_1](https://user-images.githubusercontent.com/55185591/129035859-00637e5f-e86a-44cf-a2dd-d94323e48aeb.png)
                          <sub><sup>this logo was generated with https://hatchful.shopify.com</sup></sub>

## Requirements: 

<img width="15" alt="swift" src="https://developer.apple.com/swift/images/swift-og.png">  iOS 14+ / Swift 5.5

<img width="15" alt="xcode" src="https://upload.wikimedia.org/wikipedia/ru/0/0c/Xcode_icon.png">  **Xcode 13 beta**

<img width="15" alt="tuist" src="https://docs.tuist.io/img/logo.svg">  Tuist https://github.com/tuist/tuist

## Build steps:
1. Download project
2. Open folder in terminal
3. Run `tuist generate --open`
4. Build and have fun

## Dependencies:
1. **Tuist** for project generation
2. **Moya** for network communication
3. **Localize_Swift and SwiftDate** just in case
<img width="653" alt="graph" src="https://user-images.githubusercontent.com/55185591/129069101-389e4546-a613-4755-bd9f-0c89ad351bf7.png">


## Project description
This is a simple pictures viewer with interface similar to native Photos app.

From a strict user point of view, a camera roll is a vertical list displaying a list of pictures. Nothing more 😁. 

From an engineering standpoint, it’s a scrolling container that should display images as efficiently as possible, using techniques like multi-threading, caching, etc.

It uses https://randomuser.me/ API as a backend for pictures. 

<img width="255" alt="Screenshot 2021-08-11 at 16 22 17" src="https://user-images.githubusercontent.com/55185591/129036416-a26d45bb-fd04-4713-80ef-d4000246c7ef.png">


## Architecture and key technologies

1. **Modular architecture** with separate UI and BL targets

  Please look at [Project.swift](https://github.com/vlad-mr/CameraRoll/blob/dev/Project.swift) file for projects's and targets' settings.
  
  Or run `tuist graph` to see project graph.
  
  ```
  Project structure:
  
                +-------------+
                |             |
                |     App     | Contains CameraRoll App target and CameraRoll unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |
 |          |                   |           |
 +----------+                   +-----------+
```


2. **MVVM + Coordinators** for presentation layer
4. **Swift UI and Combine** for fun and reactive development

## Thanks, you guys are awesome
1. [Rohit Mehta](mailto:rohit.mehta@freshii.com) for sweet design ideas
2. https://randomuser.me/ for photos
3. https://hatchful.shopify.com for logos
4. https://appicon.co for icons generation
