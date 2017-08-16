/*
	Darkside Life
	
	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the actions for police setting their task
*/

private["_var"];
_var = "";
switch(_this select 3)do
	{
	case 0:
		{
		_var = "Awaiting Orders";
		};
	case 1:
		{
		_var = "Patrolling";
		};
	case 2:
		{
		_var = "Sting";
		};
	case 3:
		{
		_var = "Pursuing";
		};
	case 4:
		{
		_var = "Processing";
		};
	case 5:
		{
		_var = "Responding";
		};
	case 6:
		{
		_var = "Piloting";
		};
	case 7:
		{
		_var = "Raiding";
		};
	case 8:
		{
		_var = "Escorting Convoy";
		};
	case 9:
		{
		_var = "On a break";
		};
	};
player setVariable ["policeAction",_var,true];
hint format ["Your status has been updated to\n\n%1",_var];
DS_setTask = false;