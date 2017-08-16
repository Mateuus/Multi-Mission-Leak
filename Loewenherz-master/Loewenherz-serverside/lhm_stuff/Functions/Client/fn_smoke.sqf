Private ["_object","_id","_color","_smoketime"]; 
 
_object = param [0,objNull,[objNull]]; 
_color = param [1,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],[[]]]; 
_smoketime = param [2,180,[0]]; 
if (isNull _object) exitWith { 
}; 
 
if (isPlayer _object) then { 
 _id = getPlayerUID _object; 
} else { 
 _id = [str(_object)] call BIS_fnc_filterString 
}; 
 
[_object] spawn compile format[' 
  Private ["_obj"]; 
  _obj = param [0,objNull,[objNull]]; 
  If !(isNil "Script_PS_%1") then { 
   terminate Script_PS_%1; 
   Script_PS_%1 = nil; 
  };  
  Script_PS_%1 = [_obj] spawn { 
   Private ["_obj"]; 
   _obj = param [0,objNull,[objNull]]; 
   if (isNull _obj) exitWith { 
   }; 
   if !(isNil "PS_%1") then { 
    if !(isNull PS_%1) then { 
     deleteVehicle PS_%1; 
    }; 
    PS_%1 =  nil; 
   };     
   PS_%1 = "#particlesource" createVehicleLocal [0,0,0];   
   PS_%1 attachto [_obj,[0,0,0],"lip"];   
   PS_%1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0] , "", "Billboard", 1, 4, [0, 0.3, 1.6], [0, 0, 0.01], 0, 10, 7.9, 0.066, [0.05, 0.5, 0.5], %2, [0.125], 1, 0, "", "", _obj];   
   PS_%1 setDropInterval 4; 
   diag_log "Created Smoke on %1 with Color %2 for %3 Sek"; 
  }; 
  sleep %3; 
  deleteVehicle PS_%1; 
 ',_id,_color,_smoketime];