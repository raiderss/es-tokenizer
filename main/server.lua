              
              ESX = nil
              TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

              Citizen.CreateThread(function()
                    MySQL.Async.execute('UPDATE eyes SET request = 0', {})
                end)

                function randomString(v)
                    local length = math.random(10,v)
                    local array = {}
                    for i = 1, length do
                        array[i] = string.char(math.random(55, 123))
                    end
                    return table.concat(array)
                end
                local key = "eyes-"..randomString(20)..randomString(11)

                AddEventHandler("playerDropped", function(player)
                    local playerId = source
                    MySQL.Async.execute('UPDATE eyes SET token = ?, request = ? WHERE identifier = ?', {0, 0, GetPlayerIdentifier(source)})
                end)

                RegisterNetEvent('create-token', function(source)
                    local Player = ESX.GetPlayerFromId(source)
                    local result = MySQL.Sync.fetchAll('SELECT * FROM eyes WHERE identifier = ?', { GetPlayerIdentifier(source) })
                    time = os.date ("*time") 
                    t = os.date ("*t")  
                    local table =  t.day..'/'..t.month..'/'..t.year..' - hour:'..t.hour..':'..t.sec
                    if result[1] == nil then 
                        MySQL.Async.execute('INSERT INTO eyes (identifier, token, request, login) VALUES (@identifier, @token, @request, @login)',
                        {
                            ['@identifier'] = GetPlayerIdentifier(source),
                            ['@token'] = key,
                            ['@request'] = 1,
                            ['@login'] = table
                        })
                    else
                        if result[1].request == 0 then 
                            req = 1 
                        else 
                            req = result[1].request + 1 
                        end
                        MySQL.Async.execute('UPDATE eyes SET token = ?, request = ?, login = ? WHERE identifier = ?', {key,req, table, GetPlayerIdentifier(source)})
                        if result[1].request >= 1 then 
                            print('Kicked Request limit exceeded ==>' ..result[1].request)
                          -- BAN EVENT OR KICKED
                        end
                    end
                    TriggerClientEvent('data', source, key)
                end)


                RegisterNetEvent("Trigger", function(source, data)

                    local Player = ESX.GetPlayerFromId(source)
                    
                    local result = MySQL.Sync.fetchAll('SELECT * FROM eyes WHERE identifier = ?', { GetPlayerIdentifier(source) })

                    if not data.succes then 
                        TriggerClientEvent('data', source, result[1].token)
                        print('Script restarted, or there is an error ('..GetPlayerName(source)..') Player token has been renewed!')
                        return
                    end

                            if result[1].token == data.succes then 

                                if data.type == 'cash' then -- EXAMPLE
                                    -- Player.addMoney(source, data.amount)
                                end

                                print("==> CODE WORKED VERIFICATION OK")



                            else 

                                -- BAN EVENT OR KICKED 


                                print(" ==> CODE DID NOT WORK VERIFICATION FAILED")

                        end
                 end)