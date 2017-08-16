/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Picks up money using the scroll wheel rather than the windows key
*/

private ["_player","_money","_amount"];

if(DS_doingStuff)exitWith{};
DS_doingStuff = true;

if(player distance (getMarkerPos "chopDrop") < 1000)exitWith{player setDamage 1;};

_player = (name player);
_money = (nearestObjects [player,["Land_Money_F"],4] select 0);
_amount = (_money getVariable "item") select 1;

if([player,10,civilian] call DS_fnc_nearbyPlayers)exitWith{DS_doingStuff = false;titleText ["You can not pickup money when another player is so nearby","PLAIN"];};
if((isNull _money)||(player distance _money > 4))exitWith{DS_doingStuff = false;};
if(isNil "_amount")exitWith{DS_doingStuff = false;deleteVehicle _money;};

if((_money getVariable ["pickedUp",false]))exitWith{DS_doingStuff = false;deleteVehicle _money;};
_money setVariable ["pickedUp",true,true];

/*
if(_amount > 500000)then {
	{
		if(_x getVariable ["DSAdmin",false])then {
			[_player,_amount] remoteExecCall ["DS_fnc_moneyPickup",_x];
		};
	} forEach allPlayers;
};
*/

deleteVehicle _money;
waitUntil {isNull _money};

switch(true)do {
	case (_amount > 20000000): {_amount = 50000;};
	case (_amount > 10000000): {_amount = 250000;};
	default {};
};

player playMove "AinvPknlMstpSlayWrflDnon";

if(!(playerSide isEqualTo west))then {
	titleText [format ["You have picked up $%1",[_amount] call DS_fnc_numberText],"PLAIN"];
	[_amount,false,true] spawn DS_fnc_handleMoney;
} else {
	titleText [format ["You have picked up $%1, you kept $%2 and $%3 was stored in the police bank",[_amount] call DS_fnc_numberText,[(_amount/10)] call DS_fnc_numberText,[((_amount/10)*9)] call DS_fnc_numberText],"PLAIN"];
	[(_amount/10),false,true] spawn DS_fnc_handleMoney;
	[((_amount/10)*9),true] remoteExec ["HUNT_fnc_policeBank",2];
};

sleep 2;
DS_doingStuff = false;