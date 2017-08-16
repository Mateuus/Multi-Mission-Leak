#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_return = [];

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		if !(license_cop_mrsf) then {_return = [
			["cop_spawn_1","Kavala","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_2","Agios","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_3","Athira","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["srt_spawn","Air HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Sofia","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];};
		if (license_cop_mrsf) then {
			_return pushBack ["mrsf_spawn","M.R.S.F. Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["srt_spawn","Air HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			
		};
		

	};
	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]

		];
		
		if (license_civ_aufenthalt) then {
			_return pushBack ["civ_spawn_2","Agios","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			
		};
		if (life_erfahrung >=4750) then {
			_return pushBack ["civ_spawn_5","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
	
		};

		if (license_civ_lotto) then {
			_return pushBack ["chaoslotto","Chaos Lotto","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			
		};
		if (license_civ_cc) then {
			_return pushBack ["cc_spawn","Crenshaw Crew","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			
		};
		if (license_civ_mrsf) then {
			_return pushBack ["mrsf_spawn","M.R.S.F. Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			
		};
		if (license_civ_pizza) then {
			_return pushBack ["pizza","Pizzaria Salvatore","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
	
		};
		if(license_civ_rebel) then {
			_return pushBack ["reb_spawn","Rebellenstadt","\a3\ui_f\data\map\MapControl\quay_ca.paa"]
		};
		if(__GETC__(life_donator) > 0) then {
			_return pushBack ["vip_spawn","Unterstützer-Camp","\a3\ui_f\data\map\MapControl\quay_ca.paa"];
		};
		/* Verlassene Militärbasis Spawn wenn eingenommen*/
		_c = (life_gangData select 0);
		_b = (nearestObjects[markerPos "hideout_4",["Land_Cargo20_vr_F"],50]) select 0;
		if(isNil {_c}) then {_c = 0};
		if(!isNil {_b getVariable "gangOwner2"} && {(_b getVariable "gangOwner2") == _c} && playerSide == civilian) then
			{
				_return = _return + [["hideout_4_spawn","Militärbasis","\a3\ui_f\data\map\MapControl\quay_ca.paa"]];
			};
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	case independent:
	{
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Airfield","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Sofia","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;