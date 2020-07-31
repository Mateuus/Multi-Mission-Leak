class hst_life_phone_main {
	idd = 61201;
	name= "hst_life_phone_main";
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
		class phoneNumberInput : Life_RscEdit 
		{
			idc = 3005;
			text = ""; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
			y = PHONE_GRID_Y + 0.65;
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneCall : Life_RscButtonInv {
			idc = 3001;
			action = "[61201] call hst_life_phone_buttons_fnc_call";
			text = "";
			type = 1;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneMessages : Life_RscButtonInv {
			idc = 3003;
			action = "closeDialog 0; [61201] call hst_life_phone_buttons_fnc_message";
			text = "";
			type = 1;
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneContacts : Life_RscButtonInv {
			idc = 3002;
			action = "closeDialog 0; [] call hst_life_phone_dialogs_fnc_contacts;";
			text = "";
			type = 1;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		

		
		class phoneReject : Life_RscButtonInv {
			idc = 3004;
			action = "[61201] call hst_life_phone_buttons_fnc_reject";
			text = "";
			type = 1;
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
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
			text = PHONE_CALL;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_MESSAGE;
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground3 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_CONTACTS;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground4 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_REJECT;
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneNumber: Life_RscText
		{
			idc = 3006;
			text = "123456789"; //--- ToDo: Localize;
			style = 2;
			x = PHONE_GRID_X + 0.01;
			y = PHONE_GRID_Y + 0.04;
			w = (PHONE_MAX_WIDTH - 0.04);
			h = 0.16;
			sizeEx = 0.08;
		};
		class phoneEvent: Life_RscText
		{
			idc = 3007;
			text = "1 Nowa wiadomosc, 1 Nieodebrane polaczenie"; //--- ToDo: Localize;
			style = 18;
			x = PHONE_GRID_X + 0.01;
			y = PHONE_GRID_Y + 0.21;
			w = (PHONE_MAX_WIDTH - 0.02);
			h = 0.36;
		};
	};
};