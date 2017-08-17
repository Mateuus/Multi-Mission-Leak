class Life_RscButtonInvisible : Life_RscButtonMenu {
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
	colorBackground[] = {0, 0, 0, 0};
	colorBackground2[] = {1, 1, 1, 0};
	color[] = {1, 1, 1, 0};
	color2[] = {1, 1, 1, 0};
	colorText[] = {1, 1, 1, 0};
	colorDisabled[] = {1, 1, 1, 0};
};

class Life_CardSlotButton : Life_RscButtonInvisible {
};

class Life_BankButton : Life_RscButtonInvisible {
    /*soundEnter[] = { "", 0, 1 };
  	soundPush[] = { "bankbip.ogg", 0.1, 1 };
  	soundClick[] = { "", 0, 1 };
  	soundEscape[] = { "", 0, 1 };*/
};
