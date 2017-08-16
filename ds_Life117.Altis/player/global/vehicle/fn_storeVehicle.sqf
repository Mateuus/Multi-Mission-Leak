private["_nearVehicles","_vehicle","_action","_rebelVehicles","_timer","_armedVehicles"];
_timer = 0;
_action = [
	"You are about to attempt to store the nearest vehicle to the npc",
	"Store Vehicle!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(DS_storingVehicle)exitwith{};

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],60]; //Fetch vehicles within 60m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};
_armedVehicles = ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","B_MRAP_01_hmg_F"];
_timer = _vehicle getVariable ["timer",serverTime];
_timer = _timer + 1200;
//if((typeOf _vehicle in _armedVehicles)&&(serverTime < _timer))exitwith{hint "This vehicle can not be stored as it has been too recently retrieved"};
if(isNil "_vehicle") exitWith {hint "There is no vehicle close enough to the NPC to store"};
if(isNull _vehicle) exitWith {};
_rebelVehicles = ["B_Heli_Attack_01_F","B_MRAP_01_hmg_F","O_MRAP_02_F","I_MRAP_03_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"];
if((playerside == civilian)&&((typeOf _vehicle in _rebelVehicles)&&((player distance reb_1_1_1 > 200)&&(player distance reb_1_1_2 > 200)&&(player distance reb_1_1 > 200)&&(player distance adminSpawn > 200)&&(player distance clanBase1 > 200)&&(player distance clanBase2 > 200)&&(player distance clanBase3 > 200)&&(player distance clanBase4 > 200)&&(player distance clanBase5 > 200)&&(player distance clanBase7 > 200)&&(player distance clanBase8 > 200))))exitWith
	{
	hint "This vehicle type can only be stored at rebel outpost";
	};
[[_vehicle,false,player],"HUNT_fnc_storeVehicle",false,false] spawn BIS_fnc_MP;
hint "Storing Vehicle";
DS_storingVehicle = true;