_mode = _this select 0;


switch (_mode) do
{
	case 0:
	{

		_NamePlayer = player getVariable["realname",name player];
		_SteamIDPlayer = getPlayerUID player;

		((findDisplay 1234564) displayCtrl 1013) ctrlSetText format["%1", _NamePlayer];
		((findDisplay 1234564) displayCtrl 1014) ctrlSetText format["%1", _SteamIDPlayer];
		((findDisplay 1234564) displayCtrl 1016) ctrlSetText format["Cop LVL: %1", ES_xp_lvl];
		((findDisplay 1234564) displayCtrl 1017) ctrlSetText format["%1", Servername];

	};

	case 1:
	{

		// Cadet
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\cadet.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 2:
	{

		// Deputy
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\deputy.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 3:
	{

		// Officer
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\detective.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 4:
	{

		// Detective

		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\inspector.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 5:
	{

		// Inspector
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\commissioner.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 6:
	{

		// Commissioner
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\commissioner.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 7:
	{

		// Major
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\major.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\fbi_backpack.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 8:
	{

		// FBI
		player forceAddUniform "U_B_CombatUniform_mcam_vest";

		sleep 0.1;

		If(uniform player == "U_B_CombatUniform_mcam_vest") then {player setObjectTextureGlobal [0,"Images\Skins\cop\fbi_uniform.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\fbi_backpack.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 9:
	{
 
		// S.W.A.T. und N.C.I.S.
		If (license_cop_ncis) then {player forceAddUniform "U_B_CombatUniform_mcam";}else{player forceAddUniform "U_I_CombatUniform_shortsleeve";};

		sleep 0.1;

		If(uniform player == "U_I_CombatUniform_shortsleeve") then {player setObjectTextureGlobal [0,"Images\Skins\cop\swat.paa"]; if (Backpack  player == "B_Carryall_khk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\swat_backpack.paa"]; }; }else{};

		if(uniform player == "U_B_CombatUniform_mcam" && (license_cop_ncis)) then { player setObjectTextureGlobal [0,"Images\Skins\cop\ncis_uniform.paa"]; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 10:
	{

		// Marshal
		player forceAddUniform "U_B_CombatUniform_mcam";

		sleep 0.1;

		If(uniform player == "U_B_CombatUniform_mcam") then {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 11:
	{

		// Secretary
		player forceAddUniform "U_B_CombatUniform_mcam";

		sleep 0.1;

		If(uniform player == "U_B_CombatUniform_mcam") then {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];

	};

	case 12:
	{

		// Police Chief
		player forceAddUniform "U_B_CombatUniform_mcam";

		sleep 0.1;

		If(uniform player == "U_B_CombatUniform_mcam") then {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };

		player setVariable ["copSwitchSkin", true, true];
	
	};


	case 13:
	{

		// Orden
		player forceAddUniform "U_Rangemaster";

		sleep 0.1;

		If(uniform player == "U_Rangemaster") then {player setObjectTextureGlobal [0,"Images\Skins\cop\policeordenskin.paa"]; if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; }; }else{ hintSilent "Du hast nicht die richtige Uniform!"; };
		
		player setVariable ["copSwitchSkin", true, true];

	};

	case 14:
	{

		// Standart
		player setVariable ["copSwitchSkin", false, true];

	};

};