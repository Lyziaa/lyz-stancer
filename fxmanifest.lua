fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'lyz-stancer'
author 'Lyzia'
description ''
version '1.0.0'

client_script 'client.lua'

dependencies {
    'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
