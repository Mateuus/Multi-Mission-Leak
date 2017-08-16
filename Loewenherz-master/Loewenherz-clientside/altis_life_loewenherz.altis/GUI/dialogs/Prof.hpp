/*
File: prof.hpp
Author: Jacob "PapaBear" Tyler
Edited By: [midgetgrimm]
Description:
Dialog for new gui
*/
class lhm_Prof_Dialog
{
	idd = 7730;
	name = "lhm_prof_dialog";
	movingEnabled = false;
	enableSimulation = true;
	 
	class controlsBackground
	{
			class TabletBCKGRND: lhm_RscPicture 
			{
				idc = -1;
				text = "core\textures\icons\Menu\tablet.paa";
				x = -0.0195705;
				y = -0.104647;
				w = 1.08561;
				h = 1.18714;
			
			};
			
			class PictureClose: lhm_RscPicture
			{
				idc = 1206;
				text = "core\textures\icons\Menu\close.paa";
				x = 0.123737;
				y = 0.745791;
				w = 0.0875;
				h = 0.1;
			};
			//class Frame: lhm_RscTitle
			//{
			//	idc = -1;
			//	text = "$STR_SKILL_FRAME";
			//	colorBackground[] = {0,0,0.388,1};
			//	style=0x02;
			//	tooltip = "$STR_SKILL_TOOLTIP1";
			//	//tooltipColorShade[] = {0.267,0.267,0.267,1};
			//	tooltipColorText[] = {1,1,1,1};
			//	tooltipColorBox[] = {1,1,1,1};
			//	x = 0.1;
			//	y = 0.15;
			//	w = 0.8;
			//	h = (1 / 25);
			//};
			class Prof3Header : lhm_RscText
			{
				idc = -1;
				//colorBackground[] = {0,0,0.388,1};
				text = "$STR_SKILL_CURRENTXP";
				sizeEx = 0.04;
				style=0x02;
				x = 0.681818;
				y = 0.488216;
				w = 0.214899;
				h = 0.0259259;
			};
			
			class Prof2Header : lhm_RscText
			{
				idc = -1;
				//colorBackground[] = {0,0,0.388,1};
				text = "$STR_SKILL_LEVEL";
				sizeEx = 0.04;
				style=0x02;
				x = 0.431818;
				y = 0.304714;
				w = 0.163131;
				h = 0.0494949;
			};
			
			class ProfHeader : lhm_RscText
			{
				idc = -1;
				//colorBackground[] = {0,0,0.388,1};
				text = "$STR_SKILL_LEARNED";
				sizeEx = 0.04;
				style=0x02;
				tooltip = "$STR_SKILL_TOOLTIP2";
				//tooltipColorShade[] = {0.267,0.267,0.267,1};
				tooltipColorText[] = {1,1,1,1};
				tooltipColorBox[] = {1,1,1,1};
				x = 0.127525;
				y = 0.210505;
				w = 0.214899;
				h = 0.0494949;
			};/*
			class currentExp: lhm_RscTitle
			{
				idc = -1;
				colorBackground[] = {0,0,0.388,1};
				text = "Current XP";
				sizeEx = 0.04;
				style=0x02;
				//onLBSelChanged = "";
				x = 0.62; y = 0.35;
				w = 0.275;h = 0.04;
			};*/
			class nextExp: lhm_RscText
			{
				idc = -1;
				//colorBackground[] = {0,0,0.388,1};
				text = "$STR_SKILL_NEXTLEVEL";
				sizeEx = 0.04;
				style=0x02;
				x = 0.681818;
				y = 0.284512;
				w = 0.214899;
				h = 0.0309764;
			};
	};
	class controls
	{
			
			class Prof4_Text: lhm_RscText
			{
				idc = 7734;
				//colorBackground[] = {0, 0, 0, 0};
				text = "";
			//	style = "0x02 + 0xC0";
				sizeEx = 0.08;
				x = 0.680556;
				y = 0.326599;
				w = 0.216162;
				h = 0.106532;
			};
			class Prof3_Text: lhm_RscText
			{
				idc = 7733;
				//colorBackground[] = {0, 0, 0, 0};
				text = "";
				//style = "0x02 + 0xC0";
				sizeEx = 0.08;
				//onLBSelChanged = "";
				x = 0.681818;
				y = 0.528619;
				w = 0.216162;
				h = 0.106532;
			};
			class Prof2_Text: lhm_RscText
			{
				idc = 7732;
				//colorBackground[] = {0, 0, 0, 0};
				text = "";
				//style = 0x02;
				sizeEx = 0.2;
				//onLBSelChanged = "";
				x = 0.430555;
				y = 0.367003;
				w = 0.164773;
				h = 0.147407;
			};
			class Prof_Text: lhm_RscListBox
			{
				idc = 7731;
				//colorBackground[] = {0, 0, 0, 0};
				text="";
				style = 0x02;
				sizeEx = 0.045;
				onLBSelChanged = "[_this] spawn lhm_fnc_grabSkills";
				x = 0.122727;
				y = 0.266532;
				w = 0.225;
				h = 0.46;
			};
			
			class TimeText: lhm_RscText
			{
				idc = 7858;
				SizeEx = 0.027;
				text = "";
				x = 0.930556;
				y = 0.127946;
				w = 0.0534085;
				h = 0.033266;
			};
			class ButtonClose : lhm_RscButtonSilent {
				idc = -1;
				//shortcuts[] = {0x00050000 + 2};
				tooltip = "$STR_Global_Close";
				onButtonClick = "closeDialog 0;";
				x = 0.11995;
				y = 0.746262;
				w = 0.1;
				h = 0.1;
			};
	};
}; 