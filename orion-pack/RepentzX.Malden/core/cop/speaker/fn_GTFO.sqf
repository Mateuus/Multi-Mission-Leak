


if((call life_coplevel) < 3) exitWith {closeDialog 0; ["You need to be a PO to use this function",false,"slow"] call life_fnc_notificationSystem;};
//if (!(vehicle player = "B_MRAP_01_F")) exitWith  {closeDialog 0; ["You need to be in a Hunter to use this",false,"slow"] call life_fnc_notificationSystem;};
[vehicle player,"GTFO"] remoteexeccall ["say3D",0];
closeDialog 0;