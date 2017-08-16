/*
		Ursprünglich nach : http://www.altisliferpg.com/topic/3276-uniform-for-medic-cop%C2%B4s-313/
		das nach Blacklagoon gemacht wurde  WAS CRAP WAR !
		Danke an Audacious....
	   
		Moded und editiert von Rage aka Ragebone aka Norman
		Mit Pierre aka G00golplexian
		für YouttuberRPG UND Secrets of Altis ©
*/

_uniform = uniform player;
_backpack = Backpack player;
_copLevel = call life_copLevel;
_ahwLevel = call life_ahwLevel;
_adminLevel = call life_adminLevel;

if (_uniform == "U_Rangemaster" && playerside == civilian && _adminlevel == 0) then {player setObjectTextureGlobal [0,"images\uniforms\neuling_co.paa"]};
if (_uniform == "U_Marshal" && playerside == civilian) then {player setObjectTextureGlobal [0,"images\uniforms\bayermann.paa"]};
if (_uniform == "U_Rangemaster" && playerside == civilian && _adminlevel > 0) then {player setObjectTextureGlobal [0,"images\uniforms\admin_co.paa"]};
if (_uniform == "U_C_Poloshirt_burgundy" && playerside == civilian) then {player setObjectTextureGlobal [0,"images\uniforms\shirt_fett_co.paa"]};
if (_uniform == "U_C_Poloshirt_redwhite" && playerside == civilian) then {player setObjectTextureGlobal [0,"images\uniforms\detrikot_altis_co.paa"]};
if (_uniform == "U_C_WorkerCoveralls" && life_is_arrested) then {player setObjectTextureGlobal [0,"images\uniforms\gefangener_uniform_co.paa"]};
if (_uniform == "U_C_Scientist") then {player setObjectTextureGlobal [0,"images\uniforms\abcschutzanzug_co.paa"]};
if (_uniform == "U_O_OfficerUniform_ocamo" && playerside == civilian && license_civ_president) then {player setObjectTextureGlobal [0,"images\uniforms\uniform_president.paa"]};
if (_uniform == "U_OG_Guerrilla_6_1" && playerside == civilian) then {player setObjectTextureGlobal [0,"images\uniforms\wpullover_co.paa"]};
if (_uniform == "U_B_CombatUniform_mcam_worn" && playerside == civilian && license_civ_imf) then {player setObjectTextureGlobal [0,"images\uniforms\clan\187_uniform.paa"]};
if (_uniform == "U_C_Scientist" && playerside == civilian && license_civ_slg) then {player setObjectTextureGlobal [0,"images\uniforms\clan\SLG_uniform.paa"]};	

switch(playerSide) do{
		case west:{
				switch (_uniform)do{   
						case "U_Rangemaster":{
								switch (_copLevel)do{
										default {player setObjectTextureGlobal [0,"images\uniforms\uniform_wachtmeister.paa"]};
								};
						};
						case "U_B_CombatUniform_mcam":{                                                
								switch (_copLevel)do{
										default {player setObjectTextureGlobal [0,"images\uniforms\ober_kommissar_co.paa"]};
								};
						};
						case "U_B_CombatUniform_mcam_worn":{
								switch (_copLevel)do{
										default {player setObjectTextureGlobal [0,"images\colors\dark_grey.paa"]};
								};     
						};					
				};
				switch(_backpack)do{
						case "B_Carryall_khk":{
								switch(_copLevel)do{
										default {(unitBackpack player) setObjectTextureGlobal [0,""];};
								};
						};
				};             
		};
		case independent:{
				switch(_uniform)do{
						case "U_Rangemaster":{
								switch(_ahwLevel)do{
										default{player setObjectTextureGlobal [0,"images\uniforms\ahw_uniform_A.paa"]};
								};     
						};     
				};
				switch(_backpack)do{
						case "B_Carryall_cbr":{
							switch(_ahwLevel)do{
										default{(unitBackpack player) setObjectTextureGlobal [0,""];};
								};
						};
				};
		};	
};