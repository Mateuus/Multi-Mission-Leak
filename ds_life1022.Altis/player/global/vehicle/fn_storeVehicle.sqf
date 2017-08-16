private["_nearVehicles","_vehicle","_action","_rebelVehicles","_timer","_armedVehicles","_distance"];
_timer = 0;
_action = [
	"You are about to attempt to store the nearest vehicle to the store point",
	"Store Vehicle!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(DS_storingVehicle)exitwith{};

if(_this select 0)then
	{
	_distance = 150;
	}
	else
	{
	_distance = 60;
	};

if(!isNull objectParent player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[player,["Car","Air","Ship"],_distance]; //Fetch vehicles within 60m.
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
_armedVehicles = ["O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","B_MRAP_01_hmg_F"];

if(isNil "_vehicle") exitWith {hint "There is no vehicle close enough to the NPC to store"};
if(isNull _vehicle) exitWith {};
_rebelVehicles = ["B_APC_Wheeled_01_cannon_F","O_APC_Wheeled_02_rcws_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","B_Heli_Attack_01_F","B_MRAP_01_hmg_F","O_MRAP_02_F","I_MRAP_03_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"];
DS_vehicleGarage = [];
if((playerSide isEqualTo civilian)&&((typeOf _vehicle in _rebelVehicles)&&((player distance reb_1_1_1 > 200)&&(player distance reb_1_1_2 > 200)&&(player distance reb_1_1 > 200)&&(player distance adminSpawn > 200)&&(player distance clanBase1 > 200)&&(player distance clanBase2 > 200)&&(player distance clanBase3 > 200)&&(player distance clanBase4 > 200)&&(player distance clanBase5 > 200)&&(player distance clanBase7 > 200)&&(player distance clanBase8 > 200)&&(player distance clanBase9 > 200)&&(player distance clanBase10 > 200)&&(player distance clanBase11 > 200)&&(player distance clanBase12 > 200))))exitWith
	{
	hint "This vehicle type can only be stored at rebel outpost or clan base";
	};
[_vehicle,false,player] remoteExec ["HUNT_fnc_storeVehicle",2];
hint "Storing Vehicle";
DS_storingVehicle = true;