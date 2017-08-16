#include "..\..\script_macros.hpp"

if (!life_settings_tagson) exitWith {};

private["_ui","_units","_masks"];

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

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],60];
_units = _units - [player];

_masks = LIFE_SETTINGS(getArray,"clothing_masks");

{
    private "_text";
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {

        _pos = switch (typeOf _x) do {
            case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
            case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]}; 
            default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2) + 0.65]};
        };

        _sPos = worldToScreen _pos;
        _distance = _pos distance player;

        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 15}) then {
                _text = switch (true) do {

                    //Players In Your Gang
                    case (_x in (units group player) && playerSide isEqualTo civilian): { format["<t color='#6AF91E' size='1.2' align='center'>%1",(_x getVariable ["realname",name _x])];};
                    //Cops Under Cover
                    //case ( (!isNil {(_x getVariable "rank")}) && (!isNil {(_x getVariable "Undercover")}) && (_x getVariable "Undercover") ): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
                    //Cops
                    case (side _x isEqualTo west && {!isNil {_x getVariable "rank"}}): { format["<img image='%1' size='1.8' align='center'></img> <br/> <t size='1.2' align='center' color='#6AF91E'> %2<br/><t color='#FFFFFF' size='1'>[%3]",switch ((_x getVariable "rank")) do {
					    case 1: {"icons\cop\1.paa"};
                        case 2: {"icons\cop\2.paa"};
					    case 3: {"icons\cop\3.paa"};
					    case 4: {"icons\cop\4.paa"};
					    case 5: {"icons\cop\4.paa"};
					    case 6: {"icons\cop\5.paa"};
					    case 7: {"icons\cop\6.paa"};
					    case 8: {"icons\cop\7.paa"};
					    case 9: {"icons\cop\8.paa"};
					    case 10: {"icons\cop\12.paa"};
					    case 11: {"icons\cop\12.paa"};
					    case 12: {"icons\cop\12.paa"};
					    case 13: {"icons\cop\12.paa"};

					    default {"icons\cop\1.paa"};
                        },
                        
                        _x getVariable ["realname",name _x],

                        switch ((_x getVariable "rank")) do {
						case 1: {"Altis Police Department"};
						case 2: {"Altis Police Department"};
						case 3: {"Altis Police Department"};
						case 4: {"Altis Police Department"};
						case 5: {"Altis Police Department"};
						case 6: {"Altis Police Department"};
						case 7: {"Altis Police Department"};
						case 8: {"Altis Police Department"};
                        case 9: {"Altis Police Department"};
                        case 10: {"Altis Police Department"};
                        case 11: {"Altis Police Department"};
                        case 12: {"Altis Police Department"};
                        case 13: {"Altis Police Department"};
						default {"Altis Police Department"};
                        }]};

                    //Medics
                  //case (side _x isEqualTo independent): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img> %1",_x getVariable ["realname",name _x]]};
                    case (side _x isEqualTo independent && {!isNil {_x getVariable "rank"}}): {format["<img image='%1' size='1.6' align='center'></img> <br/> <t size='1.2' align='center' color='#6AF91E'>%2</t> <br/><t color='#FFFFFF' align='center' size='1'>[%3]</t>",switch ((_x getVariable "rank")) do {
                        case 2: {"textures\nhs\R\medic.paa"};
                        default {"textures\nhs\R\medic.paa"};
                        },
                        _x getVariable ["realname",name _x],

                        switch ((_x getVariable "rank")) do {
						case 1: {"National Health Service"};
						default {"National Health Service"};
                        }]};


                    default {
                        if (!isNil {(group _x) getVariable "gang_name"}) then {
                            format["<t size='1.2' align='center' color='#FFFFFF'>%1<br/><t size='1' align='center' color='#6AF91E'>%2",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                        } else {
                            _x getVariable ["realname",name _x];
                        };
                    };
                };


                //SPEAKING
                if(_x getVariable ["speaking",false]) then {_text = "<t color='#12cc12' size='1' align='center'>[SPEAKING]<br/></t>" + _text};

                _idc ctrlSetStructuredText parseText _text;
                //_idc ctrlSetPosition [(_sPos select 0) - 0.1, _sPos select 1, 0.4, 0.65]; // ? | X | ?
                _idc ctrlSetPosition [(_sPos select 0) - 0.1, _sPos select 1, 0.4, 0.65];
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
