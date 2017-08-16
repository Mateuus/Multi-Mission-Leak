/*
	File: fn_ProfProgress.sqf
	Author: Leo
	
	Description:
	Show ProfExpBar.
	
	Paras: name,barmaxexp,barstartexp,barendexp
	
	["Prof_Name",1000,200,100] spawn lhm_fnc_ProfProgress;
*/
private["_barname","_barmax","_start","_end"];

_barname = _this select 0;
_barmax = _this select 1;
_start = _this select 2;
_end =  _this select 3;
_exptoadd = _end - _start;

disableSerialization;
5 cutRsc ["ProfProgressBar_Dialog","PLAIN",0];
_display = uiNameSpace getVariable "ProfProgressBar_Dialog";	
_profbar = _display displayCtrl 9003;
_proftext = _display displayCtrl 9002;
_profexptext = _display displayCtrl 9004;		
_profexptext ctrlSetText format["%1 / %2",_start,_barmax];
_proftext ctrlSetText format["%1",_barname];

for "_i" from 1 to 100 do
{			
	_j = _start + ((_exptoadd/100) * _i);
	_barsetpoint =  1 * _j / _barmax;
	if (_barsetpoint > 1) then{
		_barsetpoint = _barsetpoint - 1;
	};
	_profbar progressSetPosition _barsetpoint;
	_profexptext ctrlSetText format["%1 / %2",round(_j),_barmax];
	sleep 0.001;
};
sleep 1;
5 cutText ["","PLAIN",0.2];