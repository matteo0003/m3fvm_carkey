fx_version "cerulean"
game "gta5"
lua54 "yes"

author "matteo0003"
version "1.0.0"

client_scripts {
	"client/client.lua",
}

server_scripts {
	"server/server.lua",
}

shared_scripts {
	"@ox_lib/init.lua",
	"shared/shared.lua",
}

dependencies {
	"ox_lib",
	"ox_inventory",
}

files {
	"assets/m3fvm_carkey.png",
}