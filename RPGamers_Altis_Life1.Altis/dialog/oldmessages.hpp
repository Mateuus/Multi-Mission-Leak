class Life_cell_old_msgs {
	idd = 98111;
	name= "life_cell_old_messages";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class FromBar: Life_RscText
		{
			idc = -1;

			text = "From"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MessageBar: Life_RscText
		{
			idc = -1;

			text = "Message"; //--- ToDo: Localize;
			x = 0.545937 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.185626 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {	
		class TextBox: Life_RscStructuredText
		{
			idc = 98113;

			x = 0.5525 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.252 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class PlayerList: Life_RscListBox
		{
			idc = 98112;
			onLBSelChanged = "[] call life_fnc_lbChanged";

			x = 0.5525 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.196 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class DeleteButton: Life_RscButtonMenu
		{
			idc = 98114;
			onButtonClick = "[] spawn life_fnc_deleteMessage";

			text = "Delete"; //--- ToDo: Localize;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.7,0,0,0.7};
		};
		class ReplyButton: Life_RscButtonMenu
		{
			idc = 98115;
			onButtonClick = "[] spawn life_fnc_replyMessage";

			text = "Reply"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.9,0.5,0.1,1};
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1007;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};