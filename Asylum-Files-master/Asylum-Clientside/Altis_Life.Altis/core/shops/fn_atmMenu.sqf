/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_unit","_type","_isBank","_isGov","_rnd"];
life_gang_atm = [_this,3,false,[false]] call BIS_fnc_param;
life_gov_atm = [_this,4,false,[false]] call BIS_fnc_param;
life_gang_atm_val = 0;

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if (format["%1",_unit] != "0") then { if ((player distance _unit) > 7) exitWith { hint "You are too far away." }; };

if(!life_use_atm) exitWith
{
	hint "Because you recently robbed something, you can't use the ATM for 5 minutes after that robbery.";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;

if (life_gang_atm) then
{
	_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2","Loading...",[life_money] call life_fnc_numberText];
	_units ctrlShow false;
	(_display displayCtrl 2705) ctrlShow false;
	if (!life_gov_atm) then {
		[[player, life_gang],"ASY_fnc_queryGangBank",false,false] spawn life_fnc_MP; 
		group player setVariable["gangBankInUse",getPlayerUID player,true];
	}
	else { [[player, "999999"],"ASY_fnc_queryGangBank",false,false] spawn life_fnc_MP; };
}
else
{
	_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[life_atmmoney] call life_fnc_numberText,[life_money] call life_fnc_numberText];

	{
		if (alive _x && _x != player && (side _x) != resistance) then
		{
			_units lbAdd format["%1",name _x];
			_units lbSetData [(lbSize _units)-1,str(_x)];
		};
	} foreach allPlayers;

	lbSort _units;
	lbSetCurSel [2703,0];
};

if (life_gang_atm) then
{
	[] spawn
	{
		waitUntil{isNull(findDisplay 2700)};
		life_gang_atm = false;
		group player setVariable["gangBankInUse","",true];
	};
};

if (life_gov_atm) then
{
	[] spawn
	{
		waitUntil{isNull(findDisplay 2700)};
		life_gov_atm = false;
	};
};

if (life_wanted > 1000 && (time - life_last_wanted) > 240) then
{
	life_last_wanted = time;
	[[Str(life_wanted),name player,5],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
};

//if (life_donator == 0) then { systemChat format["You have %1 prestige. If you donated on the Asylum website you can receive a %2 prestige boost per donor level.", life_wealthPrestige, [life_prestige_per_donor] call life_fnc_numberText] }
//else { systemChat format["You have %1 base prestige plus a %2 bonus for donating.", life_wealthPrestige, life_donator * life_prestige_per_donor] };