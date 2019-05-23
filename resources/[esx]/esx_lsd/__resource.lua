description 'esx_lsd'

version '1.0.0'

server_scripts {

  '@es_extended/locale.lua',
	'locales/fr.lua',
	'locales/en.lua',
  'server/esx_lsd_sv.lua',
  'config.lua'

}

client_scripts {

  '@es_extended/locale.lua',
	'locales/fr.lua',
	'locales/en.lua',
  'config.lua',
  'client/esx_lsd_cl.lua'

}
