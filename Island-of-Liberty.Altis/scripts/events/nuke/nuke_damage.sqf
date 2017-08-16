//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////

if (mdh_nuke_destruction_zone > 0) then
{
	{_x setdamage 1} forEach (nearestObjects [(getpos nukepos), [], mdh_nuke_destruction_zone]);
};
