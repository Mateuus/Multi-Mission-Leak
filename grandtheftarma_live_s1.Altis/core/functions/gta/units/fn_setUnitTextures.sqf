/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!hasInterface) exitWith {};

private ["_unit", "_uniform", "_uniformContainer", "_data", "_hndl"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_uniform = [_this, 1, uniform _unit, [""]] call GTA_fnc_param;
_uniformContainer = [_this, 2, objNull, [objNull]] call GTA_fnc_param;

//--- Error checks
if (isNull _unit) exitWith {};

//--- Terminate any previous fn_setUnitTextures handle
terminate (_unit getVariable ["GTA_fnc_setUnitTextures_hndl", scriptNull]);

//--- Get textures and materials
_data = switch (side group _unit) do {
	case west: {
		if ([_unit] call GTA_fnc_isCop) exitWith {
			//--- Hide backpacks for police
			if !(backpack _unit in ["B_UAV_01_backpack_F"]) then {
				backpackContainer _unit setObjectTextureGlobal [0, ""];
			};

			switch _uniform do {
				//--- Hi-Vis uniform
				case "U_O_OfficerUniform_ocamo": {
					switch (_unit getVariable ["cop_rank", -1]) do {
            case 3;
            case 4;
            case 5;
            case 6;
            case 7;
            case 8;
            case 9;
            case 10;
            case 11;
						case 12: {[["textures\police\uniforms\police_uniform_hivis.paa"], ["\a3\characters_f_beta\indep\data\officer.rvmat"]]};
						default {[["textures\police\uniforms\police_uniform_pcso.paa"], ["\a3\characters_f_beta\indep\data\officer.rvmat"]]};
					};
				};

        //--- Police Uniform
				case "U_B_CombatUniform_mcam": {"textures\police\uniforms\police_uniform.paa"};

				//--- SRU
				case "U_I_CombatUniform": {"textures\police\uniforms\police_uniform_sru.paa"};

				//--- Helicopter Pilot
				case "U_I_HeliPilotCoveralls": {"#(rgb,8,8,3)color(0.216,0.278,0.31,0.2)"};
			};
		};

		if ([_unit] call GTA_fnc_isMilitary) exitWith {
			//--- Insignia
			if (_uniform != "U_O_OfficerUniform_ocamo") then {
				[_unit, "TFAegis"] call BIS_fnc_setUnitInsignia;
			};

			//--- Assault Pack UK
			if (backpack _unit == "B_AssaultPack_Kerry") then {
				backpackContainer _unit setObjectTextureGlobal [1, "textures\military\uniforms\gta_military_assaultpack_uk.paa"];
			};

			//--- Remove Designator Bag
			if (backpack _unit == "B_Static_Designator_01_weapon_F") then {
				backpackContainer _unit setObjectTextureGlobal [0, "a3\weapons_f\ammoboxes\bags\data\backpack_compact_rgr_co.paa"];
			};

			switch _uniform do {
				//--- British MTP
				case "U_I_CombatUniform";
				case "U_I_CombatUniform_tshirt";
				case "U_I_GhillieSuit": {"textures\military\uniforms\gta_military_uniform_mtp.paa"};
			};
		};
	};

	case independent: {
		if ([_unit] call GTA_fnc_isMedic) then {

			//--- Medic Carryall backpack
			if (backpack _unit == "B_Carryall_khk" && {_unit getVariable ["med_rank", -1] >= 2}) then {

				backpackContainer _unit setObjectTextureGlobal [0, "textures\paramedic\backpacks\GTA_Paramedic_Backpack.paa"];

			} else {

				backpackContainer _unit setObjectTextureGlobal [0, ""];

			};

			//--- Paramedic
			if (_uniform in ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"]) then {
				switch (_unit getVariable ["med_rank", -1]) do {
					case 2: {"textures\paramedic\uniforms\GTA_Paramedic_Uniform.paa"};
					case 3: {"textures\paramedic\uniforms\GTA_Paramedic_Uniform.paa"};
					case 4: {"textures\paramedic\uniforms\GTA_Paramedic_Uniform.paa"};
					case 5: {"textures\paramedic\uniforms\GTA_Paramedic_Uniform.paa"};
					case 6: {"textures\paramedic\uniforms\GTA_Paramedic_Uniform.paa"};
					default {"textures\paramedic\uniforms\GTA_Paramedic_Uniform_Trainee.paa"};
				};
			};
		} else {
			//--- Hide backpacks HATO
			backpackContainer _unit setObjectTextureGlobal [0, ""];

			//--- HATO
			if (_uniform in ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"]) then {
				switch (_unit getVariable ["hato_rank", -1]) do {
					case 2: {"textures\hato\uniforms\GTA_HATO_Uniform_TM2.paa"};
					case 3: {"textures\hato\uniforms\GTA_HATO_Uniform_TM3.paa"};
					case 4: {"textures\hato\uniforms\GTA_HATO_Uniform_TM4.paa"};
					case 5: {"textures\hato\uniforms\GTA_HATO_Uniform_TM5.paa"};
					default {"textures\hato\uniforms\GTA_HATO_Uniform_TM1.paa"};
				};
			};
		};
	};

	case civilian: {
		switch _uniform do {
			case "U_C_Scientist": {"textures\civilian\uniforms\inmate.paa"};
			case "U_B_Wetsuit": {"textures\civilian\uniforms\batman.paa"};
			case "U_C_Commoner1_1": {"textures\civilian\uniforms\1v1jail.paa"};
			case "U_C_Commoner1_2": {"textures\civilian\uniforms\hoboblack.paa"};
			case "U_C_Commoner1_3": {"textures\civilian\uniforms\hoboblue.paa"};
			case "U_C_Commoner_shorts": {"textures\civilian\uniforms\hobogreen.paa"};
			case "U_C_Poloshirt_blue": {"textures\civilian\uniforms\hobomaroon.paa"};
			case "U_C_Poloshirt_burgundy": {"textures\civilian\uniforms\hoboYellowClaw.paa"};
			case "U_C_Poloshirt_redwhite": {"textures\civilian\uniforms\pat.paa"};
			case "U_C_Poloshirt_salmon": {"textures\civilian\uniforms\phil.paa"};
			case "U_C_Poloshirt_stripped": {"textures\civilian\uniforms\manners.paa"};
			case "U_C_Poloshirt_tricolour": {"textures\civilian\uniforms\britannia.paa"};
			case "U_C_ShirtSurfer_shorts": {"textures\civilian\uniforms\squirtle.paa"};
			case "U_C_TeeSurfer_shorts_1": {"textures\civilian\uniforms\dna.paa"};
			case "U_C_TeeSurfer_shorts_2": {"textures\civilian\uniforms\monster.paa"};
			case "U_I_CombatUniform": {"textures\civilian\uniforms\marshall.paa"};
			case "U_Rangemaster": {"textures\civilian\uniforms\taxi.paa"};
		};
	};
};

//--- No textures or materials were defined
if (isNil "_data" || {typeName _data == typeName true}) exitWith {};

//--- fn_setUnitTextures thread
_hndl = [_unit, _uniform, _uniformContainer, _data] spawn {
	private ["_unit", "_uniform", "_uniformContainer", "_data", "_textures", "_materials"];
	_unit = _this select 0;
	_uniform = _this select 1;
	_uniformContainer = _this select 2;
	_data = _this select 3;

	//--- Wait for uniform container to match
	if (!isNull _uniformContainer) then {
		waitUntil {uiSleep 0.5; uniformContainer _unit == _uniformContainer || isNull _unit || isNull _uniformContainer};
	};

	//--- Exit if unit no longer exists
	if (isNull _unit) exitWith {};

	//--- Convert string to array
	if (typeName _data == typeName "") then {
		_data = [_data];
	};

	//--- Check if materials are defined
	if (count _data > 1 && {typeName (_data select 0) == typeName []}) then {
		_textures = _data select 0;
		_materials = _data select 1;
	} else {
		//--- Retrive textures from data
		_textures = _data;
	};

	//--- Set textures
	if (!isNil "_textures") then {
		{
			_unit setObjectTexture [_forEachIndex, _x];
		} forEach _textures;
	};

	//--- Set materials
	if (!isNil "_materials") then {
		{
			_unit setObjectMaterial [_forEachIndex, _x];
		} forEach _materials;
	};
};

//--- Store the fn_setUnitTextures handle
_unit setVariable ["GTA_fnc_setUnitTextures_hndl", _hndl];
