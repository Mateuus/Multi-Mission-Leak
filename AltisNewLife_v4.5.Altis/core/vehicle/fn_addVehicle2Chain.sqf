private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_vehicle in life_vehicles)) then
{
	life_vehicles pushBack _vehicle;
};