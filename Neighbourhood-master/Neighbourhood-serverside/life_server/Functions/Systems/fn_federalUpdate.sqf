 
 
 
 
 
 
 
private["_funds"]; 
while {true} do 
{ 
sleep (30 * 60); 
_funds = fed_bank getVariable["safe",0]; 
fed_bank setVariable["safe",round(_funds+((count playableUnits)/2)),true]; 
};