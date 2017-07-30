---
title: Advanced Programming for Mobile Devices - Proposal
author: James Donohue - <james.donohue@bbc.co.uk>
---

# Aims

## Overview

This proposal is for an iOS mobile application ('app') which enables owners of motorcycles and scooters 'crowdsource' the location of their vehicle in the event of them going missing using a combination of Bluetooth Low Energy (BLE) beacons and the Global Positioning System (GPS).

## Context

Thefts of motorcycles and scooters are growing sharply. Nearly 15,000 bikes were stolen in the year 2016-7 in London alone \cite{bbc2017}, an increase of 30% on the previous year. Owners may fit a GPS tracker which can be used to report the vehicle's location to a central service (e.g. [2]) and therefore recover it if stolen, however prices for these devices start at £300 and usually also entail a monthly subscription charge, making them not affordable for many riders.

iBeacon is a Bluetooth Low Energy (BLE) technology developed by Apple that enables iOS apps to recognise when they have entered or left the physical region around a compatible device that is generating iBeacon advertisements [4]. In contrast to GPS trackers, iBeacons can be as cheap as £5 and may have longer battery life [?].

## Proposal - 'FindMyBike'

When physically attached to a motorcycles/scooter and associated with details of the owner and the make and model of the bike, an iBeacon may be used with the proposed app 'FindMyBike' to determine if the bike is nearby.

If a sufficiently large number of iOS app users are present in a densely populated area such as central London, the chances of detecting an iBeacon attached to a missing vehicle becomes high enough to make it a cost-effective alternative to GPS trackers by 'crowdsourcing' the absolute location of the missing vehicle.

Figure \ref{solution-overview} describes the desired behaviour of the proposed application.

![Overview of solution\label{solution-overview}](solution-overview.pdf){ width=80% }

The sequence of app usage can be summarised as:

1. The user installs the FindMyBike app on their iPhone
2. The user attaches a compatible iBeacon device to their bike and registers its identifier with the app
3. If the user's bike is stolen, they use the app to report it to the FindMyBike servers
4. As other FindMyBike users moves around in their normal life, if they enter a physical region near the stolen bike, a notification is sent to their phone
5. On receiving such a notification, another user opens the app to see the make and model of a stolen bike they are near
6. This user optionally shares their absolute location (determined via their phone's GPS receiver) with the owner of the stolen bike

## Target user group

The target market for this app are motorcycle and scooter owners living in densely populated urban areas with a known motorcycle crime problem such as central London. Users will be required to own devices running iOS 10 or later (representing 86% of the iOS device market [3]) in order to balance availability of the latest APIs and maximise the potential installed user base.

## Platform

The initial target platform for development is iPhone 6 and later. The report will also explore the possibility of adapting the app for Apple Watch.

## Language

All iOS code for this project will be written using Swift 3.1, to give an opportunity to explore and reflect upon the most recent trends in the Apple ecosystem.

## Server component

A key part of the project is a network-accessible server that is responsible for:

- storing details of registered users and bikes
- notifying app users about bikes that are reported missing
- collecting location data reported by app users about detected missing bikes
- notifying the owner of a missing bike that it has been detected

Fully creating such a server is out of scope for this project, however a simplistic implementation will be provided in order to validate the design and behaviour of the iOS app.

## Measurement

The success of the project will be measured in a number of ways:

- compatibility with target platform and devices
- demonstration that the app would meet Apple's criteria for inclusion on the App Store

Following inclusion on the App Store, the following criteria may be considered when considering how effective the app is:

- number of download on the App Store
- number of owners who have registered their bikes the app
- number of missing bikes reported as later recovered using the app.

# Blueprint

Figure \ref{design-blueprint} shows the main app views.

![Design blueprints\label{design-blueprint}](design-blueprint.pdf)

# Design and development pattern

## Model-View-Controller

The envisaged architectural pattern for the app is Model-View-Controller (MVC). MVC was formulated by Trygve Reenskaug [8] in 1978 and later developed by others Xeroc PARC, and has since been applied to a wide range of application platforms. Freeman [9] states that one aim of MVC is to 'simplify development, testing and maintenance'. Indeed, Apple's developer documentation [7] indicates that core iOS platform technologies often assume custom app objects will conform to the MVC pattern.

MVC can be seen as a layered model in which different applications concerns are separated. The model is an abstract representation of some data relevant to the application (for example, the registration details of a vehicle) along with operations for manipulating it, while the view corresponds to one or more user interface components that display data to the user. This implies that multiple views may be attached to the same model. The controller acts as intermediary between these layers and 'defines the way the user interface reacts to user input' [10]. By decoupling data and presentation, the resulting app code can be more reusable and extensible [7].

One possible variation on the pattern is to also define a 'view model', which may be defined as a restricted or modified set of model data that is used by the view [9], but this additional separation is unlikely to be necessary for the relatively simple data used by the proposed app.

## Development approach

As some parts of the solution are not yet fully defined, an iterative method is proposed. This is, based on the following assumptions:

- There is a single designer/developer working on the project
- There will be no change in team members during the project
- The designer/developer also acts as the primary 'client' of the project (with the University as a secondary client)
- Changes in scope/approach are possible but will be be determined solely by the designer/developer

Iterative project management models are well suited to learning and discovery, where a solution is known but not to the required depth, and some scope changes are expected [12]. Although for some projects the need for a very involved client is a challenge, this problem does not apply here.

# Development timeline

Figure \ref{development-timeline} is a simplified Gantt chart shows the design and development plan for the project. Task owners are not specified as only a single designer/developer is involved.

![Development timeline Gantt chart\label{development-timeline}](development-timeline.pdf)

## Risk register

A number of possible risks for this project have been identified, which are given below in the form of a simplified risk register in the style of PRINCE2. The objective of such a register is "to identify, assess and control uncertainty and, as a result, improve the ability of the project to succeed" [11]

----------------------------------------------------------------------------------------------
ID  Description                                           Probability    Impact  Level of Risk
--  ----------------------------------------------------  -------------  ------  -------------
 1  Limited signal range of iBeacon devices makes         Possible       High    High
    proximity detection impractical.

 2  Insufficient users install the app after release to   Possible       High    High
    provide necessary level of coverage

 3  Lack of Bluetooth support in iOS Simulator [6] slows  Probable       Low     Medium
    down development by requiring use of real physical
    devices for testing

  4 The app fails to comply with submission guidelines    Unlikely       High    Medium
    for the App store
----------------------------------------------------------------------------------------------

Based on the risks above, the following mitigrations are proposed:

- Early study of app store submission guidelines and ongoing review [4]
- ...

# References

- [1] Motorcycle Theft leaflet, City of London Police
  https://www.cityoflondon.police.uk/news-and-appeals/Documents/Motorcycle%20Theft%20leaflet.pdf
- [2] BikeTrac Pricing
  https://biketrac.co.uk/#pricing
- [3] Apple Developer - App Store
  https://developer.apple.com/support/app-store/
- [4] Apple Developer - Getting Started with iBeacon
  https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf
- [6] iOS Simulator Bluetooth Low Energy (BLE) - comment by Apple Staff member 'jeremyhu'
  https://forums.developer.apple.com/thread/14983
- [7] Concepts in Objective-C Programming: Model-View-Controller
  https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html#//apple_ref/doc/uid/TP40010810-CH14-SW1
- [8] MVC Xerox PARC 1978-9
  http://heim.ifi.uio.no/~trygver/themes/mvc/mvc-index.html
- [9] Pro Design Patterns in Swift - Adam Freeman (2015), Apress, New York
- [10] (gang of four)
- [11] Brilliant PRINCE2: What you really need to know about PRINCE2
  Stephen Barker, 2013, Harlow, Pearson
- [12] Effective Project Management: Traditional, Agile, Extreme, 7th Edition
  Robert K. Wysocki. John Wiley & Sons, 2013
