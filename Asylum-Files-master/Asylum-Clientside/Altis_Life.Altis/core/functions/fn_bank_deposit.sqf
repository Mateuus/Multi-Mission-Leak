_all = param[0,false];
private["_val"];
_val = if(_all) then {floor life_money} else {parseNumber(ctrlText 2702)};
if(_val > 999999) exitWith {hint "You can't deposit more then $999,999";};
if(_val <= 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumber)) exitWith {hint "That isn't in an actual number format."};
if(_val > life_money) exitWith {hint "You don't have that much on you!"};

if (!life_gang_atm) then
{
	["cash","take",_val] call life_fnc_uC;
	["atm","add",_val] call life_fnc_uC;
	hint format["You have deposited $%1 into your bank account",[_val] call life_fnc_numberText];
}
else
{
	if ((time - life_gang_bank_time) < 10) exitWith {systemChat "You may only deposit or withdraw from your gang bank once every 10 seconds."};
	if (life_gov_atm) then { [["999999",_val,"add",player],"ASY_fnc_updateGangBank",false,false] spawn life_fnc_MP; }
	else { [[life_gang,_val,"add",player],"ASY_fnc_updateGangBank",false,false] spawn life_fnc_MP; };
	life_gang_bank_time = time;
	//[] call life_fnc_sessionUpdate;
};

if (life_gov_atm) then { [0,0,0,true,true] call life_fnc_atmMenu; }
else { [0,0,0,life_gang_atm] call life_fnc_atmMenu; };