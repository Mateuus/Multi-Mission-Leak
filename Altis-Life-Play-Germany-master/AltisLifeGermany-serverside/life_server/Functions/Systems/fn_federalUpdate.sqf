/* 
 File: fn_federalUpdate.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Uhhh, adds to it? 
*/ 
private["_funds"]; 
while {true} do 
{ 
 sleep (30 * 60); 
 if (!(fed_bank getVariable["safe_open",false])) then { 
  _funds = fed_bank getVariable["safe",0]; 
  fed_bank setVariable["safe",round(_funds+((count playableUnits)/2)),true]; 
 }; 
};