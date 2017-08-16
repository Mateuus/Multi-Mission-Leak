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

private ["_cash","_cashTEMP"];
LHM_money_circle_illegal = true;
{
	_x setVariable["Geldwert",0,true];
} foreach LHM_gastations_captured;

_cash = 0;
while {count(LHM_gastations_captured) > 0} do
{
	_cash = 0;
	{
		if(_x getVariable ["Captured",false]) then {
			_cashTEMP = _x getvariable["Geldwert",0];
			_x setVariable["Geldwert",0,true];
			_cash = _cash + (_cashTEMP * 0.5);
		};

	} foreach LHM_gastations_captured;
	if(_cash > 0) then {
		hint format["Deine\Eine Tankstelle\n hat\haben Geld verdient: \n Du bekommst: \n %1$",round(_cash)];
		lhm_atmcash = lhm_atmcash + round(_cash);
	};


	sleep (15 * 60);
};


LHM_money_circle_illegal = false;



















