class wantedlist {
	idd = 606606;
	name= "wantedlist";
	movingEnable = false;
	enableSimulation = true;

controls[]=
{
	background,
	title,
	btn1,
	btn2,
	btn3,
	btn4,
	RscCombo_2100,
	textInfo,
	textInfoBounty
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Jukute)
////////////////////////////////////////////////////////

class background: IGUIBack
{
	idc = 2200;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 37 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
};
class title: RscText
{
	idc = 1001;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class btn1: RscButtonMenu
{
	idc = 2400;
	text = " Check Charges";
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_checkPlayerCharges";
};
class btn3: RscButtonMenu
{
	idc = 2401;
	text = "     Pardon";
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_pardonPlayer";
};

class btn2: RscButtonMenu
{
	idc = 2402;
	text = " Total Bounty";
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_totalBounty";
};

class btn4: RscButtonMenu
{
	idc = 2406;
	text = "      Close";
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "closeDialog 0;";
};
class RscCombo_2100: RscCombo
{
	idc = 2666;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class textInfo: DS_RscListBox
{
	idc = 1666;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	text = "";
	sizeEx = 0.035;
};
class textInfoBounty: DS_RscListBox
{
	idc = 1667;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 10 * GUI_GRID_H;
	text = "";
	sizeEx = 0.035;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};