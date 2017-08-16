params ["_garage","_plate","_newVehicle","_player","_uid","_Current_Cars"]; 
 
[_uid,"usedgarage",_current_cars] spawn server_fnc_setvariable; 
 
_player setvariable ["garage",_garage,false]; 
 
_checkstr = format ["updateVehClass:%1:%2", _newVehicle, _Plate]; 
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery; 
