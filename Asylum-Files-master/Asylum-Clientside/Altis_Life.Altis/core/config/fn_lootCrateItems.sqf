/*
	File: fn_lootCrateItems.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	List of items inside loot crates.
*/

private ["_type"];
_type = [_this,0,0,[0]] call BIS_fnc_param;

// Crate ID, Display Name
switch (_type) do
{
	case 1:
	{
		[
			[ // Common
				[1,"Troll Shirt"],
				[2,"Sorry Shirt"],
				[3,"Bieber Shirt"],
				[4,"Unicorn Shirt"]
			],
			
			[ // Rare
				[5,"Hiker's Pack"],
				[6,"Combat Helmet"],
				[7,"Snake Helmet"]
			],
			
			[ // Limited
				[8,"CSAT Ghillie"],
				[9,"CSAT Coveralls"]
			]
		]
	};
	default { [[],[],[]] };
};