#include "..\..\script_macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
if (!life_settings_tagson) exitWith {};
private["_ui","_units","_masks"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};


_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];
_units = _units - [player];

//Fix for hanging nametags on the screen
if(!isNull _ui) then {
    {
        _idc = _ui displayCtrl _x;
        _idc ctrlShow false;
    } forEach life_nametags;
};

life_nametags = [];

_masks = LIFE_SETTINGS(getArray,"clothing_masks");

{
    private "_text";
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && {!isNil {_x getVariable "realname"}}) then {
        _pos = switch (typeOf _x) do {
            case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
            case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
            default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
        };

        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 15}) then {
                _text = switch (true) do {
                    case (_x in (units group player) && playerSide isEqualTo civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
                    case (side _x isEqualTo west && {!isNil {_x getVariable "rank"}}): {format["<img image='%1' size='1'></img><t color='#42b6f4'>%3</t> %2",switch ((_x getVariable "rank")) do {
                        case 1: {"textures\Policja\ranks\kadet.paa"};
                        case 2: {"textures\Policja\ranks\posterunkowy.paa"};
                        case 3: {"textures\Policja\ranks\sierzant.paa"};
                        case 4: {"textures\Policja\ranks\starszysierzant.paa"};
                        case 5: {"textures\Policja\ranks\sierzantsztabowy.paa"};
                        case 6: {"textures\Policja\ranks\aspirant.paa"};
                        case 7: {"textures\Policja\ranks\starszyaspirant.paa"};
                        case 8: {"textures\Policja\ranks\komisarz.paa"};
                        case 9: {"textures\Policja\ranks\nadkomisarz.paa"};
                        case 10: {"textures\Policja\ranks\inspektor.paa"};
                        case 11: {"textures\Policja\ranks\nadinspektor.paa"};
                        case 12: {"textures\Policja\ranks\generalnyinspektor.paa"};
                        default {"textures\Policja\ranks\generalnyinspektor.paa"};
                        },_x getVariable ["realname",name _x],
						switch ((_x getVariable "rank")) do {
                        case 1: {"Kadet"};
                        case 2: {"Posterunkowy"};
                        case 3: {"Sierżant"};
                        case 4: {"St.Sierżant"};
                        case 5: {"Sierżant Szt."};
                        case 6: {"Aspirant"};
                        case 7: {"St. Aspirant"};
                        case 8: {"Komisarz"};
                        case 9: {"Nadkomisarz"};
                        case 10: {"Inspektor"};
                        case 11: {"Zastepca Komendanta"};
                        case 12: {"Komendant"};
                        default {"Policja"};
                        }]};
					case (side _x isEqualTo independent && {!isNil {_x getVariable "rank"}}): {format["<img image='%1' size='1'></img><t color='#fe2020'> %3</t> %2",switch ((_x getVariable "rank")) do {
                        case 1: {"textures\Medycy\rangi\mlratownik.paa"};
                        case 2: {"textures\Medycy\rangi\ratownik.paa"};
                        case 3: {"textures\Medycy\rangi\stratownik.paa"};
                        case 4: {"textures\Medycy\rangi\lekarz.paa"};
                        case 5: {"textures\Medycy\rangi\ordynator.paa"};
                        case 6: {"textures\Medycy\rangi\ordynator.paa"};
                        default {"textures\Medycy\rangi\ordynator.paa"};
                        },_x getVariable ["realname",name _x],
                        switch ((_x getVariable "rank")) do {
                        case 1: {"Mechanik"};
                        case 2: {"Ratownik"};
                        case 3: {"St.Ratownik"};
                        case 4: {"Lekarz"};
                        case 5: {"Ordynator"};
                        case 6: {"Ordynator"};
                        default {"Medyk"};
                        }]};
					default {
						if(!isNil {(group _x) GVAR "gang_name"}) then {
							format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
						} else {
							_x GVAR ["realname",name _x];
						};
					};
				};

				if(_x getVariable ["speaking",false]) then {_text = format ["<img image='\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa' size='1'></img>"];};

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
	} else {
		_idc ctrlShow false;
	};
} forEach _units;
