class LicenseShop {
idd = 5546;
name= "DWEV_license_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; uiNamespace setVariable [""LicenseShop"", _this select 0];";
objects[] = { };
class controls {
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
			text = "Lizenzen";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 

	class listbox: DWEV_RscListBox
	{
		idc = 55126;
		sizeEx = 0.03;
		colorBackground[] = {0, 0, 0, 0};
		x = 0.1125;
		y = 0.3;
		w = 0.3125;
		h = 0.4;
	};
	
	class MyLicenses : DWEV_RscText
		{
		idc = 55130;
		text = "Kaufbare Lizenzen";
		x = 0.165;
		y = 0.24;
		w = 0.3125;
		h = 0.04;
	};
	
	class ShowLicenseslistbox: DWEV_RscListBox
	{
		idc = 55131;
		sizeEx = 0.03;
		colorBackground[] = {0, 0, 0, 0};
		x = 0.55;
		y = 0.3;
		w = 0.3125;
		h = 0.4;
	};
	
	class ShowLicenses : DWEV_RscText
	{
		idc = 55129;
		text = "Deine Lizenzen";
		x = 0.62;
		y = 0.24;
		w = 0.3125;
		h = 0.04;
	};

	class ctrl_grafik_kaufen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.23125;
			y = 0.72;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_kaufen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Lizenz kaufen";
			colorBackground[] = {0, 0, 0, 0};
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call DWEV_fnc_buyLicense;[] call DWEV_fnc_updateLicenses;};";
			x = 0.23125;
			y = 0.72;
			w = 0.075;
			h = 0.075;
		};
	
	class ctrl_grafik_verkaufen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.66875;
			y = 0.72;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_verkaufen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Lizenz verkaufen";
			colorBackground[] = {0, 0, 0, 0};
			action = "if( (lbData[55131,lbCurSel (55131)] != """") ) then { [false, false, false, lbData[55131,lbCurSel (55131)]] call DWEV_fnc_sellLicense;[] call DWEV_fnc_updateLicenses;};";
			x = 0.66875;
			y = 0.72;
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