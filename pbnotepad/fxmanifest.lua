-- Generated automaticly by RB Generator.
fx_version('cerulean')
games({ 'gta5' })

lua54 'yes'

shared_script('@ox_lib/init.lua');

server_scripts({
    '@oxmysql/lib/MySQL.lua',
    'sv.lua'
});

client_scripts({
    'cl.lua'
});

files {
    'html/index.css',
    'html/index.html',
    'html/index.js',
    'html/sv.png'
}

ui_page 'html/index.html'