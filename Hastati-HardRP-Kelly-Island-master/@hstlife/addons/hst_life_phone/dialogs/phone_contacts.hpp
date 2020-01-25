class hst_life_phone_contacts {
	idd = 61203;
	name= "hst_life_phone_contacts";
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
		class phoneContacts : Life_RscListBox
		{
			idc = 3005;
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.05;
			w = PHONE_MAX_WIDTH;
			h = PHONE_MAX_HEIGHT - 0.16;
		};
		class phoneCall : Life_RscButtonInv {
			idc = 3001;
			text = "";
			type = 1;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
			action = "[61203] call hst_life_phone_buttons_fnc_call";
		};
		
		class phoneAdd : Life_RscButtonInv {
			idc = 3002;
			text = "";
			action = "[61203] call hst_life_phone_buttons_fnc_add";
			type = 1;
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
		
		class phoneMessages : Life_RscButtonInv {
			idc = 3003;
			text = "";
			action = "[61203] call hst_life_phone_buttons_fnc_message";
			type = 1;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
		
		class phoneDelete : Life_RscButtonInv {
			idc = 3004;
			text = "";
			action = "[61203] call hst_life_phone_buttons_fnc_remove";
			type = 1;
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};		
		class phoneReturn : Life_RscButtonInv {
			idc = 3005;
			text = "";
			action = "[61203] call hst_life_phone_buttons_fnc_back";
			type = 1;
			x = PHONE_GRID_X + 4 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
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
			w = (PHONE_MAX_WIDTH / 5);
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_ADD;
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
		class phoneButtonBackground3 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_MESSAGE;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
		class phoneButtonBackground4 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_REMOVE;
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
		class phoneButtonBackground5 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 4 * (PHONE_MAX_WIDTH / 5);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 5);
		};
	};
};