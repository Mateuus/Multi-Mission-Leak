if(!life_isPlacing) exitWith {};
if(isNull life_objectPlacing) exitWith {hintSilent "Item was either already placed or packed up!";};
life_isPlacing = false;
deleteVehicle life_objectPlacing;
//life_objectPlacing = ObjNull;
if(alive player) then {["spikeStrip",1] call life_fnc_virtualItemAdd;};
