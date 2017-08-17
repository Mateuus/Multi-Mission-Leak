#include "..\..\script_macros.hpp"
/*
File:   fn_gatherAction.sqf
Author: noms
Description: Handles the gathering of items on the map (trees)
*/

private ["_resource", "_curObject", "_rewardAmount", "_rewardClass", "_rewardXP", "_rewardAmountArray", "_hoe", "_axe","_resourceName","_harvestItems","_resourceSeeds"];
if (life_action_inUse) exitWith { systemChat "Action in use";};
if ((vehicle player) != player) exitWith { hint "You cannot cut a tree down while in a vehicle!";};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
_nearTowns = nearestLocations[position player, ["NameVillage","NameCity","NameCityCapital"], 250];
if(count _nearTowns > 0) exitWith {hint "You cannot cut trees down within 250 meters of a town or village.";};

if (!(LIFE_SETTINGS(getNumber,"enable_lumbering") isEqualTo 1)) exitWith { systemChat "Lumbering is disabled.";};


life_action_inUse = true;

_curObject = param [0,ObjNull,[ObjNull]];
_axe = missionNamespace getVariable "life_inv_axe";
_type = "Axe";
_reqTool = 0;
_resourceClass = "";



if([str _curObject,"t_"] call KRON_StrInStr) then {
/*
EXAMPLE CHECK FOR fn_gatherAction.sqf
---------
if([str _curObject,"text_in_filename"] call KRON_StrInStr) then {           //Text between t_ and _f in the filename for the tree.
  _resourceClass = "Tree_type";                                             //The tree class you defined in Config_Lumbering.hpp
};
---------
*/
  if([str _curObject,"ficusb1s"] call KRON_StrInStr) then {
    _resourceClass = "t_ficusb1s_f";
  };
  if([str _curObject,"populusn3s"] call KRON_StrInStr) then {
    _resourceClass = "t_populusn3s_f";
  };
  if([str _curObject,"oleae2s"] call KRON_StrInStr) then {
    _resourceClass = "t_oleae2s_f";
  };
  if([str _curObject,"ficusb2s"] call KRON_StrInStr) then {
    _resourceClass = "t_ficusb2s_f";
  };
  if([str _curObject,"oleae1s"] call KRON_StrInStr) then {
    _resourceClass = "t_oleae1s_f";
  };
  if([str _curObject,"pinuss2s"] call KRON_StrInStr) then {
    _resourceClass = "t_pinuss2s_b_f";
  };
  if([str _curObject,"pinuss1s"] call KRON_StrInStr) then {
    _resourceClass = "t_pinuss1s_b_f";
  };
  if([str _curObject,"fraxinusav2s"] call KRON_StrInStr) then {
    _resourceClass = "t_fraxinusav2s_f";
  };
  if([str _curObject,"phoenixc3s"] call KRON_StrInStr) then {
    _resourceClass = "t_phoenixc3s_f";
  };
};


if(_resourceClass != "") then {
  //Let's get the required variables set up
  _xpReward = getNumber(missionConfigFile >> "CfgLumbering" >> "Trees" >> _resourceClass >> "xpReward");
  _rewardAmountArray = getArray(missionConfigFile >> "CfgLumbering" >> "Trees" >> _resourceClass >> "rewardAmountArray");
  _harvestItems = getArray(missionConfigFile >> "CfgLumbering" >> "Trees" >> _resourceClass >> "harvestItems");
  _resource = (_harvestItems select 0) select 0;
  _resourceName = getText(missionConfigFile >> "CfgLumbering" >> "Trees" >> _resourceClass >> "displayName");
  _rewardAmount = selectRandom _rewardAmountArray;
  _harvestTime = getNumber(missionConfigFile >> "CfgLumbering" >> "Trees" >> _resourceClass >> "farmWait");


  systemChat format["Tree Class: %1",_resourceClass];

  //Do they have the required tool?
  if(_axe < 1) exitWith  { systemChat format["You need a %1 to harvest %2.",_type,_resourceName]; life_action_inUse = false;};
  // Do they have room in their inventory?
  _diff = [_resource, _rewardAmount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
  if(_diff isEqualTo 0) exitWith { hint localize "STR_NOTF_InvFull"; life_action_inUse = false;};
  //Are they already in the process of harvesting something?
  if (life_action_harvesting) exitWith {life_action_inUse = false;};

  //Set up the correct sound effect to play.
  _soundFX = "AxeChop";

  life_action_harvesting = true;
  _step = 0;
  _exit = false;
  for "_i" from 0 to _harvestTime do {
    if(player distance2d _curObject > 8) exitWith { systemChat "You got too far away to complete harvesting."; life_action_harvesting = false; life_action_inUse = false; _exit = true; };
    player say3D _soundFX;
    _axe = "Land_Axe_F" createvehiclelocal [0,0,0]; 
    _axe attachTo [player, [0,0,0.1], "RightHand"]; 
    _axe setVectorDirAndUp [[0,-0.2,0.5],[-1,0,0]];
    for "_i" from 0 to 2 do
    {
      player playMove "AwopPercMstpSgthWnonDnon_throw";
      [player,"AxeChop"] remoteexeccall ["say3D",0];
      sleep 2.5;
    };
    //waitUntil{animationState player != "AwopPercMstpSgthWnonDnon_throw";};
    titleText [format["Gathering %1",_resourceName],"PLAIN DOWN",0.1];
    sleep 1;
    _step = _step + 1;
    detach _axe;
    deletevehicle _axe;
  };


  //Sanity check after the for action
  if(_exit) exitWith { life_action_inUse = false; life_action_harvesting = false; };

  //See if the _harvestTime has been met
  if((_step+1) >= _harvestTime) then {

    //Award items
    [true,_resource,_rewardAmount] call life_fnc_handleInv;
    // Inform player
    titleText [format["You gathered %1 %2",_rewardAmount, _resourceName],"PLAIN DOWN"];
    // Handle removing the object

    _curObject setDamage 1;
    uiSleep 1;
    life_action_inUse = false;
    life_action_harvesting = false;

  };

}
else
{
  systemChat "Can't chop this tree yet sorry";
};
life_action_inUse = false;
