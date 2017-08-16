class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
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
		
		class RscTitleText : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3501;
			text = "";
			x = 0.15;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
		
		class VehicleWeight : RscTitleText
		{
			idc = 3504;
			style = 1;
			text = "";
		};
		
		class RscTrunkText : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Kofferraum";
			sizeEx = 0.04;
			
			x = 0.15;
			y = 0.25;
			w = 0.3;
			h = 0.04;
		};
		
		class RscPlayerText : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Dein Inventar";
			sizeEx = 0.04;
			
			x = 0.53;
			y = 0.25;
			w = 0.3;
			h = 0.04;
		};	
	};
	
	class Controls
	{
		class KofferraumTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Kofferraum";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class TrunkGear : DWEV_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.16;
			y = 0.29;
			w = 0.3;
			h = 0.42;
		};
		
		class PlayerGear : DWEV_RscListBox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.54;
			y = 0.29;
			w = 0.3;
			h = 0.42;
		};
		
		class TrunkEdit : DWEV_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.16;
			y = 0.72;
			w = 0.3;
			h = 0.03;
		};
		
		class PlayerEdit : DWEV_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.54;
			y = 0.72;
			w = 0.3;
			h = 0.03;
		};
		
		class ctrl_grafik_nehmen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_aufloesen.paa";
			x = 0.2725;
			y = 0.78;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_nehmen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Gegenstand aus dem Fahrzeug nehmen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_vehTakeItem;";
			x = 0.2725;
			y = 0.78;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_grafik_rein: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_upgrade.paa";
			x = 0.6525;
			y = 0.78;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_rein: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Gegenstand in das Fahrzeug legen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_vehStoreItem;";
			x = 0.6525;
			y = 0.78;
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