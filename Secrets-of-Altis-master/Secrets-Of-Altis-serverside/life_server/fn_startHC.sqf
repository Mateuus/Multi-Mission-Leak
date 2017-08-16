_fnc = [ 
"fuelConfig", 
"gateclosed", 
"huntingZone", 
"MuellInfoSet", 
"SpawnMuell", 
"dealerPos", 
"schatzsuche", 
"rar", 
"textures", 
"helitaxi", 
"mission", 
"vegetation", 
"events", 
"SAH_reciever", 
"SAH_Transaction" 
]; 
 
{ 
(owner _this) publicVariableClient format["HClient_fnc_%1",_x]; 
} foreach _fnc; 
 
[["",SOA_fnc_initHC],"noSuspension.sqs"] remoteExecCall ["exec",_this]; 
 
diag_log format["DEBUG: %1 gestartet.",_this];