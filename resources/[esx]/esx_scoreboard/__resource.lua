resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Scoreboard'

version '1.1'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
	'config.lua'
}

client_scripts {
	'client.lua',
	'config.lua'
}

ui_page 'html/scoreboard.html'

files {
	'html/scoreboard.html',
	'html/style.css',
	'html/listener.js',
	'html/img/ambulance.png',
	'html/img/police.png',
	'html/img/sheriff.png',
	'html/img/taxi.png',
	'html/img/mecano.png',
	'html/img/cardealer.png',
	'html/img/mcdealer.png',
	'html/img/realestateagent.png',
	'html/img/lawyer.png'
}