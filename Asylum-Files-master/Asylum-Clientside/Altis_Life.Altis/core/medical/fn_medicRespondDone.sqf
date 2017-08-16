/*
	File: fn_medicRespondDone.sqf
	Author: speed

	Description:
	Rewards the medic for reviving a player, or notifies them that they no longer require attention
*/

private["_caller","_responder","_travelBonus"];

_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_responder = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(_responder == _caller && _responder == player) exitWith {};
if(_responder != player && (isNull _caller || isNull life_medic_target || playerSide == civilian || (playerSide == west && !(life_copRole in ["medic","all"])))) exitWith {};

_travelBonus = round(((getPos player) distance (life_medic_startpos))*0.05);

if(!isNull life_medic_target && life_medic_target == _responder) then {
  ["atm","add", _travelBonus] call life_fnc_uC;
  hint format["%1 bled out and no longer requires medical attention. You have received $%2 for your troubles.", name _caller, _travelBonus];
  life_medic_target = objNull;
}
else {
  if(_responder != player) then {
    ["atm","add", _travelBonus] call life_fnc_uC;
    hint format["%1 was revived by %2 and no longer requires medical attention. You have received $%3 for your troubles.", name _caller, name _responder, _travelBonus];
    life_medic_target = objNull;
  } else {
    if(!isNull life_medic_target && life_medic_target == _caller) then
    {
      _travelBonus = round(((getPos player) distance (life_medic_startpos))*0.2);
      life_medic_target = objNull;
    } else {
      _travelBonus = 0;
    };
    ["atm","add", (life_revive_fee + _travelBonus)] call life_fnc_uC;
    titleText[format["You have revived %1 and received $%2 for your services.", name _caller, [(life_revive_fee + _travelBonus)] call life_fnc_numberText],"PLAIN"];
    life_experience = life_experience + 30;
  };
};
