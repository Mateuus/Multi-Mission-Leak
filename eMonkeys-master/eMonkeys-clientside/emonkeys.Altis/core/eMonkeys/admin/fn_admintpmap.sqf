closeDialog 0;
openmap true;
closeDialog 0;
if(player == vehicle player) then {onMapSingleClick "player setPos [_pos select 0, _pos select 1, 0]; openmap false; onMapSingleClick '';";};
if(player != vehicle player) then {onMapSingleClick "vehicle player setPos [_pos select 0, _pos select 1, (_pos select 2) + 2]; openmap false; onMapSingleClick '';";};
Waituntil {!visibleMap};
onMapSingleClick '';