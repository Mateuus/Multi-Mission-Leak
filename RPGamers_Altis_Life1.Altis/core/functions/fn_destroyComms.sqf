
private ["_unit"];
_unit = param [0,objNull,[objNull]];

player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";


_unit unassignItem "ItemMap";
_unit removeItem "ItemMap";
_unit unassignItem "ItemGPS";
_unit removeItem "ItemGPS";
_unit unassignItem "ItemRadio";
_unit removeItem "ItemRadio";

[_unit] remoteExec ["life_fnc_destroyedComms",_unit];

waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};

["Communication & Map Destroyed.",5,"blue"] call RPG_Fnc_Msg;