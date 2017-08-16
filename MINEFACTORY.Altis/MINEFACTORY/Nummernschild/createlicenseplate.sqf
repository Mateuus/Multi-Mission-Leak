/*
	IF U WANT TO USE THE LICENSE PLATE SCRIPT, ASK FOR PERMISSION!
	File: createlicenseplate.sqf
	Author: Dino
	
	Description:
	Refreshes the License Plates.
*/
/*
_randomnmr = round(random 20);
_randomnmr = _randomnmr + 1;
_stringnr = Str _randomnmr;

licenseplatenumber = "images\lp\" + _stringnr + ".paa";
*/

/*if (side player == west)then{
	licenseplatenumber = "images\lp\Nummernschild.paa";
};


if (side player == independent)then{
	licenseplatenumber = "images\lp\Nummernschild_MEDIC.paa";
};
*/
//Alle Donator
if(license_civ_donator && playerSide == civilian) then {
	licenseplatenumber = "MINEFACTORY\textures\Nummernschilder\default.paa";
};

//Bis 16.05.16
if ((getPlayerUID player) in ["76561198135062536"])then{
	licenseplatenumber = "MINEFACTORY\textures\Nummernschilder\76561198135062536.paa";
};
//Bis 16.05.16
if ((getPlayerUID player) in ["76561198095171635"])then{
	licenseplatenumber = "MINEFACTORY\textures\Nummernschilder\76561198135062536.paa";
};
sleep 1;
player setVariable ["myPlate", licenseplatenumber, true];