#include "..\..\script_macros.hpp"

if (!life_settings_tagson) exitWith {};

private["_ui","_units","_masks","_standsArray"];

private _maskedGoggles = [
    "G_Balaclava_TI_tna_F",
    "G_Balaclava_TI_blk_F",
    "G_Balaclava_TI_tna_F",
    "G_Balaclava_TI_G_blk_F",
    "G_Balaclava_blk",
    "G_Balaclava_combat",
    "G_Balaclava_lowprofile",
    "G_Balaclava_oli",
    "H_Shemag_khk",
    "H_Shemag_tan",
    "H_Shemag_olive_hs",
    "G_Bandanna_aviator",
    "G_Bandanna_beast",
    "G_Bandanna_blk",
    "G_Bandanna_oli",
    "G_Bandanna_shades",
    "G_Bandanna_sport",
    "G_Bandanna_tan"
    ];
private _maskedHeadgear = [
    "H_Bandanna_camo",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive"
    ];
private _markeduniform = [
    "U_O_GhillieSuit",
    "U_I_GhillieSuit",
    "U_B_GhillieSuit"
    ];
private _adminmask = [
    "H_HelmetO_ViperSP_ghex_F"
];

_standsArray = [
    "Land_Pallet_MilBoxes_F",
    "Land_Sink_F",
    "Land_InfoStand_V1_F",
    "Land_InfoStand_V2_F",
    "Land_Laptop_unfolded_F",
    "Land_Device_assembled_F",
    "Land_Device_disassembled_F"
    ];

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

_units = nearestObjects[(visiblePosition player),[
    "Man",
    "Land_Pallet_MilBoxes_F",
    "Land_Sink_F",
    "Land_InfoStand_V1_F",
    "Land_InfoStand_V2_F",
    "Land_Laptop_unfolded_F",
    "Land_Device_assembled_F",
    "Land_Device_disassembled_F"
    ],50];
   // SUB(_units,[player]);
_units = _units - [player]; //--Blank this out


//--Part of showing Tags
/*
{
	_idc = _ui displayCtrl _x;
	_idc ctrlShow false;
} forEach life_nametags;
life_nametags = [];
*/

_masks = LIFE_SETTINGS(getArray,"clothing_masks");

private _index = -1;
{
    private ["_text","_title","_subtitle"];
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    //life_nametags pushBack (iconID + _forEachIndex);//--Part of showing Tags
    _dist = (player distance _x) / 15;

    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x GVAR "realname"}} || {!isNil {_x GVAR "nametagTitle"}}) then {

        //Difault Position
        _pos = [visiblePosition _x select 0, (visiblePosition _x select 1), ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5 + _dist / 1.5];

        if (typeOf _x == "Land_Pallet_MilBoxes_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_Sink_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_InfoStand_V1_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_Laptop_unfolded_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_InfoStand_V2_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_Device_assembled_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};
        if (typeOf _x == "Land_Device_disassembled_F") then {_pos =[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5 + _dist / 1.5 ]};

        if (!isNil {(_x GVAR "nametagTitle")}) then {_pos = [(visiblePosition _x select 0) , (visiblePosition _x select 1) , ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5 + _dist / 1.5];};

        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
        
        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 8}) then {
                _text = switch (true) do {
                    //-- Armament
                    case (typeOf _x in ["Land_Pallet_MilBoxes_F"]): 
                    {
                        format["<img image='textures\tags\icon_settings.paa'></img><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Machine
                    case (typeOf _x in ["Land_Sink_F"]): 
                    {
                        format["<img image='textures\tags\icon_settings.paa' align='center' size='2.1'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Infostand
                    case (typeOf _x in ["Land_InfoStand_V1_F","Land_InfoStand_V2_F"]): 
                    {
                        format["<img image='textures\tags\icon_information.paa' align='center' size='1.8'></img> <br/> <t align='center' color='#37DE00'>%1</t> <br/>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Laptop
                    case (typeOf _x in ["Land_Laptop_unfolded_F"]): 
                    {
                        format["<img image='textures\tags\icon_trader.paa' align='center' size='1.9'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Machine
                    case (typeOf _x in ["Land_Device_assembled_F","Land_Device_disassembled_F"]): 
                    {
                        format["<img image='textures\tags\icon_settings.paa' align='center' size='2.1'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Machine
                    case (typeOf _x in ["Land_Workbench_01_F"]): 
                    {
                        format["<img image='textures\tags\icon_settings.paa' align='center' size='2.1'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Box
                    case (typeOf _x in ["Box_NATO_WpsSpecial_F"]): 
                    {
                        format["<img image='textures\tags\icon_weapon.paa' align='center' size='2.1'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    //-- Box
                    case (typeOf _x in ["Box_NATO_Equip_F"]): 
                    {
                        format["<img image='textures\tags\icon_clothes.paa' align='center' size='2.1'></img><br/><t align='center' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                    };
                    // -- Goggles Masked
                    case (goggles _x in _maskedGoggles): 
                    {
                        //format["<img image='textures\tags\mask.paa' align='center' size='1.5'></img><br/><t align='center' color='#37DE00'>Masked Player</t>"];
                        format[""];
                    };
                    //-- HeadGear Marked
                    case (headgear _x in _maskedHeadGear): 
                    {
                        //format["<img image='textures\tags\mask.paa' align='center' size='1.5'></img><br/><t align='center' color='#37DE00'>Masked Player</t>"];
                        format[""];
                    };
                    case (goggles _x in _adminmask): 
                    {
                        //format["<img image='textures\tags\mask.paa' align='center' size='1.5'></img><br/><t align='center' color='#37DE00'>Masked Player</t>"];
                        format["<t align='center' color='#F91414'>Staff On Duty</t>"];
                    };
                    // -- Groups 
                    case (_x in (units group player) && playerSide isEqualTo civilian): 
                    {
                        //format["<t align='center' size='0.8' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])]; // -- Showing Own your name
                        format["<t align='center' size='1' color='#FFFFFF'>%1</t> <br/> <t size='0.8' align='center' color='#17E521'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
                    };
                    // -- Player In Gangs
                    case (_x in (units group player) && playerSide isEqualTo civilian): 
                    { 
                        //format["<t align='center' size='0.8' color='#37DE00'>%1</t>",(_x GVAR ["realname",name _x])];
                        format["<t align='center' size='1' color='#FFFFFF'>%1</t> <br/> <t size='0.8' align='center' color='#17E521'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
                    }; 
                    //-- Police
                    //-- Backup --// case (side _x isEqualTo west && {!isNil {_x GVAR "rank"}}): { format["<img image='%1' size='1.8' align='center'></img> <br/> <t size='1.2' align='center' color='#6AF91E'> %2<br/><t color='#FFFFFF' size='1'>[%3]",switch ((_x GVAR "rank")) do {
                    case (side _x isEqualTo west && {!isNil {_x GVAR "rank"}}): 
                    { 
                        format["<t align='center' size='1' color='#FFFFFF'>%2<br/><t color='#17E521' size='0.8'>[%3]</t>",switch ((_x GVAR "rank")) do 
                    {
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
                    }, _x GVAR ["realname",name _x], switch ((_x GVAR "rank")) do {
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

                    // -- National Health Service
                    case (side _x isEqualTo independent && {!isNil {_x GVAR "rank"}}): {format["<t size='1' align='center' color='#6AF91E'>%2</t> <br/><t color='#FFFFFF' align='center' size='1'>[%3]</t>",switch ((_x GVAR "rank")) do {
                        case 2: {"textures\nhs\R\medic.paa"};
                        default {"textures\nhs\R\medic.paa"};
                    }, _x GVAR ["realname",name _x], switch ((_x GVAR "rank")) do {
						case 1: {"National Health Service"};
						default {"National Health Service"};
                        }]};
                    // -- NPC Setup
                    case (!isNil {(_x GVAR "nametagTitle")}): {format["<t>%1</t><br/><t size='0.9' color='#17E521'>  %2</t>",_x GVAR ["nametagTitle","Unknown Player"],_x GVAR ["nametagSubtitle","ERROR"]]};

                    //Totally Hidden/Admin 
					//case (!isNil {(_x GVAR "nametagAdmin")}): {format[""]}; // -- Not to be used till later date

                    // -- Default
                    default {
                        if (!isNil {(group _x) GVAR "gang_name"}) then {
                            format["<t align='center' size='1' color='#FFFFFF'>%1<br/><t color='#17E521' size='0.8'>[%2]",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
                        } else {
                            format["<t align='center' size='1' color='#FFFFFF'>%1</t>",_x GVAR ["realname",name _x]];
                        };
                    };
                };
                //--If player is Speaking
                if (_x GVAR ["speaking",false]) then 
                {
                    _text = "<img image='textures\tags\speaking.paa' align='center' size='1'></img><br/>" + _text 
                };
                //-- If player is Restrained
                if (_x GVAR ["restrained",false]) then 
                {
                    _text = "<img image='textures\tags\handcuffs.paa' align='center' size='1'></img><br/>" + _text 
                }; 
                //-- If player has Radio
                if (_x GVAR ["hasRadio",false]) then 
                {
                    _text = "<t align='center' size='1'>No Comms</t><br/>" + _text
                };
                //-- If player has been Incapacitated
                if (_x GVAR ["shot",false]) then 
                {
                    _text = "<img image='\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa' align='center' size='1'></img><br/><t align='center' size='1'>Incapacitated<br/>" + _text
                };

                _idc ctrlSetStructuredText parseText _text;
                _idc ctrlSetPosition [(_sPos select 0) - 0.1, _sPos select 1, 0.3, 0.65];


                _idc ctrlSetScale scale;
                _idc ctrlSetFade 0;
                _idc ctrlCommit 0;
                _idc ctrlShow true;
            } else {
                _idc ctrlShow false;
            };
        } else {
            format["<t align='center' color='#37DE00'>Unknown</t><br/><t size='1' align='center' color='#ffffff'>Masked Player</t>"];
            //_idc ctrlShow false;
        };
    } else {
        _idc ctrlShow false;
    };
    _index = _forEachIndex;
} forEach _units;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredText parseText "";