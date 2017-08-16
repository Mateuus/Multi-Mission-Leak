/* 
 File: fn_setUniformTexture.sqf 
 
 Description: 
 set a custom texture on a specific uniform / backup 
 
 Author: Blackd0g 
 
 Parameters: _this select 0 = Object "Object" 
    _this select 1 = Uniform player "String" 
 
 Returns: 
 String of Texture Path 
 */ 
private["_path","_pathBackpack","_unit","_type"]; 
_unit = param [0,ObjNull,[ObjNull]]; 
_type = param [1,"",[""]]; 
_path = ""; 
 
// Check Parameters... 
if(_unit isEqualTo ObjNull) exitWith {}; 
if(_type isEqualTo "") then {_type = (uniform _unit)}; 
if(_type isEqualTo "") exitWith {}; 
 
////////// Cops ////////// 
if(playerSide isEqualTo west) then { 
 switch(_type) do { 
 
  case "U_Competitor" : { //Police Cadet 
   _path = "core\textures\uniforms\recruit_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_Rangemaster" : { //Police Officer 
   _path = "core\textures\uniforms\officer_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_SpecopsUniform_sgg" : { //Police Corporal 
   _path = "core\textures\uniforms\corporal_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_CombatUniform_mcam_vest" : { //Police Sergeant 
   _path = "core\textures\uniforms\sergeant_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_CTRG_1" : { //Police Lieutenant 
   _path = "core\textures\uniforms\lieutenant_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_CombatUniform_mcam" : { 
 
   if ((call lhm_coplevel) isEqualTo 6) then 
   { 
    _path = "core\textures\uniforms\first_lieutenant_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 7) then 
   { 
    _path = "core\textures\uniforms\captain_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 8) then 
   { 
    _path = "core\textures\uniforms\colonel_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 9) then 
   { 
    _path = "core\textures\uniforms\deputy_chief_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 10) then 
   { 
    _path = "core\textures\uniforms\chief_uniform.paa"; 
   }; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_CTRG_3" : { // Police Chief 
   _path = "core\textures\uniforms\chief_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_HeliPilotCoveralls" : { // Police Pilot 
   _path = "core\textures\uniforms\police_pilot.jpg"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_CombatUniform_mcam_worn" : { // SWAT 
   _path = "core\textures\uniforms\police_swat.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_B_survival_uniform" : { //coastguard 
   if ((call lhm_coplevel) isEqualTo 3) then // Rang 3 
   { 
    _path = "core\textures\uniforms\corporal_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 4) then // Rang 4 
   { 
    _path = "core\textures\uniforms\sergeant_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 5) then // Rang 5 
   { 
    _path = "core\textures\uniforms\lieutenant_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 6) then // Rang 6 
   { 
    _path = "core\textures\uniforms\first_lieutenant_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 7) then //  Rang 7 
   { 
    _path = "core\textures\uniforms\captain_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 8) then // Rang 8 
   { 
    _path = "core\textures\uniforms\colonel_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 9) then // Rang 9 
   { 
    _path = "core\textures\uniforms\deputy_chief_uniform.paa"; 
   }; 
   if ((call lhm_coplevel) isEqualTo 10) then // Rang 10 
   { 
    _path = "core\textures\uniforms\chief_uniform.paa"; 
   }; 
    _unit setObjectTextureGlobal [0,_path]; 
  }; 
 }; 
 
 // Hide backpack 
 (unitBackpack _unit) setObjectTextureGlobal [0, ""]; 
}; 
 
////////// Medics ////////// 
if(playerSide isEqualTo independent) then { 
 ////////// Uniform ////////// 
 switch (_type) do { 
  case "U_Competitor": { 
   if((call lhm_medicLevel) isEqualTo 1) then { 
    _path = "core\textures\uniforms\med_uniform_1.paa"; 
   }; 
   if((call lhm_medicLevel) isEqualTo 2) then { 
    _path = "core\textures\uniforms\med_uniform_2.paa"; 
   }; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
  case "U_I_CombatUniform": { 
   if((call lhm_medicLevel) isEqualTo 3) then { 
    _path = "core\textures\uniforms\med_uniform_3.paa"; 
   }; 
   if((call lhm_medicLevel) isEqualTo 4) then { 
    _path = "core\textures\uniforms\med_uniform_4.paa"; 
   }; 
   if((call lhm_medicLevel) isEqualTo 5) then { 
    _path = "core\textures\uniforms\med_uniform_5.paa"; 
   }; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 }; 
 
 ////////// Rucksack ////////// 
 switch (backpack _unit) do { 
  case "B_AssaultPack_khk": {  //EMS Level 1 
   if((call lhm_medicLevel) isEqualTo 1) then { 
    _path = "core\textures\uniforms\med_backpack_1.paa"; 
    (unitBackpack _unit) setObjectTextureGlobal [0, _path]; 
   }; 
  }; 
 
  case "B_Kitbag_cbr": {    //EMS Level 2-3 
   if((call lhm_medicLevel) > 1 && (call lhm_medicLevel) < 4) then { 
    _path = "core\textures\uniforms\med_backpack_2.paa"; 
    (unitBackpack _unit) setObjectTextureGlobal [0, _path]; 
   }; 
  }; 
 
  case "B_Carryall_oucamo": {  //EMS Level 4-5     5 keine textur 
   if((call lhm_medicLevel) isEqualTo 4) then { 
    _path = "core\textures\uniforms\med_backpack_3.paa"; 
   }; 
   if((call lhm_medicLevel) isEqualTo 5) then { 
    _path = ""; 
   }; 
   (unitBackpack _unit) setObjectTextureGlobal [0, _path]; 
  }; 
 }; 
}; 
 
////////// Civilians ////////// 
if(playerSide isEqualTo civilian) then { 
 switch(_type) do { 
  case "U_B_HeliPilotCoveralls" : { // ADAC Clothing 
   _path = "core\textures\uniforms\adac_coverall.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 
  case "U_C_Scientist" : { // Jail Clothing 
   _path = "core\textures\uniforms\prisoner_clothing.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 }; 
}; 
 
//////// SECURITY //////// 
if(playerSide isEqualTo east) then { 
  switch(_type) do { 
  case "U_O_SpecopsUniform_ocamo" : { 
   _path = "core\textures\uniforms\sec_uniform.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
  case "U_O_OfficerUniform_ocamo" : { 
   _path = "core\textures\uniforms\sec_uniform_suit.paa"; 
   _unit setObjectTextureGlobal [0,_path]; 
  }; 
 }; 
 
 // Hide backpack 
 (unitBackpack _unit) setObjectTextureGlobal [0, ""]; 
}; 
 
/* 
// check if texture is set.. if not restart the script! **** TEST **** 
if(([(getObjectTextures player) select 0,26] call BIS_fnc_trimString != _path) OR ([(getObjectTextures (unitBackpack player)) select 0,26] call BIS_fnc_trimString != _path)) then { 
 [player, uniform player] call lhm_fnc_setUniformTexture; 
}; 
*/ 
_path 
