fx_version 'cerulean'
game 'gta5'

description 'Crypto Mining Simulator'
author 'qw-scripts'
version '0.1.0'

client_scripts { 
 'client/**/*' 
 }

server_scripts { 
 'server/**/*',
 '@oxmysql/lib/MySQL.lua' 
 }

shared_scripts { 
    'shared/**/*',
    '@ox_lib/init.lua' -- if you are using ox_lib, uncomment this line
 }

lua54 'yes'