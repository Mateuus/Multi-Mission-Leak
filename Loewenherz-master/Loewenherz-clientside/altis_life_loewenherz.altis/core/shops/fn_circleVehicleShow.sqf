
/*
	File: fn_circleVehicleShow.sqf
	Author: Barney

	Description:
	Do i need one?

	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

LHM_shop_show_vehicle setdir LHM_VehShop_Dir;

While {LHM_VehShop_Showcase} do {
	if(!LHM_VehShop_Showcase) exitWIth{};
	waituntil{
		if(!LHM_VehShop_Showcase)exitWith {true};
		!isnull LHM_shop_show_vehicle;};
	LHM_VehShop_Dir = getdir LHM_shop_show_vehicle;
	if(LHM_shop_Rotate_speed != 0) then {
		LHM_shop_show_vehicle setdir (LHM_VehShop_Dir - LHM_shop_Rotate_speed);
	};
	if(!LHM_VehShop_Showcase) exitWIth{};
	waituntil{
		if(!LHM_VehShop_Showcase)exitWith {true};
		!isnull LHM_shop_show_vehicle;};
	sleep 0.009;
};
