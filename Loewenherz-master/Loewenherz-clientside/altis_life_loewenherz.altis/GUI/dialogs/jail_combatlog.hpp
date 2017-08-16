class jail_combatlog {
	idd = 2705;
	name= "jail_combatlog";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_keyMenu;";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.094697;
			y = 0.73569;
			w = 0.1;
			h = 0.1;
		};
	};
	
	class controls {

		
		class Gefangene : lhm_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.040;
			
			x = 0.206023;
			y = 0.176514;
			w = 0.5625;
			h = 0.66;
		};
		
		class Rausholen : lhm_RscButtonMenu {
			idc = 2703;
			text = "Befreien";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "disableSerialization; Private[""_display"",""_listbox"",""_wer""];_display = findDisplay 2705; _Listbox = _display displayCtrl 2701; If(lbCurSel _Listbox == -1) exitWIth {}; _wer = objectfromNetid (_Listbox lbData (LbCursel _Listbox)); [{  LHM_jailcombatlog = false; _blah = CombatlogJail getVariable [""Gefangene"",[]]; _blah = _blah - [getPlayerUID player]; CombatlogJail setVariable [""Gefangene"",_blah,true]; lhm_is_arrested = 0;[5] call SOCK_fnc_updatePartial; },""BIS_fnc_spawn"", [_wer], false] call LHM_fnc_MP;";
			x = 0.777273;
			y = 0.179596;
			w = 0.171338;
			h = 0.053468;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu";
			x = 0.0934343;
			y = 0.737374;
			w = 0.1;
			h = 0.1;
		};
		
		
	};
};