local Functions <const> = require 'modules.function'

RegisterNUICallback("getLocale", function(data, cb)
    cb({ locale = Functions:GetLocale() })
end)

RegisterNUICallback("closePauseMenu", function(data, cb)
    cb({})
    Functions:ClosePauseMenu()
    Functions:CloseCam()
end)

RegisterNUICallback("actionPauseMenu", function(data, cb)
    if data == 'settings' then
        SendNUIMessage({ action = "settings" })
        ActivateFrontendMenu(`FE_MENU_VERSION_LANDING_MENU`, 0, -1)
    elseif data == 'maps' then
        SendNUIMessage({ action = "maps" })
        Functions:ClosePauseMenu()
        Wait(300)
        ActivateFrontendMenu(-1171018317, 0, -1)
        while not IsFrontendReadyForControl() do
            Wait(10)
        end
        Wait(20)
        SetControlNormal(2, 201, 1.0)
    elseif data == 'quit' then
        SendNUIMessage({ action = "quit" })
        TriggerServerEvent('LGF:QuitPlayer')
    elseif data == 'relog' then
        SendNUIMessage({ action = "relog" })
        TriggerEvent('LegacyFramework:relog') -- change your event relog 
    end
end)