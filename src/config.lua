-- Configuration
--
-- LICENCE: http://opensource.org/licenses/MIT
-- 2016-10-27 tschaban https://github.com/tschaban

local module = {}

module.ID = node.chipid()

module.WIFI_SSID = "SSID"
module.WIFI_PASSWORD = "password"

module.MQTT_HOST = "mqtt.example.com"
module.MQTT_PORT = 1883
module.MQTT_USER = "user"
module.MQTT_PASSWORD = "password"
module.MQTT_TOPIC = "/sonoff/switch/"


-- GPIO Configuration
module.BUTTON = 3
module.RELAY = 6
module.LED = 7

return module