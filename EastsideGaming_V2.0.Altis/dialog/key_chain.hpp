class Life_key_management {
    idd = 2700;
    name= "life_key_chain";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_keyMenu;";

    class controlsBackground {
				class bg_pic: Life_RscPicture
				{
					idc = -1;
					text = "texture\misc\bg_menu.paa";
					x = 0.17 * safezoneW + safezoneX;
					y = 0.115 * safezoneH + safezoneY;
					w = 0.665156 * safezoneW;
					h = 0.693 * safezoneH;
				};
				class title_header: Life_RscStructuredText
				{
					idc = -1;
					text = "<t font='PuristaBold' size='1.5'>Schlüsselbund</t>"; //--- ToDo: Localize;
					x = 0.175156 * safezoneW + safezoneX;
					y = 0.126 * safezoneH + safezoneY;
					w = 0.262969 * safezoneW;
					h = 0.044 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
		};

		class controls {
				class btn_close: Life_RscButtonMenu
				{
					idc = -1;
					text = "Schliessen"; //--- ToDo: Localize;
					x = 0.7475 * safezoneW + safezoneX;
					y = 0.764 * safezoneH + safezoneY;
					w = 0.0773437 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "closeDialog 0;";
					class Attributes {
						align = "center";
					};
				};
				class title_lb: Life_RscTitle
				{
					idc = -1;
					text = "Deine Fahrzeuge:"; //--- ToDo: Localize;
					x = 0.190625 * safezoneW + safezoneX;
					y = 0.214 * safezoneH + safezoneY;
					w = 0.232031 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class KeyChainList: Life_RscListbox
				{
					idc = 2701;
					text = "";
					sizeEx = 0.035;
					x = 0.195781 * safezoneW + safezoneX;
					y = 0.258 * safezoneH + safezoneY;
					w = 0.226875 * safezoneW;
					h = 0.528 * safezoneH;
				};
				class GiveKey: Life_RscButtonMenu
				{
					idc = 2401;
					text = "Schlüssel weitergeben"; //--- ToDo: Localize;
					x = 0.438125 * safezoneW + safezoneX;
					y = 0.423 * safezoneH + safezoneY;
					w = 0.139219 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
					onButtonClick = "[] call life_fnc_keyGive";
					class Attributes {
						align = "center";
					};
				};
				class title_players: Life_RscTitle
				{
					idc = -1;
					text = "Spieler in der Nähe:"; //--- ToDo: Localize;
					x = 0.432969 * safezoneW + safezoneX;
					y = 0.214 * safezoneH + safezoneY;
					w = 0.232031 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class NearPlayers: Life_RscListbox
				{
					idc = 2702;
					text = "";
					x = 0.438125 * safezoneW + safezoneX;
					y = 0.269 * safezoneH + safezoneY;
					w = 0.221719 * safezoneW;
					h = 0.132 * safezoneH;
					sizeEx = 0.035;
				};
				class DropKey: Life_RscButtonMenu
				{
					idc = 2402;
					text = "Schlüssel wegwerfen"; //--- ToDo: Localize;
					onButtonClick = "[] call life_fnc_keyDrop";
					x = 0.438125 * safezoneW + safezoneX;
					y = 0.478 * safezoneH + safezoneY;
					w = 0.139219 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {0.753,0.145,0.145,1};
					class Attributes {
						align = "center";
					};
				};
		};
};
