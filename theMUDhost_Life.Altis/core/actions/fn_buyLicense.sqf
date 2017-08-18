/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

life_cash = life_cash - _price;
missionNamespace setVariable[(_license select 0),true];

if(_type == "rebel") then
{
	cutText ["This license allows you to ILLEGALLY purchase high calibre firearms and other tools. This training will be lost on arrest.","PLAIN"];
	_other = ["c3",0] call life_fnc_licenseType;
	_others = ["bh",0] call life_fnc_licenseType;
	if(missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Because you have acquired Rebel Training, you have forfeited your Class 3 weapons license.";
		missionNamespace setVariable[_other select 0, false];
	};
	if(missionNamespace getVariable[_others select 0,false]) then
	{
		hint "Because you have acquired Rebel Training, you have forfeited your Bounty Hunter license.";
		player setVariable["bountyHunter",false,true];
		player setVariable["approved",false,true];
		missionNamespace setVariable[_others select 0,false];
	};
};

if(_type == "c3") then
{
	if(player getVariable["criminal",false]) exitWith
	{
		hint "I don't sell to criminals!";
		license_civ_c3 = false;
		life_cash = life_cash + _price;
	};
	cutText ["This license allows you to legally purchase and carry 5.56mm rifles only for your protection. This license will be lost on arrest, do not abuse it!","PLAIN"];
	_other = ["rebel",0] call life_fnc_licenseType;
	_others = ["bh",0] call life_fnc_licenseType;
	if(missionNamespace getVariable[_other select 0, false]) then
	{
		hint "Because you have purchased a Class 3 License, you have forfeited your rebel license.";
		missionNamespace setVariable[_other select 0,false];
	};
	if(missionNamespace getVariable[_others select 0, false]) then
	{
		hint "Because you have acquired a Class 3 Weapons license, you have forfeited your Bounty Hunter license.";
		player setVariable["bountyHunter",false,true];
		missionNamespace setVariable[_others select 0,false];
	};
};

if(_type == "bh") then
{
	if(player getVariable["criminal",false]) exitWith
	{
		hint "I don't sell to criminals!";
		license_civ_bh = false;
		life_cash = life_cash + _price;
	};
	
	if(!(player getVariable["approved",false])) exitWith
	{
		hint "You are required to have an administrator's approval to buy this license.";
		license_civ_bh = false;
		life_cash = life_cash + _price;
	};
	cutText ["This license allows you to purchase and use Tazer weapons as well as secure bounties from wanted individuals by turning them in to police. You must ROLEPLAY! Tazing without RP will be considered RDM!","PLAIN"];
	_other = ["rebel",0] call life_fnc_licenseType;
	_others = ["c3",0] call life_fnc_licenseType;
	player setVariable["bountyHunter",true,true];
	if(missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Because you have purchased a Bounter Hunter license, you have forfeited your rebel training.";
		missionNamespace setVariable[_other select 0,false];
	};
	if(missionNamespace getVariable[_others select 0,false]) then
	{
		hint "Because you have acquired a Bounty Hunter license, you have forfeited your Class 3 Weapons license.";
		missionNamespace setVariable[_others select 0,false];
	};
};
if(!(_type in ["bh","rebel","c3"])) then
{
	titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
};
[2] call SOCK_fnc_updatePartial;