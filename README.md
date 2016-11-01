# Sonoff switch controlled by MQTT messages

### Features
* you can control switch with MQTT Messages. Basically set the relay switch to on,off (1,0) state
* each relay change is published to MQTT broker  
* you can change the relay state using button in the Sonoff switch. It changes it from Off to On or from On to Off
* while booting, switch  can set default value of the relay by retrieving default from MQTT broker - you have to implement it by yourself in your MQTT Broker and connected service. A sample of it you can fine on my blog. It's in Polish ;-), link below

### Requirements:

* Sonoff switch (with ESP8266 chip)
* Sonoff flashed with [ESP8266 Flasher](https://github.com/nodemcu/nodemcu-flasher) or other with LUA language on board
* MQTT Broker

### MQTT Topics

| Topic  | Inbound / Outbound | Message | Description |
|---|---|---|---|---| 
| /sonoff/switch/*ID*/cmd | Inbound | turnON, turnOFF, reportStatus |  Sonoff switch should be subscribed to this topic. This topic controls the switch. **turnON** - set relay to ON, **turnOFF** - set relay to OFF, **reportStatus** - triggers publishing relay current state | 
| /sonoff/switch/*ID*/state | Outbound | ON, OFF | Sonoff switch publishes to this topic all changes of the relay |
| /sonoff/switch/*ID*/get | Outbound | defaultState | Sonoff switch sends this message to the broker while booting in order to get default value of the relay. If it's not implemented in the MQTT broker then default relay state is set: off | 

where 
*  _ID_ is a value of particular switch ChipID - it could be set manually to whatever value in the _config.lua_ file


### Configuration
Configuration should be made in _config.lua_ file

| Parameter  | Description |
|---|---|
| ID | Device ID. It's used in the MQTT Topic to distinguish other Sonoffs in MQTT Broker. You can change it. Use either numbers or chars. Don't use space or special characters, default is ChipID |
| WIFI_SSID  | WiFi network name |
| WIFI_PASSWORD   | WiFi network password |
| MQTT_HOST  | MQTT Broker IP or host name |
| MQTT_PORT  | MQTT Port, default 1883 |
| MQTT_USER  | MQTT User name, leave blank if there is no user authentication at your MQTT broker |
| MQTT_PASSWORD  | MQTT User name, leave blank if there is no user authentication at your MQTT broker |
| MQTT_TOPIC  | MQTT topic, defualt /sonoff/switch/ |
| BUTTON   | GPIO Pin number of the button in Sonoff switch |
| RELAY   | GPIO Pin number of the relay in Sonoff switch |
| LED   | GPIO Pin number of the led indicator in Sonoff switch |


### Installation

Following files have to be compiled on ESP8266
* config.lua
* setup.lua
* app.lua

Below code does it and in addition removes lua files afterwards - they are no longer required after they are compiled
``` 
node.compile("config.lua")
node.compile("setup.lua")
node.compile("app.lua")
file.remove("config.lua")
file.remove("setup.lua")
file.remove("app.lua")
```

_init.lua_ should be uploaded to Sonoff as is - without compilation

**You can find description in Polish at my site** [SmartHouse](http://smart-house.adrian.czabanowski.com/sonoff-openhab-mqtt-zrob-to-sam/)