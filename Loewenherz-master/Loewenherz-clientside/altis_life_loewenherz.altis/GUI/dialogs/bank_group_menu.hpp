class LHM_bank_group_menu {
	idd = 9573;
	name= "LHM_bank_group_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_bankGroupMenu;";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls {

		class Allplayers: lhm_RscListbox
		{
			idc = 1500;
			text = "";
			sizeEx = 0.035;
			x = 0.250505;
			y = 0.256431;
			w = 0.225;
			h = 0.519192;
		};
		
		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
class Playersselected: lhm_RscListbox
{
	idc = 1501;
	text = "";
	sizeEx = 0.035;
	x = 0.60101;
	y = 0.255893;
	w = 0.225;
	h = 0.519192;
};
class Buttonadd: lhm_RscButtonMenu
{
	idc = 2400;
	x = 0.495076;
	y = 0.363165;
	w = 0.0911616;
	h = 0.042761;
};
class Buttonremove: lhm_RscButtonMenu
{
	idc = 2401;
	x = 0.494823;
	y = 0.503367;
	w = 0.0887626;
	h = 0.0435691;
};
class AllPlayersHeader: lhm_RscText
{
	idc = 1000;
	text = "Alle Spieler"; //--- ToDo: Localize;
	x = 0.25505;
	y = 0.222223;
	w = 0.214647;
	h = 0.0248485;
};
class ChosenPlayersHeader: lhm_RscText
{
	idc = 1001;
	text = "Ausgewählte:"; //--- ToDo: Localize;
	x = 0.60606;
	y = 0.222222;
	w = 0.214647;
	h = 0.0248485;
};
class Buttonaccept: lhm_RscButtonMenu
{
	idc = 2403;
	x = 0.849748;
	y = 0.757576;
	w = 0.131566;
	h = 0.0444444;
};
class WhatHappensHeader: lhm_RscText
{
	idc = 1002;
	x = 0.328935;
	y = 0.158229;
	w = 0.425;
	h = 0.04;
};

class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
class HowMuchMoney: lhm_RscText
{
	idc = 1003;
	x = 0.24625;
	y = 0.798;
	w = 0.577273;
	h = 0.0349495;
};
	};
};