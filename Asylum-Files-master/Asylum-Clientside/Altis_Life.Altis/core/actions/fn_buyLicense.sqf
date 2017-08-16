/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_other","_msg"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;
//_price = _price - (((life_donator * 4) / 100) * _price);

if (life_wanted > 0 && _type == "bounty") exitWith { hint "You cannot acquire a bounty hunting license when you are wanted yourself! Turn yourself in, first." };

if(!([_price] call life_fnc_debitCard)) exitWith {};
titleText[format["You bought a %1 for $%2", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
PlaySound "purchase";
//[[3, player, format["Purchased license %1 for %2", _license select 1, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

missionNamespace setVariable[(_license select 0),true];

if (_type == "bounty") then
{
	_other = ["rebel",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Because you have purchased a bounty hunter license, you have forfeited your rebel license.";
		missionNamespace setVariable[_other select 0,false];
	};
	
	_msg = parseText format["You are a bounty hunter, %1!<br/><br/>As a <t color='#FF0000'>bounty hunter</t> you must adhere to certain rules or risk the removal of your license or possibly even being banned from the server.<br/><br/><t color='#FF0000'>It is very important</t> to understand that you are still a civilian, and must obey all rules other civilians do.  Shooting another player to stun them with rubber bullets is still considered RDM if you do not engage verbally first with a warning. Do not attack unprovoked, even to stun, and always give them a chance to comply before opening fire.<br/><br/>As a bounty hunter your job is to bring in criminals when <t color='#00FF00'>police forces are not present</t>.<br/><br/>", name player];
	"You are a bounty hunter" hintC _msg;
};
if (_type == "rebel") then
{
	_other = ["bounty",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Because you have purchased a rebel license, you have forfeited your bounty hunter license.";
		missionNamespace setVariable[_other select 0,false];
	};
};