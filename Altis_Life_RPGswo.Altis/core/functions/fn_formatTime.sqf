/*
	File: fn_formatTime.sqf
	Author: MarkusSR1984
	
	Description:
	Formats Time in Secounds to a Better readable String.  315 = > 05:15
*/
private["_time","_return","_s","_m","_exitloop"];
_time = param [0,0,[0]];
_time = round(_time);
_return = "";
_m = 0;
_exitloop = false;

_negative = if (_time < 0) then {true} else {false};
if (_negative) then {_time = (0 - _time);};

while {!_exitloop} do
{
	if (_time >= 60) then
	{
		_time = (_time - 60); _m = _m + 1;
	}
	else
	{
		if (_m < 10) then 
		{
			if (_m == 0) then
			{
				_return = "00";
			} 
			else
			{
				_return = format ["0%1",_m];
			};	
		}
		else
		{
			_return = format ["%1",_m];
		};
		
		if (_time < 10) then
		{
			if (_time == 0) then
			{
				_return = format ["%1:00",_return];
			} 
			else
			{
				_return = format ["%1:0%2",_return,_time];
			};	
		}
		else
		{
			_return = format ["%1:%2",_return,_time];
		};
		
		_exitloop = true;
	};
};
if (_negative) then {_return = format ["-%1",_return];};

_return;