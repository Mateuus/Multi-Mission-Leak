/*
	file: fn_getInMan.sqf
	
	Author: RafiQuak for Play Germany
	http://play-germany.de

*/
private ["_vehicle"];
_vehicle = _this select 2;

if((playerSide isEqualTo independent) && {typeOf _vehicle isEqualTo "C_Offroad_01_F"} && {_vehicle getVariable ["life_veh_color",-1] isEqualTo 18}) then {
	PG_followMeOn = player addAction ["Schild aktivieren",{
															_tex = "UserTexture_1x2_F" createVehicle position player;
															_tex attachTo [vehicle player,[0,-2.9,0]];
															_tex setVectorDirAndUp [[0,1,0],[-1,0,0]];
															_tex setObjectTextureGlobal [0,"\textures\thw\followme.paa"];
															_tex1 = "UserTexture_1x2_F" createVehicle position player;
															_tex1 attachTo [vehicle player,[0,-2.9,0]];
															_tex1 setVectorDirAndUp [[0,-1,0],[1,0,0]];
															_tex1 setObjectTextureGlobal [0,"\textures\thw\followme_back.paa"];
															vehicle player setVariable ["sign", true, true];
															vehicle player setVariable ["tex", _tex, true];
															vehicle player setVariable ["tex1", _tex1, true];
															},"",0,false,false,"",'!(vehicle player getVariable ["sign",false])'];
	PG_followMeOff = player addAction ["Schild deaktivieren",{vehicle player setVariable ["sign", false, true]; deleteVehicle (vehicle player getVariable ["tex", objNull]); deleteVehicle (vehicle player getVariable ["tex1", objNull]);},"",0,false,false,"",'(vehicle player getVariable ["sign",false])'];
};

if(_vehicle isKindOf "AIR" && !PG_ATC) then {
	["PG_atcChannel",[player]] remoteExec ["PGSERV_fnc_radioChannelAdd",2];
};

_color = switch (typeOf _vehicle) do {
	case "C_Offroad_01_F": {[6,9]};
	case "C_SUV_01_F": {[18];};
	case "C_Hatchback_01_F": {[9]};
	case "C_Hatchback_01_sport_F": {[6]};
	default {[]};
};

if(_vehicle getVariable ["life_veh_color",-1] in _color) then {
	PG_taxameterAction = player addAction[
											"<t color='#f0ff00'>Taxameter anzeigen</t>",
											{
												PG_taxameterShown = true;
												player removeAction (_this select 2);
												PG_taxameterHideAction = player addAction [
																							"<t color='#f0ff00'>Taxameter ausblenden</t>",
																							{PG_taxameterShown = false; hintSilent ""; player removeAction (_this select 2); ["","",vehicle player] spawn PG_fnc_getInMan;}
																						  ];
												[] spawn {
													while {PG_taxameterShown} do {
														hintSilent parseText format ["<t size='1.5' align='center'>Taxameter</t><br/><t size='1.2' color='#ff0000'>%1€</t>", vehicle player getVariable["taxameter",0]];
														sleep 5;
													};
												};
											},
											"",
											0,
											false,
											false,
											"",
											'(vehicle player != player) && {!(isNil {(vehicle player getVariable "taxameter")})}'
										];
};