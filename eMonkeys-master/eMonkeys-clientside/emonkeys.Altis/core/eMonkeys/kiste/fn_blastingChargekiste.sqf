/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};

if(EMonkeys_inv_blastingcharge == 0) exitWith {
	titleText["Du hast keine Sprengladung.","PLAIN"];
}; //Bad object
if(typeOf _vault != "CargoNet_01_box_F") exitWith {hint "Du kannst die Sprengladung nur an einer Kiste anbringen!"};
if(_vault getVariable["chargeplacedkiste",false]) exitWith {hint "Es ist bereits eine Sprengladung angebracht"};
if(_vault getVariable["kiste_open",false]) exitWith {hint "Es ist doch schon offen!"};
if(!([false,"blastingcharge",1] call EMonkeys_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplacedkiste",true,true];
hint "Der Timer läuft! Bring dich in Sicherheit!";
_handle = [] spawn EMonkeys_fnc_demoChargeTimerkiste;

[[1,"Eine Sprengladung wurde an der Versorgungskiste angebracht (5 Minuten verbleiben)!"],"EMonkeys_fnc_broadcast",[civilian,east],false] call EMonkeys_fnc_mp;

waitUntil {scriptDone _handle};
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", airdrop_kiste];
uisleep 3;

airdrop_kiste enableSimulation false;

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL airdrop_kiste select 0, getPosATL airdrop_kiste select 1, (getPosATL airdrop_kiste select 2)+0.5];
airdrop_kiste setVariable["chargeplacedkistekiste",false,true];
airdrop_kiste setVariable["kiste_open",true,true];

airdrop_kiste enableSimulation true;
hint "Die Kiste ist nun offen!";
