/*
	File: fn_endtransporter.sqf
	Author: Bloodwyn

	Description:
	Sec ends the Transport

	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_con","_mtransport","_refstations","_money","_y"];
_con = nearestObject [player, "Land_Cargo20_grey_F"];
_mtransport = nearestObject [player, "I_Truck_02_transport_F"];
_refstations = [];
{if((_x getVariable ["realname","Hans"])=="Gas station attendant")then{_refstations pushBack _x};}foreach entities "man"; //kacke

if(((attachedTo _con)==_mtransport) && (player distance _mtransport) <35)then{
	if(_con getVariable "Money" != 0) then {
		_money = lhm_cash + round((_con getVariable "Money")/3);
	} else {
		_money = 0;
	};
	lhm_cash = lhm_cash + _money;
	hint format["Du hast %1$ für die Sicherung des Geldtransportes bekommen",_money];
	deleteVehicle _mtransport;
	deletevehicle _con;
	for "_i" from 0 to (count _refstations)-1 do{
		_y=format["gothic%1",_i];
		[[_y,nil,nil,nil,nil,true],"lhm_fnc_Marker",east,false] call lhm_fnc_mp;
	};
	{_x setVariable ["stationnum", -1, true];}foreach _refstations;
};

SECRadio1 setVariable ["Mtrans",false,true];