
package.path=package.path..';'..'C:\\Users\\admin\\Desktop\\cw_device/?.lua;'

local s = ' systemName,caption, SerialNumber , SystemCreationClassName  ,SystemName, Description  ,DeviceID'

local r = exec({ 'wmic', ' volume ', ' get ', 'DeviceID ', ',SerialNumber', ',caption' })
print(r)


--6e530bb5-0a12-4110-8781-7eefcaeac0e7}\  1550108606
--\\?\Volume{4c2a8179-6565-441d-a004-338f1cf5b2fa