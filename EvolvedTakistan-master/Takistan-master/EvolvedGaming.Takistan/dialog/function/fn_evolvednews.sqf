#include <macro.h>	

disableSerialization;
waitUntil {!isNull findDisplay 1526};
_display = findDisplay 1526;


ctrlSetText [1400, ""];

/*Civ Button
Note:This isnt fully complete so i just basically removed it so only admins can see it  a good idea would be to
make newslevel for civ's and then you could in basics whitelist them.
*/
if((FETCH_CONST(life_adminlevel) < 1)) then
{
	ctrlShow[1600,false];
};
//Admin Button
if((FETCH_CONST(life_adminlevel) < 1)) then
{
	ctrlShow[1601,false];
};
//Police Button
if((FETCH_CONST(life_coplevel) < 1)) then
{
	ctrlShow[1602,false];
};



 