/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the admin menu
*/

if(!(player getVariable ["DSAdmin",false]))exitWith{closeDialog 0;};
if(!isNull (findDisplay 2900))exitWith{};
sleep 0.2;
createDialog "adminMenu";