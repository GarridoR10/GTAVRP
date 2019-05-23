client_scripts {
	'utils.lua',
	'client/markers.lua',
	'client/mysql.lua',
	'client/notifications.lua',
	'client/main.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'utils.lua',
	'server/main.lua',
	'server/sessions.lua'
}