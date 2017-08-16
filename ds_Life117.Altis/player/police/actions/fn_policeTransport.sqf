/*
	File: fn_policeTeleport.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Allows police to fast travel around the map
*/
private["_playerPos","_location","_inCar","_truck","_exit"];
_location = DS_className;
_inCar = false;
_playerPos = (position player);
_exit = false;

if((player distance (getMarkerPos DS_className)) < 100)exitwith{hint "You are already there silly"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

systemchat "You will be transported to your location in 30 seconds";
hint "You will be transported to your location in 30 seconds";

if((player getVariable ["policeSquad",""]) == "Rapid Response")then
	{
	sleep 5;
	}
	else
	{
	sleep 30;
	};
	
if((_location == "Police CP_1_1")&&((cp1 getVariable ["taking",false])||(cp1 getVariable ["captured",false])))exitwith{hint "You can not transport to this checkpoint while it is not under police control";DS_doingStuff = false;};
if((_location == "Police CP_1_1_1")&&((cp2 getVariable ["taking",false])||(cp2 getVariable ["captured",false])))exitwith{hint "You can not transport to this checkpoint while it is not under police control";DS_doingStuff = false;};
if((_location == "Police CP_1_1_1_1")&&((cp3 getVariable ["taking",false])||(cp3 getVariable ["captured",false])))exitwith{hint "You can not transport to this checkpoint while it is not under police control";DS_doingStuff = false;};

if((vehicle player) != player)exitwith{hint "You cant transport while inside a vehicle";DS_doingStuff = false;};
if(DS_tazed) exitWith {DS_doingStuff = false;};
if(!alive player) exitWith {DS_doingStuff = false;};
if(player distance _playerPos > 30)exitwith{hint "You moved to far to be transported"; systemchat "You moved to far to be transported";DS_doingStuff = false;};
DS_doingStuff = false;
if(_location == "45")then
	{
	{
		if(_x getVariable ["isMCU",false])then
			{
			_truck = _x;
			};
	}forEach vehicles;
	if(isNull _truck)exitwith{hint "There is currently no MCU active";_exit = true;};
	if((miscInfoArray select 7)&&(DS_copLevel == 0))exitwith{hint "You can not transport to the MCU while public cops are locked"};
	if((_truck getVariable ["packed",false])&&((player getVariable ["policeSquad",""]) != "Rapid Response"))exitwith{hint "The MCU must be setup to transport to it";_exit = true;};
	if(count crew _truck < 6)then
		{
		player moveInCargo _truck;
		}
		else
		{
		hint "There is no room for you in the truck at this time";
		};
	}
	else
	{
	player setPos (getMarkerPos _location);
	};
if(_exit)exitwith{};
if(isNull _truck)exitwith{hint "There is currently no MCU active"};	
hint "You have arrived at your destination";
systemchat "You have arrived at your destination";

