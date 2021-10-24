fx_version 'adamant'

game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'RDX Billing'

version '1.2.0'

shared_script '@rdx_core/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@rdx_core/locale.lua',
	'locales/de.lua',
	'locales/pt.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'locales/tr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@rdx_core/locale.lua',
	'locales/de.lua',
	'locales/pt.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'locales/tr.lua',
	'config.lua',
	'client/main.lua'
}

dependency 'rdx_core'
