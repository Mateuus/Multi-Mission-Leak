/*
	Author: MarkusSR1984
	
	Description:
	Behandelt abgeschossene Projektile
	
	!!!!!!  WURDE DURCH HANDLEFIRED ABGELÖST   !!!!!!!
	
	!!!!!! DATEI NICHT MEHR AKTIV !!!!!!!!!
*/

if((side player) != west) then 
{	
    if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count __GETC__(DWEV_safe_points) > 0) then
    {
        deleteVehicle (_this select 6);
        titleText ["Du bist in einer Absoluten Safezone, Waffen sind deaktiviert.", "PLAIN", 3];
    };
			 
    if ((_this select 0) getVariable["restrained",false]) then
    {
        deleteVehicle (_this select 6);
        titleText ["Du bist Festgenommen, Waffen sind deaktiviert.", "PLAIN", 3];
    };
	
	player setUnitRecoilCoefficient (unitRecoilCoefficient player * 1.1);
	
	
	
}
else
{
	player setUnitRecoilCoefficient (unitRecoilCoefficient player * 1.05);
};

[] spawn
{
	if (isNil "DWEV_recoil_handler") then {DWEV_recoil_handler = false;};
	if (DWEV_recoil_handler) exitWith {};
	DWEV_recoil_handler = true;
	
	while {(unitRecoilCoefficient player) > 1} do
	{
		sleep 30;
		_myRecoil = unitRecoilCoefficient player;
		_myRecoil = (_myRecoil / 1.05);
		player setUnitRecoilCoefficient _myRecoil;
	};
	
	player setUnitRecoilCoefficient 1;
	DWEV_recoil_handler = false;
};