/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_ret"];
_ret = [];

if(count life_houses > 0) then {
	{
		_pos = call compile format["%1",_x select 0];
		_house = nearestBuilding _pos;
		_housetype = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_housepos = (text (nearestLocations [_pos,["NameVillage","NameCity","NameCityCapital"],5000]select 0));
		_houseName = format["%1 - bei %2 - In Besitz",_housetype,_housepos];
		
		_ret pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
	} foreach life_houses;
};

if(license_civ_president && playerSide == civilian) then {
	_ret pushBack ["spawn_president","Das heiße Haus","\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
};

if(license_civ_esc && playerSide == civilian) then {
	_ret pushBack ["esc_spawn","Escobar Basis","\a3\ui_f\data\map\MapControl\taskicondone_ca.paa"];
};

if(license_civ_ims && playerSide == civilian) then {
	_ret pushBack ["ims_spawn","IMS Basis","\a3\ui_f\data\map\MapControl\taskicondone_ca.paa"];
};

if(license_civ_imf && playerSide == civilian) then {
	_ret pushBack ["imf_spawn","IMF Basis","\a3\ui_f\data\map\MapControl\taskicondone_ca.paa"];
};

if(license_civ_slg && playerSide == civilian) then {
	_ret pushBack ["slg_spawn","SLG Basis","\a3\ui_f\data\map\MapControl\taskicondone_ca.paa"];
};

_ret;