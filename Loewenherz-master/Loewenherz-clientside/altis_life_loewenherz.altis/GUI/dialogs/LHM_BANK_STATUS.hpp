class LHM_BANK_STATUS {
	idd = 1337;
	name= "LHM_BANK_STATUS";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_bankGroupMenu;";

	class controlsBackground {
		class MAIN_BCKGRND: lhm_RscText
{
	idc = 1005;
	colorBackground[] = {0, 0, 0, 0.7};
	x = 0.300505;
	y = 0.367004;
	w = 0.376515;
	h = 0.170707;
	
};

class Auslastung_Header: lhm_RscText
{
	idc = 1000;
	colorBackground[] = {0, 0, 0, 1};
	//text = "Security Server Status";
	x = 0.30063;
	y = 0.331583;
	w = 0.375632;
	h = 0.0349495;

};
class HACKING_STATUS: lhm_RscStructuredText
{
	idc = 1001;
	x = 0.536995;
	y = 0.37037;
	w = 0.139141;
	h = 0.109899;

};
class DISPLAY_WHATS_HAPPENING: lhm_RscStructuredText
{
	idc = 1002;
	x = 0.30303;
	y = 0.37037;
	w = 0.222475;
	h = 0.109899;

};
	};

	class controls {
	class ON_OFF_BTN: lhm_RscActiveText
	{
		idc = 1003;
		sizeEx = 0.04;
		x = 0.612374;
		y = 0.488215;
		w = 0.0646465;
		h = 0.0459259;
	
	};
	class Close_BTN: lhm_RscActiveText
	{
		idc = 1004;
		sizeEx = 0.04;
		x = 0.30303;
		y = 0.486532;
		w = 0.0646465;
		h = 0.0459259;
	
	};


		
	};
};