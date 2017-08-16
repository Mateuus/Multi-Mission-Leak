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

LHM_money_circle_legal = true;

{
	_x setVariable["Geldwert",0,true];
} foreach LHM_gastations_owned;

_cash = 0;
while {count(LHM_gastations_owned) > 0} do
{
	_cash = 0;
	{
		if(!(_x getVariable ["Captured",false])) then {
			_cashTEMP = _x getvariable["Geldwert",0];
			_x setVariable["Geldwert",0,true];
			_cash = _cash + _cashTEMP;
		};

	} foreach LHM_gastations_owned;
	if(_cash > 0) then {
		hint format["Durch Einnahmen deiner Tansktellen bekommst du: \n %1$",round(_cash)];
		lhm_atmcash = lhm_atmcash + round(_cash);
	};


	sleep  (15 * 60);
};


LHM_money_circle_legal = false;



