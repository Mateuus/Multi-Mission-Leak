/* 
 File: fn_federalUpdate.sqf 
 Author: CooliMC 
  
 Description: 
 Uhhh, adds to it? 
*/ 
 
private["_funds"]; 
while {true} do 
{ 
 sleep (20 * 60); 
  
 _funds = fed_bank getVariable["safe",0]; 
 fed_bank setVariable["safe",round(_funds+((count playableUnits)/1.5)),true]; 
};