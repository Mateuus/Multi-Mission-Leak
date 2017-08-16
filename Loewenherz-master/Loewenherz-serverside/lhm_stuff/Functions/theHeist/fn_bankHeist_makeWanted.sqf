/* 
 Filename: fn_makeWanted.sqf 
 
 Author: Blackd0g 
 
 Description: blah 
*/ 
{ 
 
 [getPlayerUID _x,name _x,"777"] call lhm_fnc_wantedAdd; 
 
} forEach BankHeist_Team; 
diag_log "Bank Heist: Team was added to the Wantedlist";