/*
	File: fn_policeTeleport.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Allows police to fast travel around the map
*/
private["_playerPos","_location","_inCar","_truck","_exit","_sleep"];
_location = DS_className;
_inCar = false;
_playerPos = (position player);
_exit = false;
_sleep = 30;
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
if((DS_infoArray select 10) < 13)exitwith{hint "You have not unlocked this function through the quest system yet"};
if((player distance (getMarkerPos DS_className)) < 100)exitwith{hint "You are already there silly"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

if((DS_infoArray select 10) > 23)then{_sleep = (_sleep/2);};

systemchat format ["You will be transported to your location in %1 seconds",_sleep];
hint format ["You will be transported to your location in %1 seconds",_sleep];

sleep _sleep;

if((vehicle player) != player)exitwith{hint "You cant transport while inside a vehicle";DS_doingStuff = false;};
if(DS_tazed) exitWith {DS_doingStuff = false;};
if(!alive player) exitWith {DS_doingStuff = false;};
if(player distance _playerPos > 30)exitwith{hint "You moved to far to be transported"; systemchat "You moved to far to be transported";DS_doingStuff = false;};
DS_doingStuff = false;

player setPos (getMarkerPos _location);

if(_exit)exitwith{};

hint "You have arrived at your destination";
systemchat "You have arrived at your destination";

