**Sonoff switch controlled by MQTT messages**

**Requirements: **
- Sonoff switch (with ESP8266 chip)
- Sonoff flashed with ESP8266 Flasher https://github.com/nodemcu/nodemcu-flasher or other with LUA language on board
- MQTT Broker

**MQTT Topics**

| Topic  | Inbound / Outbound | Message | Description |
|---|---|---|---|---| 
| /sonoff/switch/ID/cmd | Inbound | turnON, turnOFF, reportStatus |  Sonoff switch should be subscribed to this topic. This topic controls the switch. | 
| /sonoff/switch/ID/state | Outbound | ON, OFF | Sonoff switch publishes to this topic all changes of the relay |
| /sonoff/switch/ID/get | Outbound | defaultState | Sonoff switch sends this message to the broker while booting in order to get default value of the relay. If it's not implemented in the MQTT broker then default relay state is set: off | 

where 
- ID is a value of particular switch ChipID - it could be set manually to whatever value in the config.lua file


**Configuration**
Configuration should be made in config.lua file

| Parameter  | Description |
|---|---|
| WIFI_SSID  | WiFi network name |
| WIFI_PASSWORD   | WiFi network password |
| MQTT_HOST  | MQTT Broker IP or host name |
| MQTT_PORT  | MQTT Port, default 1883 |
| MQTT_USER  | MQTT User name, leave blank if there is no user authentication at your MQTT broker |
| MQTT_PASSWORD  | MQTT User name, leave blank if there is no user authentication at your MQTT broker |
| MQTT_TOPIC  | MQTT topic, defualt /sonoff/switch/ |
| ID | Device ID, use either numbers or chars no space or special characters, default is ChipID |
| BUTTON   | GPIO Pin number of the button in Sonoff switch |
| RELAY   | GPIO Pin number of the relay in Sonoff switch |
| LED   | GPIO Pin number of the led indicator in Sonoff switch |
|

**Installation**

Following files have to be compiled on ESP8266
- config.lua
- setup.lua
- app.lua
