#include "..\..\script_macros.hpp"
/*
    File: fn_adminactions.sqf
    Author: RPGforYOU from outlawed-veterans.com
	
	Description:
	Pushes the Admin action on the targetted player + the messages that come with it. 

*/
private["_action","_unit"];
_action = [_this,1,-1,[0]] call BIS_fnc_param;
_unit = lbData[15002,lbCurSel (15002)];
_unit = call compile format["%1", _unit];
if(isNull _unit) exitWith {hint "No unit";};

switch (_action) do {
	//SWAT Rank 1
	case 10: {
	[10,[profileName]] remoteExecCall ["life_fnc_adminrspromotions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 2
	case 11: {
	[11,[profileName]] remoteExecCall ["life_fnc_adminrspromotions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 3
	case 12: {
	[12,[profileName]] remoteExecCall ["life_fnc_adminrspromotions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 4
	case 13: {
	[13,[profileName]] remoteExecCall ["life_fnc_adminrspromotions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT DEMOTION
	case 14: {
	[14,[profileName]] remoteExecCall ["life_fnc_adminrspromotions",_unit];
	[0,"STR_RPG4YOU_demoted_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
};

