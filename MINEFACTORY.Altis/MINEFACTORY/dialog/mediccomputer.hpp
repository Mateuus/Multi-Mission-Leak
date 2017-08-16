class kommandozentrale {
	idd = 13525;
	name= "kommandozentrale";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_kommandozentrale;";
	
	controls[] = {
		text_hintergrund,
		text_uberschrift,
		btn_annehmen,
		btn_abbrechen,
		btn_ablehnen,
		tb_spielerinfo,
		lb_tote
	};
	
	class text_hintergrund: RscText
	{
		idc = 1002;
		x = 0.270833 * safezoneW + safezoneX;
		y = 0.225107 * safezoneH + safezoneY;
		w = 0.464063 * safezoneW;
		h = 0.516798 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class text_uberschrift: RscText
	{
		idc = 1005;
		text = "                                                                 Medic Computer"; //--- ToDo: Localize;
		x = 0.270833 * safezoneW + safezoneX;
		y = 0.225107 * safezoneH + safezoneY;
		w = 0.464063 * safezoneW;
		h = 0.0329871 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
	class lb_tote: Life_RscListbox
	{
		onLBSelChanged = "[_this] spawn life_fnc_mediccomputerabfrage;";
		sizeEx = 0.035;
		idc = 13526;
		x = 0.288021 * safezoneW + safezoneX;
		y = 0.291082 * safezoneH + safezoneY;
		w = 0.166146 * safezoneW;
		h = 0.417837 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
	class btn_abbrechen: RscButtonMenu
	{
		onButtonClick = "closeDialog 0;";
		idc = 2400;
		text = "Abbrechen"; //--- ToDo: Localize;
		x = 0.654687 * safezoneW + safezoneX;
		y = 0.686927 * safezoneH + safezoneY;
		w = 0.0744792 * safezoneW;
		h = 0.0439828 * safezoneH;
	};
	class btn_annehmen: RscButtonMenu
	{
		onButtonClick="[1] call life_fnc_kommandomode;";
		idc = 13527;
		text = "Annehmen"; //--- ToDo: Localize;
		x = 0.471354 * safezoneW + safezoneX;
		y = 0.686927 * safezoneH + safezoneY;
		w = 0.0744792 * safezoneW;
		h = 0.0439828 * safezoneH;
	};
	class btn_ablehnen: RscButtonMenu
	{
		onButtonClick = "[2] call life_fnc_kommandomode;";
		idc = 13528;
		text = "Ablehnen"; //--- ToDo: Localize;
		x = 0.563021 * safezoneW + safezoneX;
		y = 0.686927 * safezoneH + safezoneY;
		w = 0.0744792 * safezoneW;
		h = 0.0439828 * safezoneH;
	};
	class tb_spielerinfo: Life_RscStructuredText
	{
		idc = 13529;
		x = 0.477083 * safezoneW + safezoneX;
		y = 0.291081 * safezoneH + safezoneY;
		w = 0.160417 * safezoneW;
		h = 0.351863 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
};
