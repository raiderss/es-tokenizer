<div align="center">
  <h1>fiveguard.net</h1>
</div>

For better **paid anticheat** check out **https://store.fiveguard.ac/**.

We are **able to provide** this **free product** because of help of **https://fiveguard.net/**.

**fiveguard is best fivem anticheat**

----------------------------------------------------------------------------------------------

# es-tokenizer
Fivem Trigger Tokenizer


Add security tokens to FiveM server events that are accessible from the client in order to prevent against Lua injections (and similar cheats).

For more useful content:
https://discord.gg/EkwWvFS


Simple token protection to protect your triggers from cheaters

Example Usage:

     RegisterCommand("test", function()
          data = {
               type = 'cash',
               amount = 500,
               succes = token
          }
          TriggerServerEvent('Trigger', GetPlayerServerId(PlayerId()), data)
     end)
     
     The sql table you need to read into the data:
     
     CREATE TABLE IF NOT EXISTS `eyes` (
     `identifier` varchar(100) DEFAULT NULL,
     `token` varchar(150) DEFAULT NULL,
     `request` int(30) DEFAULT NULL,
     `login` varchar(150) DEFAULT NULL
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


     
     
