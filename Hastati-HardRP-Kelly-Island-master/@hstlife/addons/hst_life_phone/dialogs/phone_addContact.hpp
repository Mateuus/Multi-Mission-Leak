class hst_life_phone_addContact {
	idd = 61202;
	name= "hst_life_phone_addContact";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	class controlsBackground {
		class MainBackground : Life_RscPicture {
			colorBackground[] = {0, 0, 0, 0.7};
			text = "\hst_life_phone\images\phone_textures\phone_1.paa";
			idc = -1;
			style = "2096";
			x = 0.59;
			y = -0.91;
			w = 1;
			h = 3;
		};
	};
	
	class controls {		
		class phoneContactNumber : Life_RscEdit {
			idc = 3003;
			text = "";
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.27;
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneContactNumberTitle : Life_RscText 
		{
			idc = -1;
			text = "Numer:"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.21;
			w = PHONE_MAX_WIDTH;
			style = "0";
			h = 0.08;
		};
		class phoneContactNameTitle : Life_RscText 
		{
			idc = -1;
			text = "Nazwa:"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.41;
			w = PHONE_MAX_WIDTH;
			style = "0";
			h = 0.08;
		};
		class phoneContactName : Life_RscEdit {
			idc = 3004;
			text = "";
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.47;
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneContactTitle : Life_RscText 
		{
			idc = 3005;
			text = "Dodaj kontakt"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.05;
			w = PHONE_MAX_WIDTH;
			style = "2";
			h = 0.1;
		};
		class phoneAdd : Life_RscButtonInv {
			idc = 3001;
			action = "[61202] call hst_life_phone_buttons_fnc_add";
			text = "";
			type = 1;
			x = PHONE_GRID_X + (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneReturn : Life_RscButtonInv {
			idc = 3002;
			text = "";
			action = "[61205] call hst_life_phone_buttons_fnc_back";
			type = 1;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
		};
		class phoneSettings : Life_RscButtonInv {
			idc = 3010;
			type = 1;
			text = "";
			action = "closeDialog 0; [] spawn hst_life_phone_dialogs_fnc_settings";
			colorBackground[] = {0,0,0,0.3};
			x = PHONE_GRID_X - 0.005;
			y = PHONE_GRID_Y - 0.005;
			w = PHONE_MAX_WIDTH + 0.035;
			h = 0.045;
		};
		class Life_RscTitleBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.3};
			x = PHONE_GRID_X - 0.005;
			idc = -1;
			y = PHONE_GRID_Y - 0.005;
			w = PHONE_MAX_WIDTH + 0.035;
			h = 0.045;
			text = "Telefon";
		};

		class phoneButtonBackground1 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_ADD;
			x = PHONE_GRID_X + (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
	};
};