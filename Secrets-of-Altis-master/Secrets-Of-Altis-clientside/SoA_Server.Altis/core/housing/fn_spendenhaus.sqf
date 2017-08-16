/*

		fn_spendenhaus.sqf
		Author: G00golplexian
		
		Description: Donate for the church.
*/

private["_source","_pos","_player","_house","_spendenhaus"];
if(spendenhausaktiv) exitWith {hint "Du hast schon ein Spendenhaus gesetzt."};

_source = _this select 0;
_player = _this select 1;
_house = nearestBuilding (getPosATL _player);

_pos = (_source buildingpos 2); 
spendenhaus = "Land_Calvary_02_V1_F" createvehicle _pos; 

_spendenhaus pushBack spendenhaus;

spendenhaus setdir (getdir _source) + 90;
spendenhaus enablesimulation false;
spendenhaus allowdamage false;
spendenhausaktiv = true;

spendenhaus addaction ["Spendenhaus entfernen",{deletevehicle spendenhaus; spendenhausaktiv = false;}];
[spendenhaus,"100€ Spende erbringen",life_fnc_spenden,100,_source,_player] remoteExecCall ["life_fnc_addaction",0,true];
[spendenhaus,"1.000€ Spende erbringen",life_fnc_spenden,1000,_source,_player] remoteExecCall ["life_fnc_addaction",0,true];
[spendenhaus,"10.000€ Spende erbringen",life_fnc_spenden,10000,_source,_player] remoteExecCall ["life_fnc_addaction",0,true];
[spendenhaus,"100.000€ Spende erbringen",life_fnc_spenden,100000,_source,_player] remoteExecCall ["life_fnc_addaction",0,true];