class DWEV_impound_menu
{
	idd = 2800;
	name="DWEV_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; ctrlShow [2330,false];";
	
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

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Garage";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class VehicleTitleBox : DWEV_RscText
		{
			idc = -1;
			text = "Deine Fahrzeuge";
			colorBackground[] = {0, 0, 0, 0};
			x = 0.11;
			y = 0.22;
			w = 0.3;
			h = 0.04;
		};
		
		class VehicleInfoHeader : DWEV_RscText
		{
			idc = 2830;
			text = "Fahrzeug Informationen";
			colorBackground[] = {0, 0, 0, 0};
			x = 0.42;
			y = 0.22;
			w = 0.46;
			h = 0.04);
		};
	
		class ctrl_grafik_ausparken: DWEV_RscPicture
		{
			idc = 507009;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_carKauf.paa";
			x = 0.1;
			y = 0.82;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_ausparken: DWEV_RscButtonInvisible
		{
			idc = 507010;
			text = "";
			tooltip = "Fahrzeug ausparken";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "if (!DWEV_persoReady) then {hint ""Du musst zuerst einen Personalausweis beim Einwohnermeldeamt Kavala beantragen!"";} else {[] call DWEV_fnc_unimpound;};";
			x = 0.1;
			y = 0.82;
			w = 0.075;
			h = 0.075;
		};
			
		class ctrl_grafik_Verkaufen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_carVK.paa";
			x = 0.825;
			y = 0.82;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_Verkaufen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Fahrzeug verkaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_sellGarage;";
			x = 0.825;
			y = 0.82;
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
	
	class controls
	{
		class VehicleList : DWEV_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.03; //sizeEx = 0.03
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "_this call DWEV_fnc_garageLBChange;";
			x = 0.11;
			y = 0.262;
			w = 0.303;
			h = 0.49;
		};
		
		class vehicleInfomationList : DWEV_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			
			x = 0.41;
			y = 0.26;
			w = 0.5;
			h = 0.5;
		};
		
		class MainBackgroundHider : DWEV_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 2810;
			x = 0.1;
			y = 0.204;
			w = 0.8;
			h = 0.612;
		};
		
		class MainHideText : DWEV_RscText
		{
			idc = 2811;
			text = "Datenbank wird abgefragt, bitte warten";
			sizeEx = 0.04;
			x = 0.24;
			y = 0.46;
			w = 0.6;
			h = 0.066;
		};
	};
};