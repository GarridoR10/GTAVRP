resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Ladrão de carro'

version '1.0.1'

server_scripts {
    '@es_extended/locale.lua',
	'config.lua',
	'server/main.lua',
  'locales/br.lua',
	'locales/en.lua',
	'locales/es.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua',
  'locales/br.lua',
	'locales/en.lua',
	'locales/es.lua'
}

dependency 'es_extended'
