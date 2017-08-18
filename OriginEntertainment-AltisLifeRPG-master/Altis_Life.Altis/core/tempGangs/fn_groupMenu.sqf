/*	
		File: fn_gangMenu.sqf
*/

if(!isNull life_my_group) then
{	
	createDialog "OE_Life_My_Group_Diag";
}	
	else
{	
	createDialog "OE_Life_Gang_Prompt";
};