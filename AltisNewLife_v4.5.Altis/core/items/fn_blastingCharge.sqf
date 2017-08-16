private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Ne peut s'utiliser que sur le coffre d'une banque"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint "Il y a deja une charge explosive sur le coffre."};
if(_vault getVariable["safe_open",false]) exitWith {hint "Le coffre est deja ouvert !"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
_vault setVariable["chargeplaced",true,true];
[[1,"STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
hint "Le compte à rebours a commnencé ! Gardez les forces de l'ordre loin du coffre !";
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] spawn life_fnc_MP;
waitUntil {scriptDone _handle};
uiSleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint "La charge explosive a été désarmée !"};
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];
hint "Le coffre est maintenant ouvert";