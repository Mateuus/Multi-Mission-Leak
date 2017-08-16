private ["_me","_veh","_handle","_dummy","_hndl","_light","_camera","_Text","_hudStatus"];

_me = _this select 0;
_me allowDamage false;
if(isNil "_me" || _me != player) exitWith {};

diag_log "spawning Loewenherz Intro...";

_me setPos getMarkerPos "respawn_civilian"; // set player to debug zone

// invisible player global,but not local
[[vehicle player],"lhm_fnc_invisibleOn",false,false] call lhm_fnc_mp;
waitUntil {isObjectHidden _me;};
_me hideObject false;

waitUntil {preloadCamera [2562.5,12938.4,127]};
[] call lhm_fnc_huddelete;
0 cutText ["","BLACK IN"];
0 cutFadeOut 2;
enableRadio false;
closeDialog 0;

[] spawn {
_hndl = ppEffectCreate ["DynamicBlur", 900];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [[10]];
_hndl ppEffectCommit 0;

_hndl ppEffectAdjust [[0]];
_hndl ppEffectCommit 2.5;
sleep 5;
ppEffectDestroy _hndl;
};

playSound "firstSpawn_Track";

showChat false;
_hudStatus = shownHUD;
showHUD [false,false,false,false,false,false,false,false];
//waitUntil {shownHUD isEqualTo [false,false,false,false,false,false,false,false]};

lhm_firstSpawn = false;

_veh = "C_Rubberboat" createVehicleLocal [0,0,0];
clearMagazineCargo _veh;
clearWeaponCargo _veh;
clearItemCargo _veh;
_veh lock 2;
_veh lockCargo true;
_veh allowDamage false;
waitUntil {!isnil"_veh"};

_light = "#lightpoint" createVehicleLocal getPos _veh;
_light setLightBrightness 1;
_light setLightAmbient[0.7, 0.7, 0.7];
_light setLightColor[1.0, 1.0, 1.0];
_light lightAttachObject [_veh, [0,0,2]];

camUseNVG false;
showCinemaBorder false;
1 fadeSound 1;

_camera = "camera" camCreate [2562.5,12938.4,127];
_camera cameraEffect ["Internal","back"];
_camera camSetTarget [3443.61,12710.4,30];
_camera camCommit 0;

_camera setDir 30;

_camera camSetPos [2562.5,12938.4,15];
_camera camCommit 10;



[] spawn {
	sleep 1;

	_Text = format ["<t font='PuristaBold' size='1.10' color='#ff0000' align='center'>Willkommen<br /></t> <t font='PuristaBold' size='1.10' color='#FFFFFF' align='right'> auf Loewenherz-Projekt", name player];
	_dummy = [
	  _Text,
	  [safezoneX + safezoneW - 1.7,1],
	  [safezoneY + safezoneH - 1,0.7],
	  4
	 ] spawn BIS_fnc_dynamicText;
	 waitUntil{ScriptDone _dummy};

	_Text = format ["<t font='PuristaBold' size='1.10' color='#ff0000' align='left'>Dein exklusiver <br /></t> <t font='PuristaBold' size='1.10' color='#FFFFFF' align='right'> %1 Life Server",toUpper worldName];
	_dummy = [
	  _Text,
	  [safezoneX + safezoneW - 1.7,1],
	  [safezoneY + safezoneH - 1,0.7],
	  4
	 ] spawn BIS_fnc_dynamicText;
	 waitUntil{ScriptDone _dummy};
};

waitUntil {camCommitted _camera};
sleep 3;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;


0 cutText ["","BLACK OUT"];
0 cutFadeOut 3;

_veh setPos [2610.22,12932.8,0];
_veh setDir 100;

_me moveInDriver _veh;

waitUntil {assignedDriver _veh isEqualTo player};

vehicle player switchCamera "External";

0 cutText ["","BLACK IN"];
0 cutFadeOut 7;

_handle = [_veh,call lhm_fnc_ShipPath] spawn BIS_fnc_UnitPlay;

//diag_log format ["%1, %2, %3, %4", _veh,lhm_firstSpawn,_light,_camera];

[] spawn {
	private ["_dummy","_Text"];
	sleep 1.5;
	_dummy=
	[
		[
			["Reiseziel wird verifiziert... ","align = 'left' shadow = '1' size = '0.8' font='PuristaBold'","#ff0000"],
			["","<br/>"],
			["","<br/>"],
			["neuer Kurs eingegeben...","align = 'left' shadow = '1' size = '0.8' font='PuristaBold'","#ffffff"],
			["","<br/>"],
			[">> Ziel in Reichweite","align = 'left' shadow = '1' size = '0.8' font='PuristaBold'","#ffffff"]
		]
	] spawn BIS_fnc_typeText2;
	waitUntil {ScriptDone _dummy};
	sleep 3.5;


	_Text = format
	["
	<t font='PuristaBold' size='1.0' color='#ff0000' align='left'>Leitung<br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'>TREiBER, LEO<br/><br/></t>
	<t font='PuristaBold' size='1.0' color='#ff0000' align='center'>Entwicklung<br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='right'>Blackd0g, Barney, Bloodwyn, Teebaron<br/></t>
	"];
	_dummy = [
	  _Text,
   	  [safezoneX + safezoneW - 1.3,1.2],
  	  [safezoneY + safezoneH - 0.5,0.7],
	  5
	 ] spawn BIS_fnc_dynamicText;

	waitUntil {ScriptDone _dummy};
	sleep 3.5;

	_Text = format
	["
	<t font='PuristaBold' size='1.0' color='#ff0000' align='left'>Homepage<br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'>www.loewenherz-projekt.de<br/><br/></t>
	<t font='PuristaBold' size='1.0' color='#ff0000' align='center'>Teamspeak<br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='right'>ts.loewenherz-projekt.de:9988<br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='right'>Passwort: blah<br/></t>
	"];
	_dummy = [
	  _Text,
	  [safezoneX + safezoneW - 1.3,1],
	  [safezoneY + safezoneH - 1.6,0.7],
	  6
	 ] spawn BIS_fnc_dynamicText;

	waitUntil{ScriptDone _dummy};
	sleep 3.5;

	_Text = format ["<t font='PuristaBold' size='1.0' color='#ff0000' align='left'>Regeln und Informationen<br/></t> <t font='PuristaBold' size='1.0' color='#FFFFFF' align='right'>befinden sich auf der Karte - Taste (M)"];
	_dummy = [
	  _Text,
	  [safezoneX + safezoneW - 2.1,1],
	  [safezoneY + safezoneH - 1,0.7],
	  5
	 ] spawn BIS_fnc_dynamicText;

	waitUntil{ScriptDone _dummy};
	sleep 3.5;

	_Text = format
	["
	<t font='PuristaBold' size='1.0' color='#ff0000' align='left'>Die Regierung Loewenherz<br/><br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'>sucht immer fähiges Personal in den folgenden Bereichen :<br/></t>
	<t font='PuristaBold' size='0.8' color='#0000ff' align='left'>Polizei</t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'> - </t>
	<t font='PuristaBold' size='0.8' color='#009933' align='left'>Sanitätsdienst</t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'> - </t>
	<t font='PuristaBold' size='0.8' color='#ff0000' align='left'>Security-Agency<br/><br/></t>
	<t font='PuristaBold' size='0.9' color='#FFFFFF' align='center'>Bewird dich noch heute,</t>
	<t font='PuristaBold' size='0.9' color='#ff0000' align='center'>%1 !</t>
	",name player];
	_dummy = [
	  _Text,
      [safezoneX + safezoneW - 2.3,1.2],
     [safezoneY + safezoneH - 1,0.7],
	  7
	 ] spawn BIS_fnc_dynamicText;

	waitUntil {ScriptDone _dummy};
	sleep 3.5;

	_Text = format
	["
	<t font='PuristaBold' size='1.0' color='#ff0000' align='left'>Das Team von Loewenherz<br/><br/></t>
	<t font='PuristaBold' size='0.8' color='#FFFFFF' align='left'>sagt danke und wünscht dir nun viel Spass auf<br/></t>
	<t font='PuristaBold' size='0.9' color='#FFFFFF' align='left'>Loewenherz</t>
	<t font='PuristaBold' size='0.9' color='#ff0000' align='left'> Life<br/><br/></t>
	<t font='PuristaBold' size='0.9' color='#ff0000' align='left'>Für eine Weiterempfehlung würden wir uns freuen</t>
	"];
	_dummy = [
	  _Text,
      [safezoneX + safezoneW - 1.6,1.2],
     [safezoneY + safezoneH - 1.4,0.7],
	  7
	 ] spawn BIS_fnc_dynamicText;

};

waitUntil {ScriptDone _handle};

3 cutRsc ["SplashNoise","BLACK"];

moveOut _me;
_me setPosATL getMarkerPos "firstSpawn";
3 cutFadeOut 3;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [100];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 4;

_me allowDamage true;

deleteVehicle _veh;
[[vehicle player],"lhm_fnc_invisibleOff",false,false] call lhm_fnc_mp;

_Text = format ["<t font='PuristaBold' size='1.10' color='#ff0000' align='left'>Willkommen auf</t> <t font='PuristaBold' size='1.10' color='#FFFFFF' align='left'> %1",toUpper worldName];
_dummy = [
  _Text,
  [safezoneX + safezoneW - 1.7,1],
  [safezoneY + safezoneH - 1,0.7],
  4
 ] spawn BIS_fnc_dynamicText;

showHUD _hudStatus;
showChat true;
enableRadio true;

1 fadeSound 1;

[] spawn {
	private ["_vehicle","_pos","_uid"];
	spawningCam = true;
	[] call lhm_fnc_hudSetup;

	waitUntil {spawningCam};
	spawningCam = false;

	if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) then {
		diag_log "::lhm Client:: reinitializing Survival Functions...";
		[] execVM "core\init_survival.sqf";
	};

	sleep (random 3);

	_pos = [3114.12,12486.4,0] findEmptyPosition [0,25];
	_uid = getPlayerUID player;
	_vehicle = createVehicle ["C_Quadbike_01_F", _pos, [], 0, "CAN_COLLIDE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal _pos);
	_vehicle allowDamage false;

	_vehicle setposATL _pos;

	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;

	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[_uid,name player]],true];

	[_vehicle] call lhm_fnc_addVehicle2Chain;
	_vehicle allowDamage true;

	_arrow = "Sign_Arrow_F" createVehicleLocal getPos _vehicle;
	_arrow setPos [getPos _vehicle select 0, getPos _vehicle select 1, 3];

	sleep 1;

	hint parseText format ["<t size='1.05' font='puristaLight' align='center' color='#ff0000'>- INFORMATION -</t><br/><br/><t size='1.05' font='puristaLight' align='left' color='#ffcc00'>Als Willkommensgeschenk stellt dir die Regierung ein Quad am Ausgang zur Verfügung. Dieses Quad ist nur eine Leihgabe (Nicht in der Garage verfügbar!).Taste U zum aufschließen. Viel Spaß!</t><br/><br/><br/><t size='0.90' font='puristaLight' align='left'>- Team Loewenherz -</t><br/>"];

	[_vehicle,_arrow] spawn {
		waitUntil {(driver (_this select 0)) == vehicle player};
		deleteVehicle (_this select 1);
	};

	sleep 10;

	["Beginner_01",(getMarkerPos "safezone_kavala"),"Assigned","Besuche den Kavala Marktplatz","Besuche den Marktplatz","Besuche den Markt","assignedMission"] call lhm_fnc_getMissionTask;

	waitUntil {sleep 1;player distance (getMarkerPos "safezone_kavala") < 20};
	["Beginner_01","Succeeded","","Marktplatz besucht","succeededMission"] call lhm_fnc_setMissionTask;
};