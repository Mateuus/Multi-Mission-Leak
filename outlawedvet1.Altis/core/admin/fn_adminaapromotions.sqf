#include "..\..\script_macros.hpp"
/*
    File: fn_adminactions.sqf
    Author: RPGforYOU from outlawed-veterans.com
	
	Description:
	Pushes the Admin action on the targetted player + the messages that come with it. 

*/
private["_action","_unit","_message"];
_action = [_this,1,-1,[0]] call BIS_fnc_param;
_unit = lbData[16002,lbCurSel (16002)];
_unit = call compile format["%1", _unit];
if(isNull _unit) exitWith {hint "No unit";};

switch (_action) do {
	//Army Rank 1
	case 6: {
	[6,[profileName]] remoteExecCall ["life_fnc_adminrapromotions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 2
	case 7: {
	[7,[profileName]] remoteExecCall ["life_fnc_adminrapromotions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 3
	case 8: {
	[8,[profileName]] remoteExecCall ["life_fnc_adminrapromotions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 4
	case 9: {
	[9,[profileName]] remoteExecCall ["life_fnc_adminrapromotions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//ARMY DEMOTION
	case 15: {
	[13,[profileName]] remoteExecCall ["life_fnc_adminrapromotions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
};

