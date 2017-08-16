params ["_mode","_uid","_owner","_client","_profilname"]; 
switch (_mode) do { 
 case 1 : {[_uid,_owner,"abfrage"] call hc_fnc_lotto;}; 
 case 2 : {[] spawn hc_fnc_lottoGewinn;}; 
 case 3 : {[_owner] spawn hc_fnc_lottoStatistik;}; 
 case 4 : {[_owner] spawn hc_fnc_lottoGewinner;}; 
 case 5 : {[_uid,_owner,"eintrag",_client,_profilname] call hc_fnc_lotto;}; 
 case 6 : {}; 
 default {diag_log format ["Fehler bei HCsend Array: %1",_this];}; 
}; 
