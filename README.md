# PBImageView

[![Version](https://img.shields.io/cocoapods/v/PBImageView.svg?style=flat)](http://cocoapods.org/pods/PBImageView)
[![License](https://img.shields.io/cocoapods/l/PBImageView.svg?style=flat)](http://cocoapods.org/pods/PBImageView)
[![Platform](https://img.shields.io/cocoapods/p/PBImageView.svg?style=flat)](http://cocoapods.org/pods/PBImageView)

A UIImageView alternative that allows for animations between contentModes.

![Sample Animation](https://github.com/patrickbdev/PBImageView/raw/master/Images/ExampleAnimation.gif)

## Usage

The API for PBImageView is exactly the same as a UIImageView.
To animate the contentMode just wrap it in a UIView animation block.

```swift
let imageView = PBImageView(image: UIImage(named: "pineapple"))
imageView.contentMode = .scaleAspectFill

UIView.animate(withDuration: 1) {
    imageView.contentMode = .scaleAspectFit
}
```

### Storyboard Use

PBImageView subclasses UIView, not UIImageView. To use it in a storyboard place a UIView and set the `Class` and `Module` to `PBImageView`

![Storyboard Class/Module](https://github.com/patrickbdev/PBImageView/raw/master/Images/StoryboardClassModule.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8
* Swift 3.0

## Installation

PBImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PBImageView"
```

## Author

patrickbdev, patbdev@gmail.com

## License

PBImageView is available under the MIT license. See the LICENSE file for more info.
