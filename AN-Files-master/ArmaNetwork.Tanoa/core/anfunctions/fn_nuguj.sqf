/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(isNull life_pInact_curTarget OR {isNil "life_pInact_curTarget"} OR {!alive life_pInact_curTarget}) exitWith {closeDialog 0;};
if(player distance life_pInact_curTarget > 5) exitWith {hintSilent "Too far away to give the items"; closeDialog 0;};
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select an Item";};
_item = lbData [1500,(lbCurSel 1500)];
_amount = parseNumber(ctrlText 1400);
if(!([str(_amount)] call life_fnc_spunetuwada)) exitWith {closeDialog 0; hintSilent "You didn't enter an actual number format.";};
if(_amount <= 0 OR {_amount > 10}) exitWith {hintSilent "You cannot give more than 10 Items at once.";};
if(!([_item,_amount] call life_fnc_virtualItemRemove)) exitWith {hintSilent "Couldn't give that much of that item";};
closeDialog 0;
[life_pInact_curTarget,_amount,_item,player] remoteExecCall ["life_fnc_yaguthazest",life_pInact_curTarget];
_displayName = localize getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");
_message = format ["You've given %1 %2",[_amount] call life_fnc_rupadudejat,_displayName];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
