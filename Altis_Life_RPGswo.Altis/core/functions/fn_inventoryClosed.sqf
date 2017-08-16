/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
	
	
	Modyfyed from MarkusSR1984
	
*/
private["_container"];
_container = param [1,ObjNull,[ObjNull]];
if(isNull _container) exitWith {_container setVariable["DWEV_INVENTORY_OPEN",false,true];};
if ((player getVariable["DWEV_paintball_dome",false]) || (player getVariable["DWEV_paintball_arena",false])) exitWith {_container setVariable["DWEV_INVENTORY_OPEN",false,true];}; // Speicherblockade in der Paintball Arena

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then 
{
Private _boxID = _container getVariable["containerID",-1];
Private _exit = false;
Private _house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];

if(_boxID isEqualTo -1) exitWith {};
	
	switch(true) do 
	{
		case (count _house isEqualTo 0): {_exit = true;};
		case (count _house isEqualTo 1): {_house = _house select 0;};
		default 
		{
			{
				if(_x isKindOf "House_F") exitWith 
				{
					_house = _x;
				};
				false
			} count _house;
		};
	};
	if(_exit /*OR !(_house isKindOf "House_F")*/) exitWith //Wenn Kiste außerhalb des Hauses fallen gelassen wird.
	{
	systemChat "Fehler beim Speichern der Lagerkisten, Konnte kein Haus finden?";
	_container setVariable["DWEV_INVENTORY_OPEN",false,true];
	[8,player,"UseBox",format ["%1 mit ID %2",(typeOf (_container)),_boxID]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	[_container] remoteExec ["DWF_fnc_updateHouseContainerInventory",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	[3] call SOCK_fnc_updatePartial;
	};

	if(!(_house in DWEV_vehicles) && {(_house getVariable ["locked",false])} && {(_container getVariable ["BoxRobbed",false])}) exitWith {_container setVariable["DWEV_INVENTORY_OPEN",false,true];}; // Spieler hatte keine berechtigung die Lagerkiste zu öffnen und der Dialog wurde automatisch geschlossen
	
	[_container] remoteExec ["DWF_fnc_updateHouseContainerInventory",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	[3] call SOCK_fnc_updatePartial;
};

if (((side player) != Civilian) || vehicleEnablefullsafe_I) then
{
	if(((_container iskindof "LandVehicle") || (_container iskindof "Air") || (_container iskindof "Ship")) && (_container in DWEV_vehicles || _container in DWEV_robbed_vehicles) && _container getVariable["DWEV_INVENTORY_OPENER",getPlayerUID player] == getPlayerUID player) then 
	{
		_container setVariable["DWEV_INVENTORY_OPEN",false,true];
		[_container,player] remoteExec ["DB_fnc_saveVehInventory",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		[3] call SOCK_fnc_updatePartial;
	};
}
else
{
	if(((_container iskindof "LandVehicle") || (_container iskindof "Air") || (_container iskindof "Ship")) && (_container in DWEV_vehicles || _container in DWEV_robbed_vehicles) && _container getVariable["DWEV_INVENTORY_OPENER",getPlayerUID player] == getPlayerUID player) then 
	{
		_container setVariable["DWEV_INVENTORY_OPEN",false,true];
//		Speicherung für Zivilisten deaktiviert im Auto
//		[_container,player] remoteExec ["DB_fnc_saveVehInventory",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		[3] call SOCK_fnc_updatePartial;
	};
};