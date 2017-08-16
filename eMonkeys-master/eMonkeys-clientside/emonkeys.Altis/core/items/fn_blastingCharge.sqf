/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
if (!([8,[0,0,0,1,1,0,0]]  call emonkeys_fnc_coplevelcall)) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
if(EMonkeys_inv_blastingcharge == 0) exitWith {
	titleText["Du hast keine Sprengladung.","PLAIN"];
}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Du kannst die Sprengladung nur an einem Tresor anbringen!"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint "Es ist bereits eine Sprengladung angebracht"};
if(_vault getVariable["safe_open",false]) exitWith {hint "Es ist doch schon offen!"};
if(!([false,"blastingcharge",1] call EMonkeys_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[[1,"Eine Sprengladung wurde am Tresor der Zentralbank angebracht!"],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;
hint "Der timer läuft! Bring dich in Sicherheit!";
_handle = [] spawn EMonkeys_fnc_demoChargeTimer;
[[],"EMonkeys_fnc_demoChargeTimer",west,false] call EMonkeys_fnc_mp;

waitUntil {scriptDone _handle};
uisleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint "Bombe entschärft!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint "Der Tresor ist nun offen!";
