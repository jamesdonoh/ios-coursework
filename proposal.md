# Advanced Mobile Applications - iOS

## App Proposal - FindMyBike

### Aims

#### Overview

This proposal is for an iOS application which can be used to help owners of motorcycles and scooters 'crowdsource' the location of their vehicle in the event of a theft using a combination of Bluetooth Low Energy (BLE) beacons and the Global Positioning System (GPS).

#### Context

Thefts of motorcycles and scooters are on the increase. It has been estimated [1] that 9,500 bikes are stolen each year in London alone. A GPS tracker may be fitted which can be used to report the vehicle's location to a central service (e.g. [2]) and therefore recover it if stolen, however prices for these devices start at £300 and usually also entail a monthly subscription charge, making them not economical for many riders.

##### About iBeacon

iBeacon is a Bluetooth Low Energy (BLE) technology developed by Apple that enables applications running on iOS (and more recently on Android) to determine when they have entered or left the physical region around a compatible device that is generating iBeacon advertisements [4].

### Design

#### Architecture

In its most minimal form, the project comprises three elements:

- an iPhone app
- a compatible iBeacon device
- an application server, responsible for managing details of users and bikes

The flow of app usage can be summarised as:

1. The user installs the FindMyBike app on their iPhone
2. The user attaches a compatible iBeacon device to their bike and registers its identifier with the app
3. If the user's bike is stolen, they use the app to report it to the FindMyBike servers
4. As other FindMyBike users moves around in their normal life, if they enter a physical region near the stolen bike, a notification is sent to their phone
5. On receiving such a notification, another user opens the app to see the make and model of a stolen bike they are near
6. This user optionally shares their absolute location (determined via GPS) with the owner of the stolen bike

#### Target user group

The target market for this app are motorcycle and scooter owners living in densely populated urban areas with a known motorcycle crime problem such as central London. Users are expected to be running iOS 10 or later, covering 86% of the iOS device market [3].

#### Requirements

#### Interface


### Development timeline

#### Risks


### References

- [1] Motorcycle Theft leaflet, City of London Police
  https://www.cityoflondon.police.uk/news-and-appeals/Documents/Motorcycle%20Theft%20leaflet.pdf
- [2] BikeTrac Pricing
  https://biketrac.co.uk/#pricing
- [3] Apple Developer - App Store
  https://developer.apple.com/support/app-store/
- [4] Apple Developer - Getting Started with iBeacon
  https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf
