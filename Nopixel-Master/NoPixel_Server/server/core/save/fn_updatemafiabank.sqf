 
 
 
 
params["_type","_amount"]; 
 
if(_type == "Add") then { 
mafiaBank = mafiaBank + _amount; 
} else { 
mafiaBank = mafiaBank - _amount; 
}; 
 
_updatestr = format ["updateMafiaBank:%1:%2", mafiaBank,1]; 
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery; 
 
 
publicvariable "mafiaBank"; 
