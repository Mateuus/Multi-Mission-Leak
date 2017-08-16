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
if (player distance life_pInact_curTarget > 5) exitWith {hintSilent "Too far away to give the items"; closeDialog 0;};
if (lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select an Item";};
_vehicle = lbData [1500,(lbCurSel 1500)];
_vehicle = life_vehicles select parseNumber(_vehicle);
_uid = getPlayerUID life_pInact_curTarget;
_side = side life_pInact_curTarget;
_owners = (_vehicle getVariable ["vehicle_info_owners",[]]);
if(count _owners > 0) then {
  _index = [_uid,_owners] call life_fnc_uiudhfyqwtfkdsf;
  if!(_index isEqualTo -1) exitWith {hintSilent "Person already has the keys to this vehicle!"; closeDialog 0;};
  _owners pushBack [_uid,life_pInact_curTarget getVariable["realname",name life_pInact_curTarget],_side];
  _vehicle setVariable["vehicle_info_owners",_owners,true];
} else {
  _owners pushBack [_uid,life_pInact_curTarget getVariable["realname",name life_pInact_curTarget],_side];
  _vehicle setVariable["vehicle_info_owners",_owners,true];
};
closeDialog 0;
_message = format ["You have given your keys to %1",typeOf _vehicle];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
[_vehicle,life_pInact_curTarget,profileName] remoteExecCall ["life_fnc_travedustewre",life_pInact_curTarget];
