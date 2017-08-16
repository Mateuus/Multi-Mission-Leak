class martiallaw {
	idd = 3951;
	name= "martiallaw";
	movingEnable = false;
	enableSimulation = true;

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)



	class controls 
	{

controls[]=
{
	IGUIBack_2200,
	title,
	serverWide,
	athira,
	sofia,
	prygos,
	airfield,
	end,
	close,
	serverWidePlayer,
	serverWideVeh
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Muteqa)
////////////////////////////////////////////////////////

class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 29 * GUI_GRID_W;
	h = 19.5 * GUI_GRID_H;
};
class title: RscText
{
	idc = 1000;
	text = "Police Martial Law Menu"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class serverWideAir: RscButtonMenu
{
	idc = 2111;
	text = "         Ground all Air Vehicles ($100k)"//--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[7] spawn DS_cop_setmartiallaw";
};
class serverWide: RscButtonMenu
{
	idc = 2400;
	text = "     Server Wide - $50k (Combined Bounty)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[0] spawn DS_cop_setmartiallaw";
};
class serverWideVeh: RscButtonMenu
{
	idc = 4401;
	text = "        Server Wide - $50k (Armed vehicles)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[1] spawn DS_cop_setmartiallaw";
};
class serverWidePlayer: RscButtonMenu
{
	idc = 4401;
	text = "            Server Wide - $50k (Player)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[2] spawn DS_cop_setmartiallaw";
};
class athira: RscButtonMenu
{
	idc = 2401;
	text = "            Athira Martial Law ($20k)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[3] spawn DS_cop_setmartiallaw";
};
class sofia: RscButtonMenu
{
	idc = 2402;
	text = "             Sofia Martial Law ($20k)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[4] spawn DS_cop_setmartiallaw";
};
class prygos: RscButtonMenu
{
	idc = 2403;
	text = "            Prygos Martial Law ($20k)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[5] spawn DS_cop_setmartiallaw";
};
class airfield: RscButtonMenu
{
	idc = 2404;
	text =  "           Air Field Martial Law ($200k)"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[6] spawn DS_cop_setmartiallaw";
};
class reason: RscEdit
{
	idc = 240755;
	text = "Enter Message to civilians or players name"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class copskavala: RscButtonMenu
{
	idc = 2407;
	text = "Enable/Disable Public Cops Area Restrictions"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[] spawn DS_cop_publicblock";
};
class end: RscButtonMenu
{
	idc = 2405;
	text = "                    End Martial Law"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "[10] spawn DS_cop_setmartiallaw";
};
class close: RscButtonMenu
{
	idc = 2406;
	text = "                      Close"; //--- ToDo: Localize;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onButtonClick = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};};