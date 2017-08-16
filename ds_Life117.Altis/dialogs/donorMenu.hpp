#define true 1
#define false 0

class donorMenu {
	idd = 66666;
	name= "donorMenu";
	movingEnable = true;
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
	background,
	RscListbox_1500,
	RscListbox_1501,
	RscListbox_1502,
	btn1,
	btn2,
	btn3,
	closeButton
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Cobyme)
////////////////////////////////////////////////////////

class background: IGUIBack
{
	idc = 2200;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 37 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};
class RscListbox_1500: DS_RscListbox
{
	idc = 1500;
	text = "leftListBox"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class RscListbox_1501: DS_RscListbox
{
	idc = 1501;
	text = "centerListBox"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class RscListbox_1502: DS_RscListbox
{
	idc = 1502;
	text = "rightListBox"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class btn1: DS_RscButtonMenu
{
	idc = 1600;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class btn2: DS_RscButtonMenu
{
	idc = 1601;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class btn3: DS_RscButtonMenu
{
	idc = 1602;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class closeButton: DS_RscButtonMenu
{
	idc = 1603;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};};