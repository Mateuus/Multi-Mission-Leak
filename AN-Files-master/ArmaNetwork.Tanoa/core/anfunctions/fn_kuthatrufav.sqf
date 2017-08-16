/*
*/
private["_block"];
_target = param[0,objNull,[objNull]];
_player = param[1,objNull,[objNull]];
_index = param[2,-1,[-1]];
_actionName = param[3,"",[""]];
_text = param[4,"",[""]];
_priority = param[5,-1,[-1]];
_showWindow = param[6,false,[false]];
_hideOnUse = param[7,false,[false]];
_shortcut = param[8,"",[""]];
_visible = param[9,false,[false]];
_evhName = param[10,"",[""]];

if(isNull _target) exitWith {false};
_block = switch(true) do {
    case (playerSide != west && _actionName isEqualTo "OpenBag"): {true};
    case (_actionName in ["Gear","TakeWeapon","Rearm"] && (!(alive _target) || (locked _target > 0 && !(_target in life_vehicles)))): {true};
    case (player getVariable["restrained",false]): {true};
    default {false};
};
_block;
