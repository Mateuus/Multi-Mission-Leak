/*
	fn_equipGear.sqf
	
	Description:
	Initializes custom gear textures
*/
private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

if(playerSide == west) then {
	switch(_type) do {
		case "U_B_CombatUniform_mcam" : {
			_path = "textures\Person_Skins_Cop\chief.paa";
			_unit setObjectTextureGlobal [0,_path];
		};	
	};
};
if(playerSide == west) then {
	switch(_type) do {
		case "U_Marshal" : {
			_path = "textures\Zoll.paa";
			_unit setObjectTextureGlobal [0,_path];
		};	
	};
};
if(playerSide == independent) then {
	switch(_type) do {
		case "U_C_WorkerCoveralls" : {
			_path = "textures\medic_uniform.paa";
			_unit setObjectTextureGlobal [0,_path];
		};	
	};
};
if ((license_civ_dm) && playerSide == civilian) then {
	switch(_type) do {
		case "U_B_CombatUniform_mcam_vest" : {
			_path = "textures\Fahrzeug_Skins\dm\dmanzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
};
if ((license_civ_x) && playerSide == civilian) then {
	switch(_type) do {
		case "U_O_CombatUniform_ocamo" : {
			_path = "textures\Fahrzeug_Skins\X\anzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
};
if ((license_civ_presse) && playerSide == civilian) then {
	switch(_type) do {
		case "U_Marshal" : {
			_path = "textures\Priester.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
};