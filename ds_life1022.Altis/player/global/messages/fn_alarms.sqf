/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Plays an alarm at locations for many things
*/

private ["_locations"];
_locations = [];
switch (true) do
	{
	case ((_this select 0) == 0): {_locations = [repairBank1]};
	case ((_this select 0) == 1): {_locations = [knox_safe1]};
	case ((_this select 0) == 2): {_locations = [repairJail]};
	case ((_this select 0) == 3): {_locations = [powerStation1]};
	case ((_this select 0) == 4): {_locations = [safe_research]};
	};

if(_locations isEqualTo [])exitwith{};

{
	if(player distance _x < 200)then
		{
		[_x,"alarm"] call DS_fnc_playSound;
		};
}forEach _locations;