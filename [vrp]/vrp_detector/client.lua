detector = {
    {436.12911987305,-981.74456787109,30.698616027832},
    {1853.9157714844,3685.1645507813,34.267040252686},
    {150.28442382813,-1038.9141845703,29.377796173096},
    {-2965.7385253906,482.98623657227,15.697046279907},
    {-109.62287902832,6463.9565429688,31.626707077026},
    {-1213.9013671875,-328.85900878906,37.790740966797},
    {314.78491210938,-277.10101318359,54.17448425293},
    {-350.55902099609,-48.381637573242,49.036476135254},
    {233.11387634277,215.99319458008,106.28667449951},
    {259.75921630859,204.9874420166,106.28321838379},
    {1175.0679931641,2704.3557128906,38.097732543945},
    {81.875869750977,-1391.6229248047,29.387632369995},
    {-818.16888427734,-1078.1706542969,11.339605331421},
    {-1199.8679199219,-776.70745849609,17.323696136475},
    {419.0924987793,-807.55773925781,29.502624511719},
    {-1454.6214599609,-233.21644592285,49.798782348633},
    {-715.67700195313,-156.12399291992,37.415138244629},
    {-157.83851623535,-305.08255004883,39.733276367188},
    {126.69147491455,-212.25366210938,54.55782699585},
    {618.14038085938,2751.80859375,42.088134765625},
    {1197.9146728516,2703.7014160156,38.234111785889,189.44795227051},
	{-38.219932556152,-1108.4227294922,26.468742370605}, -- Bilforhandler
    {-1095.8748779297,2706.58203125,19.119356155396},
    {1687.6697998047,4820.6254882813,42.074588775635,102.62945556641},
    {-3168.8610839844,1055.4610595703,20.863214492798},
    {-0.56194370985031,6516.3369140625,31.889347076416,48.248512268066},
    {-630.04296875,-236.71064758301,38.057056427002},
    {1738.78125,2635.1618652344,45.965019226074}, -- Fængsel besøgslokale
    {1730.7401123047,2586.9626464844,45.965026855469}, -- Fængsel indsætning
    {354.85659790039,-595.99017333984,28.791460037231}, -- Hospitaldør fordør venstre
    {359.05563354492,-584.45727539063,28.812574386597}, -- Hospital fordør højre
    {299.42465209961,-584.83374023438,43.260837554932}, -- Hospital bagdør
    {-248.53942871094,6333.228515625,32.43635559082}, -- Hospital Paleto
    {1838.4212646484,3674.3269042969,34.271034240723}, -- Hospital Sandy
    {1828.4178466797,3690.9655761719,34.271041870117},
    {931.8388671875,43.872913360596,81.097778320313},  -- Casino
}

weapons = {
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_PROXMINE",
    "WEAPON_RAILGUN",
    "WEAPON_COUGAR",
    "WEAPON_KNIFE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_STUNGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_REMOTESNIPER",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_STINGER",
    "WEAPON_MINIGUN",
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_BZGAS",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_FLARE",
    "WEAPON_SNSPISTOL",
    "WEAPON_BOTTLE",
    "WEAPON_GUSENBERG",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_DAGGER",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_FIREWORK",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_PROXMINE",
    "WEAPON_FLAREGUN",
    "WEAPON_GARBAGEBAG",
    "WEAPON_HANDCUFFS",
    "WEAPON_COMBATPDW",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_KNUCKLE",
    "WEAPON_HATCHET",
    "WEAPON_RAILGUN",
    "WEAPON_MACHETE",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_SWITCHBLADE",
    "WEAPON_REVOLVER",
    "WEAPON_DBSHOTGUN",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_AUTOSHOTGUN",
    "WEAPON_BATTLEAXE",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_MINISMG",
    "WEAPON_PIPEBOMB",
    "WEAPON_POOLCUE",
    "WEAPON_WRENCH"
}

local delay = 0

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(100)
        if delay > 0 then
            delay = delay-1
        else
            for i = 1, #detector do
                detectors = detector[i]
                DrawMarker(27, detectors[1], detectors[2], detectors[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 0--[[Alpha]], 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), detectors[1], detectors[2], detectors[3], true ) < 1.5 then
                    TriggerServerEvent('vrp_detector:check')
                    delay = 1000 -- 10 sekunder
                end
            end
        end
    end
end)


RegisterNetEvent("vrp_detector:gooff")
AddEventHandler("vrp_detector:gooff", function(trigger)
    local player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(player)
    for i=1,#weapons, 1 do
        local weaponHash = GetHashKey(weapons[i])
        if (HasPedGotWeapon(player, weaponHash, false) and not paused) or (trigger and not paused) then
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "detector", 0.3)
            TriggerServerEvent('cn_notify:notifyPolice', "Alarm: %number er blevet udløst, person set med våben på stedet!",{playerCoords.x, playerCoords.y, playerCoords.z})
            break
        end
    end
end)
