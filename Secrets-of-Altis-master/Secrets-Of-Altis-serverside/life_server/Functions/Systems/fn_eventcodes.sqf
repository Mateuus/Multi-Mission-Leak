 
 
 
 
 
 
private["_codes_geschenke_new","_codes_fahrzeuge_new","_codes_geld_new","_codes_geschenke","_codes_fahrzeuge","_codes_geld","_player","_codecheck"]; 
disableSerialization; 
_player = _this select 0; 
_codecheck = _this select 1; 
_codes = []; 
_codes_geschenke_new = []; 
_codes_fahrzeuge_new = []; 
_codes_geld_new = []; 
 
_codes_geschenke = ["SELECT geschenkcode FROM codes WHERE geschenkcode != ''",2,true] call DB_fnc_asyncCall; 
_codes_fahrzeuge = ["SELECT fahrzeugcode FROM codes WHERE fahrzeugcode != ''",2,true] call DB_fnc_asyncCall; 
_codes_geld = ["SELECT geldcode FROM codes WHERE geldcode != ''",2,true] call DB_fnc_asyncCall; 
 
{_codes_geschenke_new pushback (_x select 0)} foreach _codes_geschenke; 
{_codes_fahrzeuge_new pushback (_x select 0)} foreach _codes_fahrzeuge; 
{_codes_geld_new pushback (_x select 0)} foreach _codes_geld; 
 
if(!(_codecheck in _codes_geschenke_new) && !(_codecheck in _codes_fahrzeuge_new) && !(_codecheck in _codes_geld_new)) exitWith {[4,"<t size='2.5'>Oh nein!</t><br/> Der eingegebene Code ist ungültig oder wurde schon verwendet."] remoteExecCall ["life_fnc_broadcast",_player]}; 
 
switch(true) do { 
case (_codecheck in _codes_geschenke_new): { 
["geschenk",2] remoteExecCall ["life_fnc_handleinvCheck",_player];  
[format["DELETE FROM codes WHERE geschenkcode = '%1'",_codecheck],2] call DB_fnc_asyncCall; 
}; 
 
case (_codecheck in _codes_fahrzeuge_new): { 
["C_SUV_01_F",6] remoteExec ["life_fnc_createVehicle",_player];  
[format["DELETE FROM codes WHERE fahrzeugcode = '%1'",_codecheck],2] call DB_fnc_asyncCall; 
}; 
 
case (_codecheck in _codes_geld_new): { 
[120000,"Altis Pfandhaus",0,false] remoteExecCall ["life_fnc_moneytransfer",_player];  
[format["DELETE FROM codes WHERE geldcode = '%1'",_codecheck],2] call DB_fnc_asyncCall; 
}; 
};