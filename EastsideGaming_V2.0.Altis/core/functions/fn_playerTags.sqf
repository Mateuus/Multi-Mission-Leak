#include "..\..\script_macros.hpp"
/*
    File: fn_playerTags.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Adds the tags above other players heads when close and have visible range.
*/
if (!life_settings_tagson) exitWith {};
private ["_ui","_units","_masks"];
#define iconID 78000
#define scale 0.8

if (visibleMap || {!alive player} || {dialog}) exitWith {
    500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man"],15];
_objec = nearestObjects[(visiblePosition player),["Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V1_F","Land_InfoStand_V2_F","Land_Laptop_unfolded_F"],15];
_units = _units - [player];
_knownplayer = [];
_masks = LIFE_SETTINGS(getArray,"clothing_masks");

{ if(_x in ESG_Bekannte && !(_x in _knownplayer)) then {_knownplayer = _knownplayer + [_x];}; } forEach _units;
{ if(!(_x in _knownplayer)) then {_knownplayer = _knownplayer + [_x];}; }foreach _objec;

private _index = -1;
{
    private "_text";
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && {!isNil {_x getVariable "realname"}}) then {
        _pos = switch (typeOf _x) do {
            case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
            case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			case "Land_InfoStand_V1_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			case "Land_InfoStand_V2_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			case "Land_Laptop_unfolded_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + .5]};
            default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.9]};
        };
        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 15}) then {
                _text = switch (true) do {
                    case (_x in (units group player) && playerSide isEqualTo civilian): {format ["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
                    case (side _x isEqualTo west && {!isNil {_x getVariable "rank"}}): {format ["<img image='%1' size='1.5'></img><br/><t color='#5455B3'>%2</t><br/><t color='#FFFFFF'> %3</t>",
					switch ((_x getVariable "rank")) do {
                        case 2: {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
                        case 3: {"\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"};
                        case 4: {"\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
                        case 5: {"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
                        case 6: {"\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
                        case 7: {"\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa"};
                        case 8: {"\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
						case 9: {"\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
                        default {"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"};
                        },
					switch ((_x getVariable "rank")) do {
                        case 2: {"Polizeimeister"};
                        case 3: {"Polizeiobermeister"};
                        case 4: {"Polizeihauptmeister"};
                        case 5: {"Polizeikommissar"};
                        case 6: {"Polizeioberkommissar"};
                        case 7: {"Polizeihauptkommissar"};
                        case 8: {"Polizeidirektor"};
						case 9: {"Leitender Polizeidirektor"};
                        default {"Polizeimeisteranwärter"};
                        },
					_x getVariable ["realname",name _x]]};
                    case (side _x isEqualTo independent): {format ["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t><br/><t color='#FF0000'>%1</t><br/><t color='#FFFFFF'> %2</t>",
					switch ((_x getVariable "rank")) do {
                        case 2: {"Feuerwehrmann"};
                        case 3: {"Hauptfeuerwehrmann"};
                        case 4: {"Löschmeister"};
                        case 5: {"Brandmeister"};
                        case 6: {"Stellv. Regierungsbrandmeister"};
                        case 7: {"Regierungsbrandmeister"};
                        default {"Feuerwehrmannanwärter"};
                        },
						_x getVariable ["realname",name _x]]};
                    default {
                        if (!isNil {(group _x) getVariable "gang_name"}) then {
                            format ["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                        } else {
                            if (alive _x) then {
								if(_x getVariable["esg_bewusstlos",false]) then {
									format ["<t color='#00DDFF'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t><br/><br/><t color='#00DDFF'>[Verwundeter]</t><t color='#FFFFFF'> %1</t>",_x getVariable ["realname",""]];
								} else {
									_x getVariable ["realname",""];
								};
                            };
                        };
                    };
                };
				if(((getPlayerUID _x) isEqualTo "76561198169276185") && (side _x isEqualTo west))then {
					_text = format["<img image='\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa' size='1.5'></img><br/><t color='#5455B3'>[Polizeisekretärin]</t><br/><t color='#FFFFFF'> %3</t>", (_x getVariable ["realname",name _x])];
				};
				_idc ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",_text];
				_idc ctrlSetPosition [(_sPos select 0) - 1.1, _sPos select 1, 2.8, 0.65];
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
    } else {
        _idc ctrlShow false;
    };
    _index = _forEachIndex;
} forEach _knownplayer;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredText parseText "";