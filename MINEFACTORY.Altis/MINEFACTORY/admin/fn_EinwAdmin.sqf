/*
Vor nutzung um Erlaubnis Fragen! info@minefactory.eu
MineFactory.eu Altis life
*/



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