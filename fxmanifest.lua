fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'mms-bounty'
version '1.1.3'
author 'Markus Mueller'

client_scripts {
	'client/client.lua'
}

server_scripts {
	'server/server.lua',
	'@oxmysql/lib/MySQL.lua',
}

shared_scripts {
    'config.lua',
	--'@ox_lib/init.lua',
}

dependency {
	'vorp_core',
	--'ox_lib',  --https://overextended.dev/ox_lib
	'bcc-utils',
	'feather-menu',
}

lua54 'yes'
