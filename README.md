# CameraRoll
![facebook_cover_photo_1](https://user-images.githubusercontent.com/55185591/129035859-00637e5f-e86a-44cf-a2dd-d94323e48aeb.png)

## Requirements: 
1. iOS 14+ / Swift 5.5
2. **Xcode 13 beta**
3. Tuist https://github.com/tuist/tuist

## Build steps:
1. Download project
2. Open folder in terminal
3. Run `tuist generate --open`
4. Build and have fun

## Dependencies:
1. **Tuist** for project generation
2. **Moya** for network communication

## Project description
This is a simple pictures viewer with interface similar to native Photos app.

From a strict user point of view, a camera roll is a vertical list displaying a list of pictures. Nothing more 😁. 

From an engineering standpoint, it’s a scrolling container that should display images as efficiently as possible, using techniques like multi-threading, caching, etc.

It uses https://randomuser.me/ API as a backend for pictures. 

<img width="255" alt="Screenshot 2021-08-11 at 16 22 17" src="https://user-images.githubusercontent.com/55185591/129036416-a26d45bb-fd04-4713-80ef-d4000246c7ef.png">


## Architecture and key technologies

1. **Module architecture** with separate UI and BL targets
  ```
  Please look at Project.swift file for projects's and targets' settings
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
