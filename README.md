# es-tokenizer
Fivem Trigger Tokenizer

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


     
     
