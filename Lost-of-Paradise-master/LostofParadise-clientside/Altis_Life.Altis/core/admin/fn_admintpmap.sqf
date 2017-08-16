closeDialog 0;
openmap true;
closeDialog 0;
onMapSingleClick "player setPos [_pos select 0, _pos select 1, 0]; openmap false; onMapSingleClick '';";
while {visibleMap} do {};
//Hat sich per Map geportet!
onMapSingleClick '';