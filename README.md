# Geo

Working with CGRects and points can be tedious. Hopefully this lib will make it a little better.

Eventually I'll put other geometry helper tools for iOS and macOS in here as well.

## Installation
### Carthage
-   Create a Cartfile in the root of your project with the following contents:
    ```yaml
    github "dylan/geo"
    ```
-   Run the following:
    ```
    $ carthage bootstrap
    ```


## Usage
```swift
let rect2 = CGRect(x: 80, y: 80, width: 30, height: 30)                 // {x 80 y 80 w 30 h 30}
let rect1 = CGRect(x: 10, y: 10, width: 15, height: 15)                 // {x 10 y 10 w 15 h 15}
rect1.topLeft.cgPoint                                                   // {x 10 y 10} 
rect1.bottomRight.cgPoint                                               // {x 25 y 25}
rect1.align(rect1.topLeft, to: rect2.bottomRight)                       // {x 110 y 110 w 15 h 15}
```
