/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays impound request for police and mechanics
*/

if((!(playerSide isEqualTo west))&&(!(player getVariable ["mechanic",false])))exitwith{};

hint "A security contractor has requested a vehicle be impounded, the vehicle will be marked on your map";
systemchat "A security contractor has requested a vehicle be impounded, the vehicle will be marked on your map";
player say3D "dingDong";