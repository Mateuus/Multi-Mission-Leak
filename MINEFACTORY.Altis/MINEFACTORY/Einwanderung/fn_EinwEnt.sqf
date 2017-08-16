/*
	File: fn_EXIT.sqf
	IF U WANT TO USE THE SCRIPT, ASK FOR PERMISSION! info@minefactory.eu
	v2 Update ;) 
*/

if(playerSide in [west,independent]) then {
if(!Einw_Admin_Var) then
{
	closeDialog 0;	
	current_position_p = getPos player;
	
	0 cutText["","BLACK OUT"];
	sleep 1;
	player setPos (getMarkerPos "einwanderungCopEnt");
	sleep 1;
	0 cutText ["","BLACK IN"];
	Einw_Admin_Var = true;
}
else
{
	closeDialog 0;
	
	0 cutText["","BLACK OUT"];
	sleep 1;
	player setPos current_position_p;
	sleep 1;
	0 cutText ["","BLACK IN"];
	
	Einw_Admin_Var = false;
};

	} else {
	systemChat "Du hast kein recht dazu";
	};