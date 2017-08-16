class Slots
{
	idd = 41000;
	name = "Slots";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground
	{
		class RscTitleBackground : GTA_RscTitle
		{
			idc = -1;
			x = 0.0;
			y = 0.2;
			w = 1.0;
			h = (1 / 25);
		};

		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.2 + (11 / 250); // 0.244
			w = 1.0;
			h = 0.7 - (22 / 250); // 0.612
		};

		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 41001;
			text = "Slot Machine";
			x = 0.0;
			y = 0.2;
			w = 1.0;
			h = (1 / 25);
		};

		class RscTitleTextRight : RscTitleText
		{
			idc = 41002;
			style = 1;
			text = "Loading...";
		};
	};

	class Controls
	{
		class RscPictureRowA: Life_RscPicture
		{
			idc = 41003;
			text = "icons\slots\bar.paa";

			x = 0.05; y = 0.364;
			w = 0.266; h = 0.372;
		};

		class RscPictureRowB: Life_RscPicture
		{
			idc = 41004;
			text = "icons\slots\bar.paa";

			x = 0.366; y = 0.364;
			w = 0.266; h = 0.372;
		};

		class RscPictureRowC: Life_RscPicture
		{
			idc = 41005;
			text = "icons\slots\bar.paa";

			x = 0.682; y = 0.364;
			w = 0.266; h = 0.372;
		};

		class ButtonClose : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.0;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonPlay : Life_RscButtonMenu
		{
			idc = 41006;
			text = "Play";
			onButtonClick = "[] spawn life_fnc_slotPlay;";
			x = 1.0 - (6.25 / 40);
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
