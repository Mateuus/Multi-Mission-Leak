private ["_list","_foundbed","_cargo"];
_list = [bed1,bed2,bed3,bed4,bed5,bed6];
_foundbed = player;
_cargo = [];

// Look through beds and generate an array with player count for each bed
{
_cargo = _cargo + [count (assignedCargo _x)];
} foreach _list;

// Select the first bed in array which is empty
{
if (_x < 1 && _foundbed == player) then
{
	_foundbed = _list select _x;
};
} foreach _cargo;

// If all beds are empty move player to marker position, otherwise put into bed
if (_foundbed == player) then 
{
	player setpos (getMarkerPos "lakeside_hospital");
} else
{
	player moveInCargo _foundbed;
};