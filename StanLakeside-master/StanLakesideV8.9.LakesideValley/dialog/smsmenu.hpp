class a3l_smsmenu
{
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable [""tabletmenu"", _this select 0]; [] spawn life_fnc_cellphone; smsmenuisopen = 1; [] call fnc_fadephone; ";
	onunload = "smsmenuisopen = 0;";
	class controls {
		class dembackground: life_RscPicture
		{
			idc = 4124;
			text = "\CG_Client\textures\smsmenu.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};

	class CTRL_PHONE_BG: RscStructuredText
	{    
		idc = 7017;
		text = "";
		x = 0.320594 * safezoneW + safezoneX;
		y = 0.305 * safezoneH + safezoneY;
		w = 0.35585 * safezoneW;
		h = 0.3512 * safezoneH;
		ColorBackground[] = {1, 1, 1, 1};
	}; 
	class inboxlistbox: life_RscListbox
	{
		idc = 1500;
		x = 0.323958 * safezoneW + safezoneX;
		y = 0.326852 * safezoneH + safezoneY;
		w = 0.161042 * safezoneW;
		h = 0.139259 * safezoneH;
		onLbSelChanged = [] call fnc_smsselected;
	};
	class contacts: life_RscListbox
	{
		idc = 1501;
		x = 0.322917 * safezoneW + safezoneX;
		y = 0.505556 * safezoneH + safezoneY;
		w = 0.159479 * safezoneW;
		h = 0.12074 * safezoneH;
	};
	class typetoplayer: life_RscEdit
	{
		idc = 1800;
		style = 16;
		x = 0.489687 * safezoneW + safezoneX;
		y = 0.565074 * safezoneH + safezoneY;
		w = 0.182917 * safezoneW;
		h = 0.089037 * safezoneH;
	};
	class conversation: RscStructuredText
	{
		idc = 1801;
		x = 0.488542 * safezoneW + safezoneX;
		y = 0.328704 * safezoneH + safezoneY;
		w = 0.184479 * safezoneW;
		h = 0.177 * safezoneH;
	};
	class sendmsg: Life_RscButtonSilent
	{
		idc = 1802;
		x = 0.615625 * safezoneW + safezoneX;
		y = 0.534259 * safezoneH + safezoneY;
		w = 0.0573958 * safezoneW;
		h = 0.0281482 * safezoneH;
		onButtonClick = "[] call fnc_sms_textmsg";
	};
	class delconv: Life_RscButtonSilent
	{
		idc = 1803;
		x = 0.324479 * safezoneW + safezoneX;
		y = 0.62963 * safezoneH + safezoneY;
		w = 0.160521 * safezoneW;
		h = 0.0290741 * safezoneH;
	};

	
	};
};
