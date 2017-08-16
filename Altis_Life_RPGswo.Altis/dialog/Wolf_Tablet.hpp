class Wolf_Tablet
{
	idd=504999;
	movingenable=false;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	class controls 
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
		
		class ctrl_grafik_1: DWEV_RscPicture
		{
			idc = 505001;
			style = 2096;
			text = "";
			x = 0.1;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		class ctrl_button_1: DWEV_RscButtonInvisible
		{
			idc = 506001;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.1;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};

		class ctrl_grafik_2: DWEV_RscPicture
		{
			idc = 505002;
			style = 2096;
			text = "";
			x = 0.26;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		class ctrl_button_2: DWEV_RscButtonInvisible
		{
			idc = 506002;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.26;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_3: DWEV_RscPicture
		{
			idc = 505003;
			style = 2096;
			text = "";
			x = 0.42;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		class ctrl_button_3: DWEV_RscButtonInvisible
		{
			idc = 506003;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.42;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
	
		class ctrl_grafik_4: DWEV_RscPicture
		{
			idc = 505004;
			style = 2096;
			text = "";
			x = 0.58;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
	
		class ctrl_button_4: DWEV_RscButtonInvisible
		{
			idc = 506004;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.58;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
	
		class ctrl_grafik_5: DWEV_RscPicture
		{
			idc = 505005;
			style = 2096;
			text = "";
			x = 0.74;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_5: DWEV_RscButtonInvisible
		{
			idc = 506005;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.74;
			y = 0.075;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_6: DWEV_RscPicture
		{
			idc = 505006;
			style = 2096;
			text = "";
			x = 0.1;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		class ctrl_button_6: DWEV_RscButtonInvisible
		{
			idc = 506006;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.1;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_7: DWEV_RscPicture
		{
			idc = 505007;
			style = 2096;
			text = "";
			x = 0.26;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_7: DWEV_RscButtonInvisible
		{
			idc = 506007;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.26;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_8: DWEV_RscPicture
		{
			idc = 505008;
			style = 2096;
			text = "";
			x = 0.42;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_8: DWEV_RscButtonInvisible
		{
			idc = 506008;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.42;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};

		class ctrl_grafik_9: DWEV_RscPicture
		{
			idc = 505009;
			style = 2096;
			text = "";
			x = 0.58;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		class ctrl_button_9: DWEV_RscButtonInvisible
		{
			idc = 506009;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.58;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_10: DWEV_RscPicture
		{
			idc = 505010;
			style = 2096;
			text = "";
			x = 0.74;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_10: DWEV_RscButtonInvisible
		{
			idc = 506010;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.74;
			y = 0.235;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_11: DWEV_RscPicture
		{
			idc = 505011;
			style = 2096;
			text = "";
			x = 0.1;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_11: DWEV_RscButtonInvisible
		{
			idc = 506011;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.1;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_12: DWEV_RscPicture
		{
			idc = 505012;
			style = 2096;
			text = "";
			x = 0.26;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_12: DWEV_RscButtonInvisible
		{
			idc = 506012;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.26;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_13: DWEV_RscPicture
		{
			idc = 505013;
			style = 2096;
			text = "";
			x = 0.42;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_13: DWEV_RscButtonInvisible
		{
			idc = 506013;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.42;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_14: DWEV_RscPicture
		{
			idc = 505014;
			style = 2096;
			text = "";
			x = 0.58;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_14: DWEV_RscButtonInvisible
		{
			idc = 506014;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.58;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_15: DWEV_RscPicture
		{
			idc = 505015;
			style = 2096;
			text = "";
			x = 0.74;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_15: DWEV_RscButtonInvisible
		{
			idc = 506015;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.74;
			y = 0.395;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_16: DWEV_RscPicture
		{
			idc = 505016;
			style = 2096;
			text = "";
			x = 0.1;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_16: DWEV_RscButtonInvisible
		{
			idc = 506016;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.1;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_17: DWEV_RscPicture
		{
			idc = 505017;
			style = 2096;
			text = "";
			x = 0.26;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_17: DWEV_RscButtonInvisible
		{
			idc = 506017;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.26;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_18: DWEV_RscPicture
		{
			idc = 505018;
			style = 2096;
			text = "";
			x = 0.42;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_18: DWEV_RscButtonInvisible
		{
			idc = 506018;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.42;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_19: DWEV_RscPicture
		{
			idc = 505019;
			style = 2096;
			text = "";
			x = 0.58;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_19: DWEV_RscButtonInvisible
		{
			idc = 506019;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.58;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_20: DWEV_RscPicture
		{
			idc = 505020;
			style = 2096;
			text = "";
			x = 0.74;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_20: DWEV_RscButtonInvisible
		{
			idc = 506020;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.74;
			y = 0.555;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_21: DWEV_RscPicture
		{
			idc = 505021;
			style = 2096;
			text = "";
			x = 0.1;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_21: DWEV_RscButtonInvisible
		{
			idc = 506021;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.1;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_22: DWEV_RscPicture
		{
			idc = 505022;
			style = 2096;
			text = "";
			x = 0.26;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_22: DWEV_RscButtonInvisible
		{
			idc = 506022;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.26;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_23: DWEV_RscPicture
		{
			idc = 505023;
			style = 2096;
			text = "";
			x = 0.42;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_23: DWEV_RscButtonInvisible
		{
			idc = 506023;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.42;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_24: DWEV_RscPicture
		{
			idc = 505024;
			style = 2096;
			text = "";
			x = 0.58;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_24: DWEV_RscButtonInvisible
		{
			idc = 506024;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.58;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_grafik_25: DWEV_RscPicture
		{
			idc = 505025;
			style = 2096;
			text = "";
			x = 0.74;
			y = 0.715;
			w = 0.15;
			h = 0.15;
		};
		
		class ctrl_button_25: DWEV_RscButtonInvisible
		{
			idc = 506025;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.74;
			y = 0.715;
			w = 0.15;
			h = 0.15;
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
