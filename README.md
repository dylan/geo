# Geo

Working with CGRects and points can be tedious. Hopefully this lib will make it a little better.

Eventually I'll put other geometry helper tools for iOS and macOS in here as well.

**Note**
Whenever you see "top" or "bottom" Geo will be attempting to figure out the "top" based on how the rect
would be displayed on screen. Regardless of whether or not the context is flipped. #DontSweatTheOriginsMan

## Installation
Copy the ```Geo``` folder into your project.

### Coming soon, Carthage.

## Usage
```swift
let rect2 = CGRect(x: 80, y: 80, width: 30, height: 30)                 // {x 80 y 80 w 30 h 30}
let rect1 = CGRect(x: 10, y: 10, width: 15, height: 15)                 // {x 10 y 10 w 15 h 15}
rect1.topLeft.point                                                     // {x 10 y 10} 
rect1.bottomRight.point                                                 // {x 25 y 25}
rect1.align(rect1.topLeft, to: rect2.bottomRight)                       // {x 110 y 110 w 15 h 15}
```
