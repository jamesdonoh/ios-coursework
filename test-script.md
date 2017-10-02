# Testing script

## Device permissions

- On first run should request to enable Notifications
- On first run should request to access location always
- First run with Bluetooth and Location Services disabled
  - Should show alert to turn on Location Services with link to Settings app
  - Should show prompt to turn on Bluetooth with link to Settings app
- First run with Bluetooth disabled and Location Services enabled
  - Should show prompt to turn on Bluetooth with link to Settings app
- First run with Bluetooth enabled and Location Service disabled
  - Should show alert to turn on Location Services with link to Settings app
- First run with Bluetooth and Location Services enabled
  - When Bluetooth is disabled, on returning to foreground
    - No missing bikes shown; no error displayed
  - When Bluetooth is re-enabled, on returning to foreground
    - Missing bikes reappear
  - When Location Services are disabled, on returning to foreground
    - No missing bikes shown; no error displayed
  - When Location Services are re-enabled, on returning to foreground
    - Missing bikes reappear

## Bluetooth region detection

- On entering region containing missing bikes
- In foreground:
  - Bikes are shown in missing bikes table
- In background _and_ not running:
  - 'Missing bikes nearby' alert is displayed
  - Tapping alert opens app and shows missing bike(s)

## Network communication and API integration

- First run in Airplane mode
  - Shows communication error alert
  - On disabling Airplane mode
    - KNOWN ISSUE: Ranges beacons but nothing displayed in table (because no data loaded)
- Going from background to foreground in Airplane mode
  - Shows no bikes detected
  - Disabling Airplane mode, bikes detected
- Going from background to foreground in Airplane mode with Bluetooth switched on anyway
  - Shows missing bikes
- Run with no mobile data or WiFi = same results as Airplane mode
- Save my bike in Airplane mode
  - Shows communication error alert
  - KNOWN ISSUE: Bike data is not saved locally if sending to API failed
- All bike details sent correctly to API
  - Missing status updated correctly

## Local persistence

- On starting app after previously saving bike

## User interface

- Disclosure mark is displayed for my bike but not for other rows
- With no bike configured, symbol and 'tap to edit' displayed
- Photo takes precedence over symbol for 'my bike'
- Only coloured symbols are shown for missing bikes, not photos
- Edit bike form disallows empty make and model
- Edit bike form displays fixed beacon UUID and major and does not allow editing
- Edit bike form disallows beacon minor less than 100
- Edit bike form disallows beacon minor greater than 65535
- Edit bike form disallows non-numeric beacon minor
- No colour swatch displayed by default
- Tapping 'tap to set' colour opens colour selector
  - Cancel closes colour selector without selecting
  - KNOWN ISSUE: Tapping already selected colour has no effect (should close)
- Tapping 'choose photo' requests permission to access photos
- Portrait photos are displayed correctly
- Landscape photos are displayed correctly
- Enabling 'Bike is missing' slider shows alert
- Proximity to my bike shown in ranging table

## Report sighting

- Tapping missing bike shows alert prompting user to report sighting
  - Cancel cancels, OK sends sighting message to API
- In Airplane mode or with no network connection
  - Shows communication error alert
- KNOWN ISSUE: Reporting another bike while one request is pending is ignored

## Notifications

- With notifications not allowed
  - In foreground, alert is displayed
  - In background, no notification displayed
- With notifications allowed:
- Receive local notification when region entered and app in background
  - Alert displayed in Notification Center
  - Tapping alert opens app
- Receive local notification when region entered and app not running
  - Alert displayed in Notification Center
  - Tapping alert opens app
- Receive remote notification with app in foreground
  - Cancel closes alert
  - Show opens in Maps
- Receive remote notification with app in background
  - As above
