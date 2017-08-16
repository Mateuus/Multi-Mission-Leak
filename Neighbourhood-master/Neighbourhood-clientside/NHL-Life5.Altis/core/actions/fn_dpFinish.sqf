/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price","_bp","_geld"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(2.2 * _dis);
_geld =_price;
if(life_erfahrung >=9375) then {_geld = _price * 1.5};
_chance = random(100);
_bpchance = 98;
if(_bpchance < _chance) then {
_bparray = [["bpzafir"],["bpmarten"],["bplrr"],["bplynx"],["bpmk1"],["bpakm"],["bpak12"],["bpspar17"],["bpmk18"],["bpmk14"]];
_bp = _bparray select floor random count _bparray;
_bpname = _bp select 0;
[true,_bpname,1] call life_fnc_handleInv;
life_erfahrung = life_erfahrung +15;
systemChat "+15 EXP";
_name = [([_bpname,0] call life_fnc_varHandle)] call life_fnc_varToStr;
titleText[format["Du hast einen %1 gefunden",_name],"PLAIN"];

};

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
life_cash = life_cash + _geld;
//level
life_erfahrung = life_erfahrung +12;
systemChat "+12 EXP";
[] call life_fnc_hudUpdate;
