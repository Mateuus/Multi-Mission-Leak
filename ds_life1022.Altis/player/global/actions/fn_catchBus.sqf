/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Allows players to travel fast around the map
*/

private["_playerPos","_location","_cost","_time"];
_location = DS_className;
_inCar = false;
_playerPos = (position player);

if(DS_convoy)exitwith{hint "You can not catch a bus while you have a convoy mission active"};
if((DS_dusting)||(DS_fuelMission))exitwith{hint "You can not catch a bus while you have a mission active"};
if((player distance (getMarkerPos _location)) < 100)exitwith{hint "You are already there silly"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

switch(true)do
	{
	case (player distance (getMarkerPos _location) < 5000):{_time = 30;_cost = 400;};
	case (player distance (getMarkerPos _location) < 10000):{_time = 60;_cost = 800;};
	case (player distance (getMarkerPos _location) < 20000):{_time = 90;_cost = 1600;};
	default {_time = 120;_cost = 2000;};
	};
_time = (time + _time);
while{true}do
	{
	_str = parseText format ["
	<t color='#01DF01' size='1.5'><br/>Altis Public Transport<br/></t><br/>
	<t color='#FFFFF3'> Cost </t><t color='#00BFFF'>$%1 </t><br/><br/>
	<t color='#FFFFF3'> Time until arrival </t><t color='#00BFFF'>%2 seconds</t><br/><br/><br/><br/>
	<t color='#FFFFF'> Payment will be removed at arrival time, be sure to remain in this area until the timer is finished</t><br/><br/><br/>
	<t color='#FFFFF'> To cancel, simply leave the bus stop area </t>
	",_cost,round(_time - time)];
	hintSilent _str;
	sleep 1;
	if(player distance _playerPos > 10)exitwith{};
	if(!isNull objectParent player)exitwith{};
	if(DS_tazed)exitwith{};
	if(!alive player) exitWith{};
	if(time >= _time)exitwith{};
	};
DS_doingStuff = false;
//People wonna exploit me? Ill exploit them :)
if(DS_fuelMission) exitwith
	{
	player setPos (getMarkerPos "cop_spawn_1");
	hint "You got mugged while catching the bus, a passer-by picked you up and dropped you off at the Police HQ";
	systemchat "You got mugged while catching the bus, a passer-by picked you up and dropped you off at the Police HQ";
	DS_fuelMission = false;
	deleteMarkerLocal "fueldeliverymarker";
	player setDamage 0.5;
	DS_coin = 666;
	};
if([player,15,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not catch a bus with police nearby","PLAIN"];};
if([_cost,false] call DS_fnc_checkMoney)exitwith{hint "You did not have enough money to pay the bus fare"};
if(!isNull objectParent player)exitwith{hint "You cant catch a bus while inside a vehicle"};
if(DS_tazed) exitWith {};
if(!alive player) exitWith {};
if(player distance _playerPos > 10)exitwith{hint "You moved too far to be transported"; systemchat "You moved too far to be transported"};

[_cost,false,false] call DS_fnc_handleMoney;
player setPos (getMarkerPos _location);

hint "You have arrived at your destination";
systemchat "You have arrived at your destination";


/*   L A T E R 
{
	if(((side _x) isEqualTo west)&&(_x distance _playerPos < 200))then {
		[0,format ["A wanted person has used the bus in this area recently to travel to %1","?"],true,0] remoteExecCall ["DS_fnc_globalMessage",_x];
	};
}forEach playableUnits;
*/
if((DS_infoArray select 13) == 3)then {
	if(((position player) distance _playerPos) > 5000)then {
		[0] call DS_fnc_questCompleted;
	};
};