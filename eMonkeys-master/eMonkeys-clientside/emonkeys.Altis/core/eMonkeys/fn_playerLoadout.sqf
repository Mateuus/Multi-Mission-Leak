_playerside = playerside;
if(_playerside == east) then {_playerside = civilian;};
switch (_playerside) do
{
	case civilian:
	{
		RemoveAllWeapons player;
		{player removeMagazine _x;} foreach (magazines player);
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeGoggles player;
		removeHeadGear player;
		{
			player unassignItem _x;
			player removeItem _x;
		} foreach (assignedItems player);

		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};

		_clothings = ["U_C_Poloshirt_blue"];
		player forceaddUniform (_clothings select (floor(random (count _clothings))));

		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";

		[] call EMonkeys_fnc_civFetchGear;
	};
	
	case west:
	{
		RemoveAllWeapons player;
		{player removeMagazine _x;} foreach (magazines player);
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeGoggles player;
		removeHeadGear player;
		{
			player unassignItem _x;
			player removeItem _x;
		} foreach (assignedItems player);

		//Load player with default cop gear.

		player addUniform "U_Rangemaster";
		player addVest "V_Rangemaster_belt";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";

		[] call EMonkeys_fnc_saveGear;
	};
	
	case independent:
	{
		removeAllContainers player;
		removeAllWeapons player;
		player forceAddUniform "U_C_WorkerCoveralls";
		player addBackpack "B_Kitbag_cbr";
		player addItem "Medikit";
		player addItem "NVGoggles";
		player addItem "ToolKit";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		removeGoggles player;
		removeHeadGear player;
		if(hmd player != "") then {
			player unlinkItem (hmd player);
		};
	};
};