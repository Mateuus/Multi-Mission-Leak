class hst_life_phone_sms_send {
	idd = 61206;
	name= "hst_life_phone_sms_send";
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
		class phoneTargetNumber : Life_RscEdit {
			idc = 3003;
			text = "";
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.60);
			w = PHONE_MAX_WIDTH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
			h = 0.1;
		};
		class phoneTargetNumberTitle : Life_RscText {
			idc = -1;
			text = "Numer:";
			x = PHONE_GRID_X;
			style = 0;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.68);
			w = PHONE_MAX_WIDTH;
			h = 0.08;
		};
		class phoneSmsMessage : Life_RscEdit {
			idc = 3004;
			text = "";
			x = PHONE_GRID_X;
			style = 16;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.4);
			w = PHONE_MAX_WIDTH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
			h = 0.3;
		};
		class phoneSmsMessageTitle : Life_RscText {
			idc = -1;
			text = "Tresc:";
			x = PHONE_GRID_X;
			style = 0;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.48);
			w = PHONE_MAX_WIDTH;
			h = 0.08;
		};
		class phoneSmsSendTitle : Life_RscText {
			idc = 3005;
			text = "Wyslij sms";
			style = "2";
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.05;
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneSend : Life_RscButtonInv {
			idc = 3001;
			action = "[61206] call hst_life_phone_buttons_fnc_send";
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
			action = "[61206] call hst_life_phone_buttons_fnc_back";
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
			text = PHONE_SEND;
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