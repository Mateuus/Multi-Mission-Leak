/*
	File: fn_moveBack.sqf
	Author: MarkusSR1984
	
	Description:
	Turn players movement with 180 degrees and put him back
*/
_center = _this select 0;

[_center] spawn 
{
	_center = _this select 0;
	hint "Du darfst diese zone nicht betreten! geh nicht weiter oder du wirst sterben!!!!!!";
	disttocenter = player distance _center;
	backward = [(0 - ((velocity vehicle player) select 0)),(0 - ((velocity vehicle player) select 1)),(0 - ((velocity vehicle player) select 2))];		
	player setVariable["inRestricktedAreal",true];
	disttocenter = player distance _center;
	_counter = 0;		

	while {player getVariable["inRestricktedAreal",false]} do 
	{
		vehicle player setVelocity [backward select 0, backward select 1, backward select 2];
		if ((player distance _center) < disttocenter) then
		{
			backward = [(backward select 0 )* 1.1 ,(backward select 1 )* 1.1 ,(backward select 2 )* 1.1];
			disttocenter = player distance _center;
		};
		vehicle player setVelocity [backward select 0, backward select 1, backward select 2];
	};
};