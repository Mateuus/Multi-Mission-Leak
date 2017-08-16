/*
	File: fn_station_capture.sqf
	Author: Barney

	Description:



	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/



//"Land_fs_feed_F"
//"Land_fs_feed_F"



private ["_tanke","_tankstellen_Marker","_distanceChosen","_distance","_marker","_upp","_ui","_progress","_pgText","_cP","_entf","_fail","_was","_text"];
_tanke = param[0,objNull,[objNull]];

if(!(_tanke getVariable ["Captured",false])) exitWith {hint "Diese Tankstelle wurde nicht eingenommen!";};
_fail = false;

_tankstellen_Marker = [];


{
	_tankstellen_Marker pushBack format["GasMarker_%1",_x];

} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

_distanceChosen = 5000;
{
	_distance = _tanke distance (getmarkerpos(_x));
	if(_distance < _distanceChosen) then {
		_distanceChosen = _distance;
		_marker = _x;
	};

} foreach _tankstellen_Marker;





_upp = "Nehme Tanke ein";
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{

	sleep 0.1;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	_entf = player distance _tanke;
	if(_entf > 20) exitWith {_fail = true;};
	if(_cP >= 1) exitWith {};
	if(player getVariable["restrained",false]) exitWith {"Du wurdest festgenommen, Einnehmen abgebrochen!";};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];
if(!alive player) exitWith {};
if(_fail) exitWith {hint "Du hast dich zu weit von der Tankstelle entfernt"};
if(player getVariable["restrained",false]) exitWith {"Du wurdest festgenommen, Einnehmen abgebrochen!";};

_tanke setVariable["Captured",nil,true];
_tanke setVariable["Cooldown",true,true];


_was = _tanke getVariable["Price",8];
_wer = _tanke getvariable["kaeufer",""];
_marker setMarkerType "loc_Fuelstation";


if(_wer == "") then {
	_marker setMarkerText format["Gas Station - Preis: %1 $ - Owner: %2",round(_was),"Niemand"];
} else {
	_marker setMarkerText format["Gas Station - Preis: %1 $ - Owner: %2",round(_was),_wer];
};
[[_tanke],"lhm_fnc_gasStation_cooldown",false,false] call lhm_fnc_mp;






/*
	Notizen für die Addactions!

	this enableSimulation false;
	this allowDamage false;
	this setVariable["realname", "Gas station attendant"];
	this addAction["Rob Cash Register",lhm_fnc_robShops];
	this addAction["Warenhandel",lhm_fnc_weaponShopMenu,"genstore"];
	this addAction["Tankstelle kaufen",lhm_fnc_LHM_stations_station_buy,nil,0,false,false,"",'playerside == civilian && !(this getvariable["gekauft",false])'];
	this addAction["Tankstelle/n verwalten",lhm_fnc_LHM_stations_station_Menu,nil,0,false,false,"",'playerside == civilian && (this getvariable["Kaeufer",""] == name player)'];
	this addAction["Tankstelle einnehmen",lhm_fnc_LHM_stations_station_capture,nil,0,false,false,"",'playerside == civilian && (this getvariable["Kaeufer",""] != name player) && !(this getvariable["Captured",false])'];
	this addAction["Tankstelle sichern",lhm_fnc_LHM_stations_station_cop_recapture,nil,0,false,false,"",'playerside == west &&  this getvariable["Captured",false]'];


	this enableSimulation false;
	this allowDamage false;
	this setVariable["realname", "Gas station attendant"];
	this addAction["Rob Cash Register",lhm_fnc_robShops];
	this addAction["Warenhandel",lhm_fnc_weaponShopMenu,"genstore"];
	this addAction["Tankstelle kaufen",lhm_fnc_LHM_stations_station_buy,nil,0,false,false,"",'playerside == civilian'];
	this addAction["Tankstelle/n verwalten",lhm_fnc_LHM_stations_station_Menu,nil,0,false,false,"",'playerside == civilian'];
	this addAction["Tankstelle einnehmen",lhm_fnc_LHM_stations_station_capture,nil,0,false,false,"",'playerside == civilian '];
	this addAction["Tankstelle sichern",lhm_fnc_LHM_stations_station_cop_recapture,nil,0,false,false,"",'playerside == west'];


*/





