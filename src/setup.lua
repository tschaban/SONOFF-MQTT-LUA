-- Connections
--
-- LICENCE: http://opensource.org/licenses/MIT
-- 2016-10-27 tschaban https://github.com/tschaban

local module = {}

local function getIP()
    if wifi.sta.getip() == nil then
        print("IP unavailable, Waiting...")
    else
        tmr.stop(1)
        print("\n====================================")
        print("ESP8266 mode is: " .. wifi.getmode())
        print("MAC address is: " .. wifi.ap.getmac())
        print("IP is " .. wifi.sta.getip())
        print("====================================")
        app.start()
    end
end

local function connect()
    wifi.setmode(wifi.STATION);
    wifi.sta.config(config.WIFI_SSID, config.WIFI_PASSWORD)
    wifi.sta.connect()
    print("Connecting to " .. config.WIFI_SSID .. " ...")
    --config.SSID = nil  -- can save memory
    tmr.alarm(1, 2500, 1, getIP)
end

function module.start()
    print("Configuring Wifi ...")
    wifi.setmode(wifi.STATION);
    wifi.sta.getap(connect)
end

return module