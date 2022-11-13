Config = {}

Config.Framework = "ESX" -- QBCore or ESX or OLDQBCore --

Config.MarkerName = "[E] RENT"
Config.Time = 120 -- car rental time example 2 minutes
Config.PlateText = 'EYESTORE' -- rented car plate number
Config.GetVehFuel = function(Veh)
    return GetVehicleFuelLevel(Veh)-- exports["LegacyFuel"]:GetFuel(Veh)
end


Config.Vehicles = {
    {model="bati", label="MOTO", price=250},
    {model="a80", label="SUPRA", price=350},
    {model="69charger", label="CHARGER", price=450},
    {model="m5e60", label="BMW", price=550},
    {model="mustang19", label="MUSTANG", price=650},
    {model="revolution6str2", label="REVOLUTION", price=750},
    {model="turismo2", label="TURISMO", price=850}
}

Config.Rgb = {
    {R = 132, G = 131, B = 145,  color="#848391"},
    {R = 141, G = 82 , B = 38,   color="#8d5226"},
    {R = 142, G = 148, B = 36,   color="#8e9424"},
    {R = 104, G = 146, B = 36,   color="#689224"},
    {R = 139, G = 80 , B = 248,  color="#8b50f8"},
    {R = 32 , G = 87 , B = 151,  color="#205797"},
    {R = 24 , G = 144, B = 103,  color="#189067"},
    {R = 40 , G = 143, B = 34,   color="#288f22"},
    {R = 130, G = 18 , B = 22,   color="#821216"},
    {R = 135, G = 35 , B = 39,   color="#872327"},
    {R = 121, G = 19 , B = 143,  color="#79138f"},
    {R = 4,   G = 32 , B = 141,  color="#04208d"},
    {R = 35 , G = 35 , B = 45,   color="#23232d"},
    {R = 89 , G = 25 , B = 47,   color="#59192f"},
    {R = 64 , G = 62 , B = 23,   color="#403e17"},
    {R = 38 , G = 46 , B = 19,   color="#262e13"},
}

Config.Locations = {
    {
        coords = vector3(237.8242, -792.7385, 29.49304),
        hash = "a_m_o_soucent_01",
        heading = 170.00,
        marker = "~w~ Rent a Car",
        camera = {
            ["vehicle"] = vector4(235.8658, -782.916, 30.645, 179.64),
            ["camera"] = { posX = 233.37, posY = -789.9, posZ = 30.6, rotX = 0.0, rotY = 0.0, rotZ = -22.0, fov = 50.0},
            ["buy"] = vector3(229.3833, -800.980, 30.037)
        },
        blip = {
            ["active"] = true,
            ["name"] = "Rent a Car",
            ["colour"] = 83,
            ["id"] = 52
        }
    },
}

EYES = {}
EYES.Functions = {
    CreateBlips = function()
        for k,v in pairs(Config.Locations) do 
            if v.blip["active"] then 
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, v.blip["id"])
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.blip["colour"])
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip["name"])
            EndTextCommandSetBlipName(blip)
            end
        end
    end
}







