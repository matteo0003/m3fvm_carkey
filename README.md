[![MIT License][license-shield]][license-url]

<div align="center">
	<a href="https://github.com/matteo0003/m3fvm_carkey">
		<img src="https://i.imgur.com/OeLhwaV.png" alt="m3fvm">
	</a>
</div>

<div align="center">
	<h1>m3fvm_carkey</h1>
	<p></p>
</div>

### How to use:

1. Use `/carkey` to give you the keys to the vehicle you are sitting in.
2. Adapt other scripts to give keys on purchase or other:

   	```lua
	TriggerServerEvent("m3fvm_carkey:give", <source>, <plate>)
	```



### Requirements:

- [ox_lib](https://github.com/overextended/ox_lib/releases)
- [ox_inventory](https://github.com/overextended/ox_inventory/releases)

### Installation:

1. Download the project in zip and unzip it.
2. Place the project in your `resources` folder.
3. Add in your `server.cfg`:

	```
	ensure m3fvm_carkey
	```
4. Add in your `ox_inventory/data/items.lua`:

   	```lua
	["m3fvm_carkey"] = {
	        label = "m3fvm_carkey",
	        stack = false,
	        weight = 30,
	        client = {
	            image = "matteo0003_carkey.png",
	        },
	        metadata = {
	                plate = "",
	        },
	},
    	```

### License:

Distributed under the MIT License. See `LICENSE` for more information.

### Contact:

<a href="https://discord.gg/NqqtkS7ekj" target="_blank">
	<img src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white" alt="Discord">
</a>
<a href="mailto:matteo.angoin@icloud.com">
	<img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail">
</a>

[license-shield]: https://img.shields.io/github/license/matteo0003/m3fvm_carkey.svg?style=for-the-badge
[license-url]: https://github.com/matteo0003/m3fvm_carkey/blob/master/LICENSE.txt
