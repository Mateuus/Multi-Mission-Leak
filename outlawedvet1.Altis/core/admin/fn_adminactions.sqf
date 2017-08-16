#include "..\..\script_macros.hpp"
/*
    File: fn_adminactions.sqf
    Author: RPGforYOU from outlawed-veterans.com
	
	Description:
	Pushes the Admin action on the targetted player + the messages that come with it. 

*/
private["_action","_unit","_message"];
_action = [_this,1,-1,[0]] call BIS_fnc_param;
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNull _unit) exitWith {hint "No unit";};
_message = ctrlText 2950;

switch (_action) do {
	//Kick
	case 1: {
	if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
	[1,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_kick",true,[_unit getVariable["realname",name _unit],profileName,_message]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You kicked: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Tempban
	case 2: {
	if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
	[2,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_tempban",true,[_unit getVariable["realname",name _unit],profileName,_message]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You temp banned: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Combatlog
	case 3: {
	if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
	[3,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_combatlog",true,[_unit getVariable["realname",name _unit],profileName,_message]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You Combatlog banned: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	// Permban
	case 4: {
	if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0;};
	[4,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_permban",true,[_unit getVariable["realname",name _unit],profileName,_message]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You perm banned: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};	
	//Blacklist
	case 5: {
	if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
	[5,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_blacklist",true,[_unit getVariable["realname",name _unit],profileName,_message]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You blacklisted: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 1
	case 6: {
	[6,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 2
	case 7: {
	[7,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 3
	case 8: {
	[8,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//Army Rank 4
	case 9: {
	[9,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_army",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 1
	case 10: {
	[10,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 2
	case 11: {
	[11,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 3
	case 12: {
	[12,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT Rank 4
	case 13: {
	[13,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//SWAT DEMOTION
	case 14: {
	[13,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
	//ARMY DEMOTION
	case 15: {
	[13,[profileName]] remoteExecCall ["life_fnc_adminreactions",_unit];
	[0,"STR_RPG4YOU_promotion_swat",true,[_unit getVariable["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast"];
	hint parseText format["<t color='#00ff00'><t align='center'><t size='1'>EXECUTED<br/><br/></t><t color='#FFFFFF'>You PROMOTED: </t><t color='#8cff9b'>%1</t>!",_unit getVariable["realname",name _unit]];
	closeDialog 0;
	};
};

