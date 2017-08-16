#define INFINITE 1e+1000
#define IDC_Earplugs_Back 167323
#define IDC_Earplugs_Image 167324
class EarplugsHUD {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "EarplugsHUD";
	onLoad = "uiNamespace setVariable ['EarplugsHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		Taki_Earplugs_back,
		Taki_Earplugs_Image
	};

  class Taki_Earplugs_back: Life_RscBackground
  {
  	idc = IDC_Earplugs_Back;
  	x = 0.95375 * safezoneW + safezoneX;
  	y = 0.797 * safezoneH + safezoneY;
  	w = 0.0464063 * safezoneW;
  	h = 0.077 * safezoneH;
  	colorBackground[] = {0,0,0,0};
  	colorActive[] = {0,0,0,0};
  };
  class Taki_Earplugs_Image: Life_RscPicture
  {
  	idc = IDC_Earplugs_Image;
  	text = "\sndimg\icons\earplugs_icon.paa";
  	x = 0.958906 * safezoneW + safezoneX;
  	y = 0.808 * safezoneH + safezoneY;
  	w = 0.0309375 * safezoneW;
  	h = 0.055 * safezoneH;
    colorBackground[] = {0,0,0,0};
  };
};
