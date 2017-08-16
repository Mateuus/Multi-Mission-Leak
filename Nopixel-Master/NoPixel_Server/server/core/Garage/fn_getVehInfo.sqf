 
 
 
params ["_vehicle","_return"]; 
 
_object = _vehicle; 
_vehicle = _vehicle getvariable "information"; 
 
[_vehicle,MafiaLoan1,MafiaLoan2,_object] remoteexec ["client_fnc_vehInfoReturn",_return]; 
