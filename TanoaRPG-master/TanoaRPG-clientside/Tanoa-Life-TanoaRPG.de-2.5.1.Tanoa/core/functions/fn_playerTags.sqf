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
_goggles = ["G_Bandanna_aviator","G_Bandanna_beast","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_tna_F","G_Balaclava_TI_tna_F"];
_uniform = ["U_I_GhillieSuit","U_B_T_FullGhillie_tna_F","U_O_FullGhillie_ard","U_O_FullGhillie_sard","U_O_FullGhillie_lsh"];
_headgear = ["H_CrewHelmetHeli_B","H_HelmetCrew_0_ghex_F"];

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
    500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V2_F"],50];

_units = _units - [player];

{
    private["_text"];
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
                case ((goggles _x) in _goggles && playerSide in [civilian,west,independent]): {format["<t color='#000000'>Maskierte Person</t>"];};
                case ((headgear _x) in _headgear && playerSide in [civilian,west,independent]): {format["<t color='#000000'>Maskierte Person</t>"];};
                case ((uniform _x) in _uniform && playerSide in [civilian,west,independent]): {format["<t color='#000000'>Maskierte Person</t>"];};
                case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
				case ((_x getVariable "medicrank") > 0): {format["<t color='#FF0000'>%1 %2</t>", format["<img image='%1' size='1'></img> [Emergency Medical Service]", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"], _x getVariable ["realname",name _x]]};
				case ((_x getVariable "adacrank") > 0): {format["<t color='#FF0000'>%1 %2</t>", format["<img image='%1' size='1'></img> [Imperium]", "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"], _x getVariable ["realname",name _x]]};
				case ((_x getVariable "rank") > 0): {format["<t color='#009AFF'>%1 %2</t>",switch ((_x getVariable "rank")) do {
					case 1: {format["<img image='%1' size='1'></img> [Recruit]", "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"]};
					case 2: {format["<img image='%1' size='1'></img> [Officer]", "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"]};
					case 3: {format["<img image='%1' size='1'></img> [Sergeant]", "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"]}; 
					case 4: {format["<img image='%1' size='1'></img> [Lieutenant]", "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"]};
					case 5: {format["<img image='%1' size='1'></img> [Captain]", "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"]};
					case 6: {format["<img image='%1' size='1'></img> [Major]", "\a3\ui_f\data\gui\cfg\Ranks\Major_gs.paa"]};
					case 7: {format["<img image='%1' size='1'></img> [General]", "\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"]};
					case 8: {format["<img image='%1' size='1'></img> [Chief]", "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"]};
					case 9: {format["<img image='%1' size='1'></img> [Commissioner]", "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"]};
                    default {"[Praktikant]"};
                    },_x getVariable ["realname",name _x]]};
                case ((!isNil {_x getVariable "name"} && playerSide == independent)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
				case ((!isNil {_x getVariable "name"} && playerSide == east)): {format["<t color='#FF0000'><img image='\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
                default {
                    if(!isNil {(group _x) getVariable "gang_name"}) then {
                        format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                    } else {
                        _x getVariable ["realname",name _x];
                    };
                };
            };
            
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