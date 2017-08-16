/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Shows a log of recently planted C4's and safe crackers
*/

private ["_action","_latest","_string"];

_action = [
	"This is possibly a meta-gaming exploit, only use this when really needed",
	"Important",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_latest = [];

if((count DS_doneStuff) > 10)then {
	_latest = DS_doneStuff select [((count DS_doneStuff)-10),(count DS_doneStuff)];
} else {
	_latest = DS_doneStuff;
};

_string = "<t color='#55dd06' size='1.8'>Plant History</t><br/><br/>";

if(!(_latest isEqualTo []))then {
	{
		_string = format [
			"%1<t color='#cdcdcd'>%2</t> %3 at the <t color='#cdcdcd'>%4</t> (%5m ago)<br/><br/>",
			_string,
			(_x select 0),
			(_x select 1),
			(_x select 2),
			round ((time - (_x select 3))/60)
		];
	} forEach _latest;
};

hint parseText _string;