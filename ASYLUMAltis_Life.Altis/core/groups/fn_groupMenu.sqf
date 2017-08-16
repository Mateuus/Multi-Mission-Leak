/*
	File: fn_groupMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether it needs to open the gang management menu or the choice menu.
*/
if(!isNull life_my_group) then
{
	createDialog "life_my_group_Diag";
}
	else
{
	createDialog "Life_Group_Prompt";
};