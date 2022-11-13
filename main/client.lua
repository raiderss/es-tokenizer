
     local token = nil 

      RegisterNetEvent('esx:playerLoaded')
      AddEventHandler('esx:playerLoaded', function()
           TriggerServerEvent('create-token', GetPlayerServerId(PlayerId()))
      end)
          
     
     RegisterCommand("test", function()
          data = {
               type = 'cash',
               amount = 500,
               succes = token
          }
          TriggerServerEvent('Trigger', GetPlayerServerId(PlayerId()), data)
     end)

     RegisterNetEvent("data", function(key) 
          token = key
     end)
