 
params ["_type","_number","_player","_pos"]; 
private ["_vehspawn","_veh","_endmission"]; 
 
if(isNil "drugcount") then { drugcount = 0; }; 
 
if(_type == 1) then { drugcount = drugcount + _number; } else { drugcount = drugcount - _number; }; 
 
if(drugcount > 35) then { 
 
_roll = random (100); 
 
 
if(_roll > 50) then { 
 
drugcount = 0; 
 
if ( _pos distance [3177.83,971.563,0.00144196] > _pos distance [3687.34,6884.69,0.00143814] ) then { 
 
_endmission = [3177.83,971.563,0.00144196]; 
} else { 
_endmission = [3687.34,6884.69,0.00143814]; 
 
}; 
 
if ( _pos distance [8864.24,7599.97,0.00144005] < _pos distance [6926.55,2117.05,0.00143814]) then { 
 
if ( _pos distance [8864.24,7599.97,0.00144005] < _pos distance [900.986,7688.17,0.00143814]) then { _vehspawn = [8864.24,7599.97,0.00144005]; } else { _vehspawn = [900.986,7688.17,0.00143814];  }; 
} else { 
if ( _pos distance [6926.55,2117.05,0.00143814] < _pos distance [900.986,7688.17,0.00143814]) then { _vehspawn = [6926.55,2117.05,0.00143814]; } else { _vehspawn = [900.986,7688.17,0.00143814];  }; 
 
}; 
 
_veh = createVehicle ["ADM_GMC_Vandura",_vehspawn,[],0,"NONE"]; 
 
[_veh, ["black","Matte"]] remoteexec ["client_fnc_initVehicle",2]; 
 
_veh addMagazineCargoGlobal  ["CG_Heroin",35]; 
_veh lock 2; 
 
[_vehspawn,_endmission,currentMafia,_veh] remoteexec ["client_fnc_mafiaDrugEvent",currentMafia]; 
}; 
}; 
 
 
