/*
    ArmA.Network
    Author: OptiX && Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

disableSerialization;

private _position = getArray (missionConfigFile >> "CfgSpawnMenu" >> worldName >> "spawnPoint");
private _anims = getArray (missionConfigFile >> "CfgSpawnMenu" >> "animations");

ANMeme = "C_man_1" createVehicleLocal [_position select 0,_position select 1,_position select 2];
ANMeme allowDamage false;
ANMeme setDir (_position select 3);
ANMeme setPos [_position select 0,_position select 1,_position select 2];
ANMeme setFace (face player);

ANMeme switchMove (selectRandom _anims);
ANMeme addEventHandler ["AnimDone", {
    params [
        ["_unit", objNull, [objNull]]
    ];

    private _anims = getArray (missionConfigFile >> "CfgSpawnMenu" >> "animations");
    _unit switchMove (selectRandom _anims);
}];

if !(isNil "life_gear") then 
{
    removeUniform ANMeme;
    removeVest ANMeme;
    removeBackpack ANMeme;
    removeGoggles ANMeme;
    removeHeadGear ANMeme;

    if(hmd ANMeme != "") then {
      	ANMeme unlinkItem (hmd ANMeme);
    };

    ANMeme setUnitLoadout (life_gear select 0);
};

[] spawn life_fnc_teqedretrated;
enableRadio false;
enableSentences false;
player disableConversation true;
player setVariable ["tf_sendingDistanceMultiplicator", 10];
/*
if(TeamspeakThread isEqualTo -1) then {
	TeamspeakThread = [3,life_fnc_kleswlepriuhia,[],true] call life_fnc_phefakefe;
};
*/
hintSilent "";

if (currentWeapon ANMeme isEqualTo "") then 
{
	  ANMeme action ["SwitchWeapon", ANMeme, ANMeme, 100];
};

INTRO_CAM = "camera" camCreate (getPos ANMeme);
showCinemaBorder false;
INTRO_CAM cameraEffect ["Internal","Back"];
INTRO_CAM camSetTarget (ANMeme modelToWorld [1.5,0,1]);
INTRO_CAM camSetPos (ANMeme modelToWorld [0,4,1]);
INTRO_CAM camSetFOV .65;
INTRO_CAM camSetFocus [50, 0];
INTRO_CAM camCommit 0;
uisleep 0.1;
showCinemaBorder false;

if !(daytime > 8 && {daytime < 17}) then 
{
    _chemlight = "chemlight_green" createVehicleLocal (ANMeme modelToWorld [0,4,1]);
    _chemlight setPos (ANMeme modelToWorld [0,4,1]);
};

[] spawn 
{
  private _idc = [2000, 2001, 2500, 2100, 3400, 3401];
  /*
  private _arrayItems = profileNamespace getVariable "iyytfasdfgaf";
  if (isNil "_arrayItems") then 
  {
    profileNamespace setVariable ["iyytfasdfgaf",["","",""]];
    saveProfileNamespace;
  };
  if (isNil "PlayerUniform") then {PlayerUniform = [];};
  if (isNil "customization_type") then {customization_type = -1;};
  */
  uisleep 5;
  disableSerialization;
  createDialog "spawnMenu";
  {
    _control = (findDisplay 700) displayCtrl _x;
    _control ctrlShow false;
  } forEach _idc;

  if (isNil "life_newPlayer") then {life_newPlayer = false;};
  (findDisplay 700) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];
  ((findDisplay 700) displayCtrl 2401) ctrlEnable false;
  ((findDisplay 700) displayCtrl 2400) ctrlEnable false;
};
