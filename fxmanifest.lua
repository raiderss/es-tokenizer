fx_version "adamant"

description "EyesStore"
author "Raider#0101"
version '1.0.0'
repository 'https://discord.com/invite/EkwWvFS'

game "gta5"

client_script { 
"main/client.lua"
}

server_script {
'@mysql-async/lib/MySQL.lua',
"main/server.lua",
} 



shared_script "main/shared.lua"

escrow_ignore { 'main/shared.lua' }

lua54 'yes'