/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns information on your cursorTarget
*/

private ["_cursorTarget","_nameString","_targetsGang"];

if(DS_tags)exitWith{};

_cursorTarget = cursorTarget;
if((_cursorTarget isKindOf "Car")||(_cursorTarget isKindOf "Air")||(_cursorTarget isKindOf "Ship")||(_cursorTarget isKindOf "Tank"))exitWith {
	DS_tags = false;
};

DS_tags = true;
_nameString = "";

if(_cursorTarget getVariable ["player",false])then {
	if((side _cursorTarget) isEqualTo west)then {
		_nameString = format ["<t size='0.7' color='#01DF01'>Officer %1</t>",_cursorTarget getVariable ["name","Unknown Officer"]];
	} else {
		_targetsGang = (group _cursorTarget) getVariable ["gangName","No Gang"];
		_nameString = format ["<t size='0.7' color='#01DF01'>%1 (%2)</t>",_cursorTarget getVariable ["name","Unknown Civilian"],_targetsGang];
	};
};

[_nameString,0.5,0.4,3,0,0,3] spawn BIS_fnc_dynamicText;

sleep 3;
DS_tags = false;