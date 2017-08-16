/*
	File: fn_vehicleGarage.sqf
	Author: Skalicon

	Description:
	Handles everything that happens when you open the vehicle garage.
*/
private ["_marker","_unit"];

_unit = objNull;
if (!isNull cursorObject && (player distance cursorObject) < 20 && cursorObject isKindOf "House" && (typeOf cursorObject in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_Garage_V1_dam_F","Land_i_Shed_Ind_F","Land_HouseA","Land_HouseB","Land_HouseB1","Land_HouseC_R","Land_HouseA1_L","Land_HouseB1_L","Land_HouseC1_L","Land_HouseA1","Land_HouseDoubleAL","Land_HouseDoubleAL2","Land_House_Big_02_F","Land_House_Big_03_F"]) && ((cursorObject in life_houses) || ((cursorObject getVariable["life_locked", 1]) == 0))) then
{ _unit = cursorObject; }
else
{ _unit = _this select 0; };

if (isNull _unit) exitWith {};
if ((player distance _unit) > 10) exitWith {hint"You are too far away to use this NPC."};
if (vehicle player != player) exitWith {hint"You cannot use this NPC while in a vehicle."};

if (typeName (_this select 3) == "ARRAY") then
{
	life_garage_type = (_this select 3) select 0;
	if (typeName ((_this select 3) select 1) == "STRING") then
	{
		[(_this select 3) select 1] call life_fnc_getSpawnMarker;
	}
	else
	{
		life_veh_sp = if (typeName ((_this select 3) select 1) == "ARRAY") then { ((_this select 3) select 1) select 0 } else { (_this select 3) select 1 };
	};
}
else
{
	if (_unit isKindOf "House") then
	{
		_marker = format["%1", [_unit] call life_fnc_getBuildID];
		if ((getMarkerPos _marker) select 0 == 0) then
		{
			_pos = switch (typeOf _unit) do
			{
				case "Land_HouseDoubleAL";
				case "Land_HouseDoubleAL2": { _unit modelToWorld [-6.54,-8.95,0] };
				case "Land_HouseA": { _unit modelToWorld [4.79,-1.92,0] };
				case "Land_HouseA1";
				case "Land_HouseB";
				case "Land_HouseB1": { _unit modelToWorld [4.68,-1.7,0] };
				case "Land_HouseC_R": { _unit modelToWorld [4.71,-1.58,0] };
				case "Land_HouseA1_L";
				case "Land_HouseB1_L";
				case "Land_HouseC1_L": { _unit modelToWorld [-3.16,-1.81,0] };
				case "Land_House_Big_02_F": { _unit modelToWorld [8,7,-1] };
				case "Land_House_Big_03_F": { _unit modelToWorld [8,-3.2,-2.8] };
				default { position _unit };
			};
			_dir = switch(typeOf _unit) do
			{
				case "Land_House_Big_02_F";
				case "Land_House_Big_03_F": { (direction _unit) + 90 };
				default { (direction _unit) - 90 };
			};
			_marker = createMarker [_marker, _pos];
			_marker setMarkerDir _dir;
			_marker setMarkerAlpha 0;
		};
		life_veh_sp = _marker;
	}
	else
	{
		[] call life_fnc_getSpawnMarker;
	};
	life_garage_type = _this select 3;
};
[[getPlayerUID player,playerSide,life_garage_type,player],"ASY_fnc_getVehicles",false,false] spawn life_fnc_MP;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Fetching Vehicles...."];
if(playerSide != civilian) then {ctrlShow[1007,false]};
