class Federal_Safe
{
	idd = 3500;
	name = "Federal_Safe";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
	class controlsBackground
	{
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
/*		// muss nicht angezeigt werden?
		class RscTitleText : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3501;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = 0.04;
		};
		
		class VehicleWeight : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3504;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = 0.04;
		};
*/		
		class BankTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Bundesbank Safe";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
	};
	
	class Controls
	{
		class TrunkGear : DWEV_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.35;
			y = 0.25;
			w = 0.3;
			h = 0.38;
		};
		
		class TrunkEdit : DWEV_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.35;
			y = 0.64;
			w = 0.3;
			h = 0.03;
		};
		
		class ctrl_grafik_nehmen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.4625;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_nehmen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Fahrzeug verkaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_safeTake;";
			x = 0.4625;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};