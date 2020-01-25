//event stuff


//dont use this
_koil = [8555,6659,0.0];  if(_koil distance (getpos player) < 20) then {   currentuniform = Uniform player;   body = player;   _pos = getpos player;   _grp = creategroup civilian;   "RyanZombieC_scientist_Fslow" createUnit [_pos, _grp,"girl = this", 0.5, "private"];     selectPlayer girl;   deletevehicle body;  };





//turn into a unit
currentuniform = Uniform player;
body = player;
_pos = getpos player;
_grp = creategroup civilian;

"RyanZombieSpider11" createUnit [_pos, _grp,"girl = this", 0.5, "private"];  
selectPlayer girl;
deletevehicle body;


//turn people around you to enemys
[] spawn {
mplayers = player nearEntities [["Man"], 15];
	{
		_x addrating -99999999999999;
	}foreach mplayers;
};


//teleport close players and npcs to you..
[] spawn {

	{
		_x allowdamage false;
		_x setPos (_x modelToWorld [8690,6678,0]);
		sleep .5;
		_x allowdamage true;
	}foreach mplayers;
};


free fall anims

"halofreefall_l"
"halofreefall_r"
"halofreefall_f"
"halofreefall_non_halofreefall_b"
"halofreefall_non"


FIREWORKS


flrObj = "F_40mm_Red" createvehicle ((player) ModelToWorld [0,10,200]);   flrObj setVelocity [0,0,-30];  

flrObj = "F_40mm_Yellow" createvehicle ((player) ModelToWorld [0,30,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_White" createvehicle ((player) ModelToWorld [0,50,200]);   flrObj setVelocity [0,0,-30]; 

flrObj = "F_40mm_Green" createvehicle ((player) ModelToWorld [0,70,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_Red" createvehicle ((player) ModelToWorld [0,90,200]);   flrObj setVelocity [0,0,-30];  

flrObj = "F_40mm_Yellow" createvehicle ((player) ModelToWorld [0,110,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_White" createvehicle ((player) ModelToWorld [0,130,200]);   flrObj setVelocity [0,0,-30]; 

flrObj = "F_40mm_Green" createvehicle ((player) ModelToWorld [0,150,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_Red" createvehicle ((player) ModelToWorld [0,170,200]);   flrObj setVelocity [0,0,-30];  

flrObj = "F_40mm_Yellow" createvehicle ((player) ModelToWorld [0,190,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_White" createvehicle ((player) ModelToWorld [0,210,200]);   flrObj setVelocity [0,0,-30]; 

flrObj = "F_40mm_Green" createvehicle ((player) ModelToWorld [0,230,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_Green" createvehicle ((player) ModelToWorld [0,250,200]);   flrObj setVelocity [0,0,-30];

flrObj = "F_40mm_Red" createvehicle ((player) ModelToWorld [0,270,200]);   flrObj setVelocity [0,0,-30];  

flrObj = "F_40mm_Yellow" createvehicle ((player) ModelToWorld [0,290,200]);   flrObj setVelocity [0,0,-30];

 flrObj = "F_40mm_White" createvehicle ((player) ModelToWorld [0,310,200]);   flrObj setVelocity [0,0,-30]; 

flrObj = "F_40mm_Green" createvehicle ((player) ModelToWorld [0,330,200]);   flrObj setVelocity [0,0,-30];







[] spawn { mplayers = nearestobjects [player,["car"], 15];     
{  _x allowdamage false;  _x setPos (_x modelToWorld [0,0,5]);  sleep 5.5;  _x allowdamage true;  }foreach mplayers; };



mplayers = player nearEntities [["Man"], 4135];

{  if((_x getVariable["dead",FALSE])) then { [profileName] remoteExec ["life_fnc_revived",_x];  }; }foreach mplayers;


{  _x setpos getpos player;  }foreach mplayers;    

cursortarget

player forceAddUniform "BH_Scout_comsuit_b";
player addVest "BH_Scout_armor";

player addBackpack "cg_invisbp";
player addHeadgear "BH_Scout_helmet";
player addWeapon "BH_SE14r";

for "_i" from 1 to 5 do {player addItemToBackpack "KPFS_30Rnd_556x45_G36";};


for "_i" from 1 to 5 do {player addItemToBackpack "KPFS_45Rnd_473x33_G11";};


cursortarget forceAddUniform "BH_Scout_comsuit_b";
cursortarget addVest "BH_Scout_armor";

cursortarget addBackpack "cg_invisbp";
cursortarget addHeadgear "BH_Scout_helmet";
cursortarget addWeapon "BH_SE14r";
for "_i" from 1 to 5 do {cursortarget addItemToVest "BH_SE14r_Mag";};
for "_i" from 1 to 5 do {cursortarget addItemToBackpack "BH_SE14r_Mag";};


{
	if(player getVariable [_x, 1] != 1) then
	{
		player setVariable [_x, 1, true];
	};
} foreach life_injuries;



[profileName] remoteExec ["life_fnc_revived",CURSORTARGET];

_num = floor(random 7);

_color = switch (_num) do {
	case 0: {"SmokeShell";};
	case 1: {"SmokeShellGreen";};
	case 2: {"SmokeShellRed";};
	case 3: {"SmokeShellBlue";};
	case 4: {"SmokeShellOrange";};
	case 5: {"SmokeShellOrange";};
	case 6: {"SmokeShellPurple";};
	case 7: {"SmokeShell";};
};
_smoke = _color createVehicle position cursortarget;
_smoke attachTo [vehicle cursortarget, [0,-0.1,-0.3]];































[] spawn {






private ["_snowSparse","_snowLight","_snowMedium","_snowHeavy","_snowStorm","_rSnow"];

while {true} do {

    _rSnow = [1,5] call BIS_fnc_randomInt;
    
    switch (_rSnow) do {
    
        case 1 : {
                _snowSparse = "#particleSource" createVehicleLocal (position player);  
                _snowSparse setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
                _snowSparse setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
                _snowSparse setParticleCircle [0,[0,0,0]];
                _snowSparse setDropInterval 0.1; 
                };
        case 2 : {
                _snowLight = "#particleSource" createVehicleLocal (position player);  
                _snowLight setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
                _snowLight setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
                _snowLight setParticleCircle [0,[0,0,0]];
                _snowLight setDropInterval 0.01; 
                };
        case 3 : {
                _snowMedium = "#particleSource" createVehicleLocal (position player);  
                _snowMedium setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
                _snowMedium setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
                _snowMedium setParticleCircle [0,[0,0,0]];
                _snowMedium setDropInterval 0.001; 
                };
        case 4 : {
                _snowHeavy = "#particleSource" createVehicleLocal (position player);  
                _snowHeavy setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
                _snowHeavy setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
                _snowHeavy setParticleCircle [0,[0,0,0]];
                _snowHeavy setDropInterval 0.0001; 
                };
        case 5 : {
                _snowStorm = "#particleSource" createVehicleLocal (position player);  
                _snowStorm setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
                _snowStorm setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
                _snowStorm setParticleCircle [0,[0,0,0]];
                _snowStorm setDropInterval 0.00001; 
                };        
    };

sleep 20 + (random 1800);

deleteVehicle _snowSparse;
deleteVehicle _snowLight;
deleteVehicle _snowMedium;
deleteVehicle _snowHeavy;
deleteVehicle _snowStorm;

    if (random 1 <= 0.05) then {
        sleep 1 + (random 1200);
    };
};  



};




































_smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [2.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [3,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [3.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [4,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};
 
_smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [4.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [5.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellBlue" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [6,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};
 
_smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-2,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-1.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-1,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-0.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};
 
_smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [0.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [1,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [1.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShell" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [2,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};
 
_smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-6,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-5.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-4.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};
 
_smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-4,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-3.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-3,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];}; _smoke = "SmokeShellRed" createVehicle position player;if (vehicle player != player) then { _smoke attachTo [vehicle player, [-2.5,-1,0]];} else { _smoke attachTo [player, [0,-0.1,1.5]];};