/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Picks up money using the scroll wheel rather than the windows key
*/

if(DS_doingStuff) exitWith {};
DS_doingStuff = true;
private["_obj","_val","_player","_money"];

_player = (name player);
_money = (nearestobjects [getpos player, ["Land_Money_F"],  4] select 0);
_val = (_money getVariable "item") select 1;

if(isNil {_val}) exitWith {DS_doingStuff = false;};
if((isNull _money)||(player distance _money > 4)) exitWith {DS_doingStuff = false;};
if((_money getVariable["PickedUp",false])) exitWith {DS_doingStuff = false;hint "The money is too far away"};
_money setVariable["PickedUp",TRUE,TRUE];

if(_val > 500000)then
	{
		{
		if(_x getVariable ["DSAdmin",false])then
			{
			[[_player,_val],"DS_fnc_moneyPickup",_x,false] spawn BIS_fnc_MP;	
			};
		};
	};
	
deleteVehicle _money;
waitUntil{(isNull _money)};

switch (true) do
	{
	case (_val > 20000000) : {_val = 50000;};
	case (_val > 10000000) : {_val = 250000;};
	default {};
	};
	
player playmove "AinvPknlMstpSlayWrflDnon";

if(playerside != west)then
	{
	titleText[format["You have picked up $%1",[_val] call DS_fnc_numberText],"PLAIN"];
	[_val,false,true] spawn DS_fnc_handleMoney;
	}
	else
	{
	titleText[format["You have picked up $%1, you kept $%2 and $%3 was stored in the police bank",[_val] call DS_fnc_numberText,[(_val/10)] call DS_fnc_numberText,[((_val/10)*9)] call DS_fnc_numberText],"PLAIN"];
	[(_val/10),false,true] spawn DS_fnc_handleMoney;
	[[((_val/10)*9),true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
	};
sleep 2;
DS_doingStuff = false;
