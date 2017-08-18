#include <macro.h>
/*
	File: fn_cellphone2.sqf
	Author: Timo
 
	Description:
	With no radio cant use Cellphone
*/
 
 
if(("ItemRadio" in assignedItems player) || (__GETC__(life_adminlevel) > 0)) then
{
	createDialog "Life_my_smartphone";
}
else
{
	hint parseText format ["<t size='1.30' align='center' color='#0D82DF'>No Cell Phone</t><br/><br/>
	You must have have a cellphone (Radio) for use this. You can buy cellphone in a general store!<br/>"];
};