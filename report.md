---
title: Advanced Programming for Mobile Devices - Software Report
author: James Donohue - <james.donohue@bbc.co.uk>
---

# Abstract


# Introduction

This software report accompanies the completed iOS app _FindMyBike_. It continues some of the discussion begun in the proposal already submitted.

The Xcode source code for _FindMyBike_ can be found in the zip file provided with this document.

## Specifications

The development environment used for the app adheres to the requirements of the assignment brief:

- Xcode 8
- Swift 3.1
- iOS 10.3 SDK
- Platforms: iPhone 6 and later (iOS simulator or physical device)

The following Apple frameworks were used in building the application:

- [CoreLocation](https://developer.apple.com/documentation/corelocation)
- [CoreBluetooth](https://developer.apple.com/documentation/corebluetooth)
- [UserNotifications](https://developer.apple.com/documentation/usernotifications)
- [UIKit](https://developer.apple.com/documentation/uikit)
- [Foundation](https://developer.apple.com/documentation/foundation)

No other third-party libraries or frameworks were used.

# User guide

TBC

## Evaluation

A key goal in the design of the application was simplicity and clarity. The Apple Human Interface Guidelines [-@hig] state that 'clarity' is one of the themes that differentiates iOS from other platforms, defining it in terms of legibility of text and 'a sharpened focus on functionality'.

One example of applying this theme in practice is the content and layout of the cells in the main table view. Rather than specifying a particular size and weight for the text in the `UILabel` components, predefined iOS text styles of 'Headline' and 'Subhead' were used. This enables the platform's Dynamic Type mechanism to respond to user preferences and accessibility settings [@textprogramming] and thereby ensure legibility.

*TODO: add figure?*

The principle also applies to the choice of what level of detail is appropriate for each level of navigation. For example, the table view cells could have included the iBeacon settings for each bike (UUID, major and minor) but this would have created a more cluttered user interface without adding much value. Instead it was decided to only show these values when the user actually edits their bike details.

Another usability factor that was considered was discoverability, meaning the level to which a new user can determine what actions can be performed and how to perform them. The right chevron displayed alongside the 'My Bike' cell is used as a visual hint that the user can tap the cell in order to view more information. The chevron (known as a 'disclosure indicator' in iOS parlance) signals what Norman [@norman] terms an 'affordance', namely the ability to access a more detailed view. Note that while other ways of signalling this affordance are possible, by using the convention of the standard table view disclosure indicator, the user can apply the knowledge they have learned from using other iOS apps. This relates to the stated Apple design principle of 'consistency', specificaly that an app should implement "familiar standards and paradigms by using system-provided interface elements" [@hig].

## Development issues

### Delegation

The classes provided by the Cocoa frameworks make extensive use of the _delegation_ pattern "in which one object in a program acts on behalf of, or in coordination with, another object" [@delegation]. This is in contrast to a model where behaviour is inherited (and may be overridden) from class to subclass. Inheritance in object-oriented programming creates a tight coupling between a parent class and its subclass and breaks encapsulation, whereas composition enforces a 'black box' approach based on well-defined interfaces, and is therefore usually preferred [@gangoffour].

Although delegation allows complex behaviours to be composed dynamically at run time, one price (as Gamma et. al highlight, p.21) is that it make code harder to understand. This is evidenced in the app in the relationship between `MainViewController`, `RangingTableViewController` and `EditBikeController`. Since these classes only maintain a weak reference to an instance of the user's bike, for it to be persisted it must be passed "up" through two levels of composition to the `BikeRegistry` class, via the `BikeChangedDelegate` protocol. If the app evolved to include a large number of additional controllers this approach could become excessively complex.

## Marketing

### Network effects

There are two, slightly different features offered by _FindMyBike_:

- it allows a user to detect their proximity to their own bike, and therefore may allow them to locate it (for example, if they have forgotten where they parked it).
- it allows users to know if their missing bike has been detected by other users of the app, and therefore possibly recover it in the event of theft

The first feature above does not depend on any other app users. However, the effectiveness of the second feature is dependent on the number of users with the app installed that frequent the area of the missing bike. This feature is likely to be more useful in densely-populated areas (if a missing bike is in a desert, it is unlikely that many app users will enter its beacon region). But even if a large city, the usefulness of this feature is in proportion to the number of active app users. Each new user that installs the app in a densely-populated area increases the value of the app for other users, a phenomenon known as a 'positive network externality'[@shapiro], or network effect, which was first observed in communication technologies.

Aquiring enough users for this network effect to apply can be seen as a 'chicken-and-egg' problem. One way of resolving it is to ensure that the 'single-user' benefits are compelling enough if there are no other users of the network [@choudary]. By marketing the app's 'single-user' benefits first, it is hoped that enough users will start to use it that the second use becomes viable and eventually becomes more compelling than the 'single-user' mode.

With this in mind, a plan for developing the app further should include building additional features that support the 'single-user' mode, for example:

- Allowing the user to store other useful details about their bike, such as engine number or vehicle identification number (VIN), which may be useful in the event of reporting a theft to the police
- Store details of the user's breakdown recovery service contact number and membership number (AA, RAC, etc.)
- Allow the user to record important dates relating to their bike, such as MOT date or insurance expiry date, which could trigger a local notification when the date approaches.

### Promotion

# References
