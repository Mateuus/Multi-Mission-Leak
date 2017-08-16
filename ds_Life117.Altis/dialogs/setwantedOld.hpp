class setwanted {
	idd = 2951;
	name= "setwanted";
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
	RscButtonMenu_2400,
	RscButtonMenu_2401,
	RscButtonMenu_2402,
	RscButtonMenu_2403,
	RscButtonMenu_2404,
	RscButtonMenu_2405,
	RscButtonMenu_2406,
	RscButtonMenu_2407,
	RscButtonMenu_2408,
	RscButtonMenu_2409,
	RscButtonMenu_2410,
	RscButtonMenu_2411,
	RscCombo_2100,
	Title
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Sapeby)
////////////////////////////////////////////////////////

class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = -1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 43.5 * GUI_GRID_W;
	h = 24.5 * GUI_GRID_H;
};
class RscButtonMenu_2400: RscButtonMenu
{
	idc = 2400;
	text = "    Reckless Driving"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""reckless""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2401: RscButtonMenu
{
	idc = 2401;
	text = "    Armed Robbery"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""armrob""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_24016: RscButtonMenu
{
	idc = 24016;
	text = "    Stole Documents"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""spythieft""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2402: RscButtonMenu
{
	idc = 2402;
	text = "    Evading Police"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""evade""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2403: RscButtonMenu
{
	idc = 2403;
	text = "      Accessory"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""acces""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_24036: RscButtonMenu
{
	idc = 24036;
	text = "         Murder"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""murder""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2404: RscButtonMenu
{
	idc = 2404;
	text = "     Drink Driving"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""ddriving""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2405: RscButtonMenu
{
	idc = 2405;
	text = "    Illegal Weapon"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""illegalweapon""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_24056: RscButtonMenu
{
	idc = 24056;
	text = "    Bank Robbery"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""brob""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2406: RscButtonMenu
{
	idc = 2406;
	text = "    Careless flying"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""cflying""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2407: RscButtonMenu
{
	idc = 2407;
	text = "         Theft"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""thieft""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_24076: RscButtonMenu
{
	idc = 24076;
	text = "  Fort Knox Robbery"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""fortknox""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2408: RscButtonMenu
{
	idc = 2408;
	text = "      Vandalism"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""vandalism""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2409: RscButtonMenu
{
	idc = 2409;
	text = "  Grand Theft Auto"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""gta""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_24096: RscButtonMenu
{
	idc = 24096;
	text = "   Armed Occupation"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""armedocc""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2501: RscButtonMenu
{
	idc = 2501;
	text = "        Bribery"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""bribe""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2502: RscButtonMenu
{
	idc = 2502;
	text = "  Attempted Murder"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""amurder""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_25026: RscButtonMenu
{
	idc = 25026;
	text = "      Terrorism"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""terrorism""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2503: RscButtonMenu
{
	idc = 2503;
	text = "      Hit and Run"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""hitandrun""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2504: RscButtonMenu
{
	idc = 2504;
	text = "   Unsafe Conduct"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""unsafe""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_25046: RscButtonMenu
{
	idc = 25046;
	text = "     Possession "; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""drug""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2505: RscButtonMenu
{
	idc = 2505;
	text = " Breach of the peace"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""bpeace""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2506: RscButtonMenu
{
	idc = 2506;
	text = "      Abduction"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""abduction""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_25066: RscButtonMenu
{
	idc = 25066;
	text = "    Man Slaughter   "; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""manslaughter""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2507: RscButtonMenu
{
	idc = 2507;
	text = "      Trespassing"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	onButtonClick = "[""trespass""] call DS_cop_setPlayerWanted";
};
class RscButtonMenu_2508: RscButtonMenu
{
	idc = 2508;
	text = " "; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	
};
class RscButtonMenu_25086: RscButtonMenu
{
	idc = 25086;
	text = ""; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	
};
class RscButtonMenu_2429: RscButtonMenu
{
	idc = 2409;
	text = "Release"; //--- ToDo: Localize;
	x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_releaseplayer";
};
/*
class RscButtonMenu_2410: RscButtonMenu
{
	idc = 2410;
	text = "    Set Wanted"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_setwanted";
};
*/
class RscButtonMenu_2411: RscButtonMenu
{
	idc = 2411;
	text = "        Close"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "closeDialog 0;";
};
class RscButtonMenu_2412: RscButtonMenu
{
	idc = 2412;
	text = "  Fire Officer"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_fireCop";
};
/*
class RscButtonMenu_24145: RscButtonMenu
{
	idc = 24145;
	text = "Check Charges"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_checkChargesV2";
};
class RscButtonMenu_2413: RscButtonMenu
{
	idc = 2413;
	text = " Check Records"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_fnc_checkRecords";
};
*/
class RscButtonMenu_2414: RscButtonMenu
{
	idc = 2414;
	text = " Block Phone"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onButtonClick = "[] call DS_cop_blockPhone";
};
class RscCombo_2100: RscCombo
{
	idc = 2100;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class Title: RscText
{
	idc = 1000;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	text = "                                               Set Player Wanted"; //--- ToDo: Localize;
	x = -1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 43.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};};