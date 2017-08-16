#line 1 "an_server\init.sqf"
#line 1 "an_server\script_macros.hpp"
#line 1 "an_server\init.sqf"









{
if(!isPlayer _x) then {
_npc = _x;
{
if(_x != "") then {
_npc removeWeapon _x;
};
} forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
};
} forEach allUnits;

JxMxE_PublishVehicle = compileFinal (if(typeName "false" == "STRING") then {"false"} else {str("false")});
