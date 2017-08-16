private["_crew","_plane","_camera","_musicplayer","_planestop"];
/*MineFactory Altis life*/

_plane = [getMarkerPos "spawnstartplane", 0, "O_Heli_Light_02_unarmed_F", _grops] call BIS_fnc_spawnVehicle;
player setpos getmarkerpos "spawnstartplane";
player action ["LightOn", _plane];
_plane3 = nearestObjects[getPos player,['O_Heli_Light_02_unarmed_F'],100] select 0;
_Loudtransmitter = nearestObjects [player, ["O_Heli_Light_02_unarmed_F"], 1000];      {player action ["LightOn", _x];} forEach _Loudtransmitter;  
_crew = createVehicleCrew (_plane select 0);
_crew action ["LightOn", _plane];
vehicle player allowDamage false;
_musicplayer = "UserTexture1m_F" createVehicleLocal getPos player;
_crew allowDamage false;
_plane3 allowDamage false;
player allowDamage false;
_plane3 setObjectTextureGlobal [0, "MINEFACTORY\textures\Med\orca_notarzt.paa"];
_plane3 lock 2;
clearWeaponCargoGlobal _plane3;
clearMagazineCargoGlobal _plane3;
clearItemCargoGlobal _plane3;
player action ["LightOn", _plane3];


player moveInCargo [_plane3, 3]; 
vehicle player allowDamage false;
player action ["getOut", vehicle player];
player setpos getmarkerpos "planecrashspawn";
_plane3 domove getmarkerpos "planecrashspawn";
vehicle player domove getmarkerpos "planecrashspawn";
_crew domove getmarkerpos "planecrashspawn";

showCinemaBorder true;
_musicplayer setpos [10513.77,6806.44,1.22];
_camera = "camera" camcreate [10513.77,6806.44,1.22];
_camera cameraeffect ["internal", "back"];
_camera camPrepareTarget [-47922.28,-72543.88,17077.37];
_camera camPreparePos [10513.77,6806.44,1.22];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

sleep 5;
_crew flyinheight 30;

sleep 4;
_crew flyinheight 10;
player setpos getmarkerpos "planecrashspawn_1";

sleep 8;
_musicplayer setpos [10098.48,5928.95,3.48];
_camera camPrepareTarget [32077.99,103475.30,-1263.86];
_camera camPreparePos [10098.48,5928.95,3.48];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_crew flyinheight 10;

sleep 13;
player setdir 15;
_crew flyinheight 6;
_camera camPrepareTarget [43165.39,95350.74,30220.49];
_musicplayer setpos [10089.51,5946.71,0.22];
_camera camPreparePos [10089.51,5946.71,0.22];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

sleep 10;
cutText ["","BLACK OUT"];

sleep 3;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
_musicplayer attachTo [_plane3, [0, 0, 2.5] ];
player moveInCargo [_plane3, 3]; 

sleep 3;
cutText ["","BLACK IN"];
_text2 = parseText format ["<t><t size='1.35'>Sie sind Gerettet<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Sie sind einer der wenigen der die Flucht nach Altis Überlebt hat, ich bringe sie in die Einwanderungsbehörde.<br/><br/></t>",name player];
_result2 = [_text2, false,"Weiter", false] call BIS_fnc_guiMessage;	
_plane3 domove getmarkerpos "planestopspawn";
vehicle player domove getmarkerpos "planestopspawn";
_crew domove getmarkerpos "planestopspawn";

sleep 20;
cutText ["","BLACK OUT"];

sleep 1;
_planestop = "UserTexture1m_F" createVehicle getMarkerPos "planestopspawn_1";
_plane3 attachTo [_planestop, [0, 0, 2.5] ];
player action ["getOut", vehicle player];
player setpos getmarkerpos "einwanderung1";
[] spawn life_fnc_Einwandern;

_plane3 setdamage 0;
deletevehicle _plane3;