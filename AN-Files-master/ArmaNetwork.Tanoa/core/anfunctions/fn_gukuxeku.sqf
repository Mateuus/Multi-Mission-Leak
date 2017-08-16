/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/

removeUniform player;
removeVest player;
removeBackpackGlobal player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

private _uniforms = [
	"U_C_Poor_1",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_tricolour",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_C_Commoner_shorts",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour"
	];

private _headgear = [
	"H_StrawHat",
	"H_StrawHat_dark",
	"H_Hat_blue",
	"H_Hat_brown",
	"H_Hat_grey",
	"H_Hat_checker",
	"H_Hat_tan"
	];

private _customization = profileNamespace getVariable "iyytfasdfgaf";

if (isNil "_customization") then 
{
	player forceAddUniform (selectRandom _uniforms);
	player addHeadgear (selectRandom _headgear);
} 
else 
{
	if ((_customization select 0) != "") then 
	{
		player forceAddUniform (_customization select 0);
	} 
	else 
	{
		player forceAddUniform (selectRandom _uniforms);
	};
	if ((_customization select 1) != "") then 
	{
		player addHeadgear (_customization select 1);
	} 
	else 
	{
		player addHeadgear (selectRandom _headgear);
	};
	if ((_customization select 2) != "") then 
	{
		player addGoggles (_customization select 2);
	} 
	else 
	{
		player addGoggles "";
	};
};

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

if ("direction" in AN_Skills) then {
	player linkItem "ItemGPS";
};

if ("nighthawk" in AN_Skills) then {
	player linkItem "NVGoggles_INDEP";
};

if("connected" in AN_Skills) then {
	player additem "Mattaust_Phone";
	player linkItem "tf_fadak";
};

if (life_gov select 7) then 
{
	["waterBottle",2] call life_fnc_virtualItemAdd;
	["apple",2] call life_fnc_virtualItemAdd;
};

life_gear = [] call life_fnc_hewudefr;
