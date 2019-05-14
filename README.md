# Relieve

[![CI Status](https://img.shields.io/travis/alexanderkorus/Relieve.svg?style=flat)](https://travis-ci.org/alexanderkorus/Relieve)
[![Version](https://img.shields.io/cocoapods/v/Relieve.svg?style=flat)](https://cocoapods.org/pods/Relieve)
[![License](https://img.shields.io/cocoapods/l/Relieve.svg?style=flat)](https://cocoapods.org/pods/Relieve)
[![Platform](https://img.shields.io/cocoapods/p/Relieve.svg?style=flat)](https://cocoapods.org/pods/Relieve)

Relieve is a personal toolset and for swift development which I integrate into my projects to avoid having to rewrite recurring programming tasks.
This library contains different classes, helpers and extensions which were developed by me and other different developers. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Relieve is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Relieve'
```

## Installing Xcode templates

* Ensure there is a path to ~/Library/Developer/Xcode/Templates/File Templates/, if not execute the following command in the Terminal:
```
mkdir ~/Library/Developer/Xcode/Templates ~/Library/Developer/Xcode/Templates/File\ Templates ~/Library/Developer/Xcode/Templates/File\ Templates/Relieve
```

* Copy the templates to the following directory
```
cp -r Templates/* ~/Library/Developer/Xcode/Templates/File\ Templates/Relieve
```

## To do Relieve Library
- CGFloat Round to(places)
- Realm?
- Activity Indicator 
- ~~Kotlin like let / apply~~
- Defaut TabBarCoordinator, TabCoordiantor, ... with configureable TabBar and default implementations
- Default View Controller Implementations / Protocol 
- Generate Boilerplate Project & File Templates (seperate project?)
- Localization
- Locale (current locale)
- Add enum with different format strings: https://nsdateformatter.com
- TableView Empty State 

## To Do Sample App
- Add realm 
- Diffing
- Documentation (RxSwift, Coordinator Pattern)

## Author

Alexander Korus, alexander.korus@svote.io

## License

Relieve is available under the MIT license. See the LICENSE file for more info.
