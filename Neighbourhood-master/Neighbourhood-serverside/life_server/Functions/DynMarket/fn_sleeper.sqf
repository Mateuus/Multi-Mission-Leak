 
 
 
 
 
 
 
 
 
 
while {true} do { 
sleep (DYNMARKET_PriceUpdateInterval*60); 
[[0],"life_fnc_update",true,false] spawn life_fnc_MP; 
sleep 5; 
[] spawn TON_fnc_calculatePrices; 
DYNMARKET_UpdateCount = DYNMARKET_UpdateCount + 1; 
if ((DYNMARKET_UpdateCount==DYNMARKET_CreateBackupInterval)&&DYNMARKET_CreateBackups) then { 
[] spawn { 
DYNMARKET_UpdateCount = 0; 
[0] call TON_fnc_HandleDB;  
}; 
}; 
};