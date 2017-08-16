#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by RafiQuak for PlayGermany
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.8
#define reachS 90 //50
#define reach 80 //15
_counter = 0;

if(visibleMap OR {dialog} OR {!alive player}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],90];

SUB(_units,[player]);

{
	private "_text";
	if (((_x in (units grpPlayer)) OR {_x in PG_knownPersons} OR {(side _x == independent) && (_x getVariable["hsd",""] in ["med","adac","thw"])} OR {playerSide == independent}) && {!isObjectHidden _x} && {vehicle _x == _x}) then {
	
		_idc = _ui displayCtrl (iconID + _counter);
		if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x GVAR "realname"}}) then {
		
			_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];			
			_sPos = worldToScreen _pos;
			_distance = _pos distance player;
			
			if(count _sPos > 1 && {_distance < 80}) then {
			
				_text = switch (side _x) do {
					case civilian: {format["<t color='#FFFFFF'>%1</t>", (_x getVariable ["realname",name _x])];};
					case west: {if (_x GVAR ["undercover",false]) then {format["<t color='#FFFFFF'>%1</t>", (_x getVariable ["realname",name _x])];} else {format["<t color='#002bff'>%1</t>",(_x GVAR ["realname",name _x])];};};
					case independent: {format["<t color='#00FF00'>%1</t>",(_x GVAR ["realname",name _x])];};
					case east: {format["<t color='#FFFFFF'>%1</t>", (_x getVariable ["realname",name _x])];};
				};
				
				if(typeName _text == "STRING") then {
				
					_idc ctrlSetStructuredText parseText _text;
					_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
					_idc ctrlSetScale scale;
					_idc ctrlSetFade 0;
					_idc ctrlCommit 0;
					_idc ctrlShow true;
					_counter = _counter + 1;
				};
			};
		};
	};
} foreach _units;

for "_x" from _counter to 110 do {
	_idc = _ui displayCtrl (iconID + _x);
	_idc ctrlShow false;
};
