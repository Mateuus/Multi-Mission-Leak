class Map_Marker_Menu {
	idd = 2500;
	name= "Map_Marker_Menu";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_adminMenu;";
	
	class controlsBackground {
	class TabletBCKGRND: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0195705;
			y = -0.104647;
			w = 1.08561;
			h = 1.18714;

		};
		
		class PictureClose: lhm_RscPicture
		{
			idc = 1206;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.862374;
			y = 0.725589;
			w = 0.1;
			h = 0.1;
		};
		class Text_illegal_farming_markers: lhm_RscText
{
	idc = 1001;
	text = "Illegale Farming Markers"; //--- ToDo: Localize;
	x = 0.0795453;
	y = 0.260135;
	w = 0.249242;
	h = 0.0452526;
};
class Text_all_farming_Markers: lhm_RscText
{
	idc = 1000;
	text = "Alle Farming Markers"; //--- ToDo: Localize;
	x = 0.0808082;
	y = 0.203704;
	w = 0.225252;
	h = 0.0368351;
};
class Text_legal_farming_markers: lhm_RscText
{
	idc = 1002;
	text = "Legale Farming Marker"; //--- ToDo: Localize;
	x = 0.080808;
	y = 0.324916;
	w = 0.249242;
	h = 0.0452526;
};
class police_marker: lhm_RscText
{
	idc = 1003;
	text = "Polizei Marker"; //--- ToDo: Localize;
	x = 0.0795455;
	y = 0.387205;
	w = 0.249242;
	h = 0.0452526;
};
class medic_Marker: lhm_RscText
{
	idc = 1004;
	text = "Medic Marker"; //--- ToDo: Localize;
	x = 0.0808082;
	y = 0.446128;
	w = 0.249242;
	h = 0.0452526;
};
class Legende_Marker: lhm_RscText
{
	idc = 1005;
	text = "Basen"; //--- ToDo: Localize;
	x = 0.0808081;
	y = 0.50505;
	w = 0.249242;
	h = 0.0452526;
};
class Gang_Markers: lhm_RscText
{
	idc = 1006;
	text = "Gang Marker"; //--- ToDo: Localize;
	x = 0.0808081;
	y = 0.56229;
	w = 0.249242;
	h = 0.0452526;
};
class Info_Marker: lhm_RscText
{
	idc = 1007;
	text = "Tankstellen"; //--- ToDo: Localize;
	x = 0.0808082;
	y = 0.622896;
	w = 0.249242;
	h = 0.0452526;
};
class Alle_shops: lhm_RscText
{
	idc = 1008;
	text = "Alle Shops"; //--- ToDo: Localize;
	x = 0.080808;
	y = 0.676768;
	w = 0.249242;
	h = 0.0452526;
};
class Illegal_shops: lhm_RscText
{
	idc = 1009;
	text = "Illegale Shops"; //--- ToDo: Localize;
	x = 0.0820706;
	y = 0.739057;
	w = 0.249242;
	h = 0.0452526;
};
class legal_shops: lhm_RscText
{
	idc = 1010;
	text = "Legale Shops"; //--- ToDo: Localize;
	x = 0.506313;
	y = 0.200336;
	w = 0.249242;
	h = 0.0452526;
};
class Security_markers: lhm_RscText
{
	idc = 1011;
	text = "LSA Markers"; //--- ToDo: Localize;
	x = 0.506313;
	y = 0.262626;
	w = 0.249242;
	h = 0.0452526;
};
class Sonstige_Marker: lhm_RscText
{
	idc = 1012;
	text = "Sonstige Marker"; //--- ToDo: Localize;
	x = 0.505051;
	y = 0.3266;
	w = 0.249242;
	h = 0.0452526;
};
class Garagen_Marker: lhm_RscText
{
	idc = 1013;
	text = "Garagen"; //--- ToDo: Localize;
	x = 0.506313;
	y = 0.385522;
	w = 0.249242;
	h = 0.0452526;
};
class DP_Missions: lhm_RscText
{
	idc = 1014;
	text = "DP Missions"; //--- ToDo: Localize;
	x = 0.506313;
	y = 0.444445;
	w = 0.249242;
	h = 0.0452526;
};
class Lizenzen_shops: lhm_RscText
{
	idc = 1015;
	text = "Lizenzen Shops"; //--- ToDo: Localize;
	x = 0.507576;
	y = 0.503367;
	w = 0.249242;
	h = 0.0452526;
};
class ATM_Markers: lhm_RscText
{
	idc = 1016;
	text = "ATMs"; //--- ToDo: Localize;
	x = 0.506313;
	y = 0.56229;
	w = 0.249242;
	h = 0.0452526;
};
class Chop_Chops: lhm_RscText
{
	idc = 1017;
	text = "ChopChops"; //--- ToDo: Localize;
	x = 0.50505;
	y = 0.621212;
	w = 0.249242;
	h = 0.0452526;
};


	};
	
	class controls {
	class TimeText: lhm_RscText
		{
			idc = 8888;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		
		class ButtonClose : lhm_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "$STR_Global_Close";
			onButtonClick = "[] spawn {closeDialog 0; waituntil{!dialog;};[] call lhm_fnc_p_openMenu;};";
			x = 0.863636;
			y = 0.72559;
			w = 0.1;
			h = 0.1;
		};
		
	
class Markers_BTNs : lhm_RscActiveText
{
// All Farming Marker
	idc = 1018;
	sizeEx = 0.04;
	x = 0.401642;
	y = 0.195151;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Illegal_Farming_Markers: Markers_BTNs
{
	idc = 1019;
	x = 0.401515;
	y = 0.255892;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Legal_Farming_markers: Markers_BTNs
{
	idc = 1020;
	x = 0.401515;
	y = 0.316498;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Police_markers: Markers_BTNs
{
	idc = 1021;
	x = 0.401515;
	y = 0.378788;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Medic_markers: Markers_BTNs
{
	idc = 1022;
	x = 0.401515;
	y = 0.441078;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Legende: Markers_BTNs
{
	idc = 1023;
	x = 0.401515;
	y = 0.501684;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Gang_Markers: Markers_BTNs
{
	idc = 1024;
	x = 0.401515;
	y = 0.56229;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Info_Markers: Markers_BTNs
{
	idc = 1025;
	x = 0.401515;
	y = 0.619528;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_AllShops: Markers_BTNs
{
	idc = 1026;
	x = 0.401515;
	y = 0.678452;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Illegal_shops: Markers_BTNs
{
	idc = 1027;
	x = 0.401515;
	y = 0.739057;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Legal_shops: Markers_BTNs
{
	idc = 1028;
	x = 0.776515;
	y = 0.195286;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_LSA_Markers: Markers_BTNs
{
	idc = 1029;
	x = 0.776515;
	y = 0.259259;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Sonstige_marker: Markers_BTNs
{
	idc = 1030;
	x = 0.776515;
	y = 0.321549;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Garagen: Markers_BTNs
{
	idc = 1031;
	x = 0.776515;
	y = 0.380471;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_DP_Missions: Markers_BTNs
{
	idc = 1032;
	x = 0.775252;
	y = 0.441078;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_Lizenzen_shops: Markers_BTNs
{
	idc = 1033;
	x = 0.775252;
	y = 0.501684;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_ATM_Markers: Markers_BTNs
{
	idc = 1034;
	x = 0.775253;
	y = 0.565657;
	w = 0.0595959;
	h = 0.0511785;
	
};
class BTN_ChopChops: Markers_BTNs
{
	idc = 1035;
	x = 0.775252;
	y = 0.626263;
	w = 0.0595959;
	h = 0.0511785;
	
};
	};
};