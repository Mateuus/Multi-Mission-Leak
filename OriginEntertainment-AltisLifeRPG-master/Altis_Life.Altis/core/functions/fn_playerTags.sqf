#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units","_goggles"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];

_units = _units - [player];

{
	private "_text";
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case (isPlayer _x && {(uniform _x in life_noname_clothing)}): {"";};
				case (isPlayer _x && {(headgear _x in life_hidden_clothing) || (goggles _x in life_hidden_clothing)}): {"<t size='1.2'>[Masked Person]</t>";};
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
				case (!isNil {(_x getVariable "rank")}): {format["<img image='%1' size='1.5'></img> <t size='1.2'>%2</t><br/><t size='1.1'>[%3]</t>",switch ((_x getVariable "rank")) do {
					case 1: {"icons\1.paa"};
					case 2: {"icons\2.paa"};
					case 3: {"icons\3.paa"};
					case 4: {"icons\4.paa"};
					case 5: {"icons\5.paa"};
					case 6: {"icons\6.paa"};

					default {"icons\1.paa"};
					},

					_x getVariable ["realname",name _x],
					
					switch ((_x getVariable "rank")) do {
						case 1: {"Cadet"};
						case 2: {"Corp."};
						case 3: {"Sr.Corp."};
						case 4: {"Searg."};
						case 5: {"Lieut."};
						case 6: {"Captain"};
						default {"Cop In Training"};
					}]};
				//Cop2
				case (!isNil {(_x getVariable "crank")}): {format["<img image='%1' size='1.5'></img> <t size='1.2'>%2</t><br/><t size='1.1'>[%3]</t>",switch ((_x getVariable "crank")) do {
					case 1: {"icons\1.paa"};
					case 2: {"icons\2.paa"};
					case 3: {"icons\3.paa"};
					case 4: {"icons\4.paa"};
					case 5: {"icons\5.paa"};
					case 6: {"icons\6.paa"};

					default {"icons\1.paa"};
					},

					_x getVariable ["realname",name _x],
					
					switch ((_x getVariable "crank")) do {
						case 1: {"Cadet"};
						case 2: {"Corp."};
						case 3: {"Sr.Corp."};
						case 4: {"Searg."};
						case 5: {"Lieut."};
						case 6: {"Captain"};
						default {"Cop In Training"};
					}]};
				//Medic
				case (!isNil {(_x getVariable "mrank")}): {format["<img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img> <t size='1.35'>%2</t><br/><t size='1.2'>[%1]</t>",switch ((_x getVariable "mrank")) do {
					case 1: {"Medic"};
					case 2: {"Paramedic"}; 
					case 3: {"Doctor"};
					default {"Medic In Training"};
					},_x getVariable ["realname",name _x]]};
				case ((!isNil {_x getVariable "name"} && playerSide == independent)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
				default {
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
					} else {
						_x getVariable ["realname",name _x];
					};
				};
			};
			if(_x getVariable ["speaking",false]) then {_text = "[SPEAKING] " + _text};
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;