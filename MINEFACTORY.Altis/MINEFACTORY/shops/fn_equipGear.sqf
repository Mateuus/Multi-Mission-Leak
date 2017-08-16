/*
	fn_equipGear.sqf
	Author: Keine Ahnung.. Bohemia Wiki+SQF? o.O
	Edit: Nox, www.ragecore.de / www.native-gamer.net
*/
private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;


//COP KLEIDUNG
if(playerSide == west) then {
	switch(_type) do {
		case "U_Rangemaster" : {
			_path = "MINEFACTORY\textures\clothing\polizei_beamter.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_B_CombatUniform_mcam_tshirt" : {
			_path = "MINEFACTORY\textures\clothing\cop_officer.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_B_survival_uniform" : {
			_path = "MINEFACTORY\textures\clothing\sek.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_B_CombatUniform_mcam_worn" : {
			_path = "MINEFACTORY\textures\clothing\cop_sergeant.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_B_CombatUniform_mcam" : {
			_path = "MINEFACTORY\textures\clothing\sek.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_MillerBody" : {
			_path = "MINEFACTORY\textures\clothing\sek.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_O_OfficerUniform_ocamo" : {
			_path = "MINEFACTORY\textures\clothing\direktor.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	
	if((backpack player) == "B_Carryall_cbr")  then {
		//(unitBackpack _unit) setObjectTextureGlobal [0, "MINEFACTORY\textures\cop\cop_backpack.paa"];
		(unitBackpack player) setObjectTextureGlobal [0, ""]; //Macht Rucksäcke unsichtbar :)
	};
};

//MEDIC KLEIDUNG
if(playerSide == independent) then {
	switch(_type) do {
		case "U_I_HeliPilotCoveralls" : {
			_path = "MINEFACTORY\textures\clothing\medic_uniform.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	if((backpack player) == "B_Carryall_oli")  then {
		(unitBackpack player) setObjectTextureGlobal [0, ""]; //Macht Rucksäcke unsichtbar :)
	};
	if((backpack player) == "B_TacticalPack_oli") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, "MINEFACTORY\textures\clothing\medic_backpack.paa"];
	};
};

//ZIVILISTEN KLEIDUNG
if(playerSide == civilian) then {
	switch(_type) do {
		case "U_C_Poloshirt_burgundy" : {
			_path = "MINEFACTORY\textures\clothing\power.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_Poloshirt_blue" : {
			_path = "MINEFACTORY\textures\clothing\mob.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_Poloshirt_redwhite" : {
			_path = "MINEFACTORY\textures\clothing\head.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_Poloshirt_salmon" : {
			_path = "MINEFACTORY\textures\clothing\kiwi.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_Poloshirt_stripped" : {
			_path = "MINEFACTORY\textures\clothing\maori.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_Poloshirt_tricolour" : {
			_path = "MINEFACTORY\textures\clothing\allblacks.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_Competitor" : {
			_path = "MINEFACTORY\textures\clothing\rebel_mob.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "B_Soldier_base_F" : {
			_path = "MINEFACTORY\textures\clothing\mafiaboss_kleidung.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
};
/*
if(license_civ_gang_6) then
{
	switch(_type) do {
		case "U_B_CombatUniform_mcam" : {
			_path = "images\clothing\ask.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	if((backpack player) == "B_Bergen_blk") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, "images\clothing\askbag.paa"];
	};
};	
};
*/
