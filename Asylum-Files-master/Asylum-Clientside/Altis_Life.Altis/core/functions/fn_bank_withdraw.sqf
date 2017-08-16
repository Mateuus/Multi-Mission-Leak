private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "You can't withdraw more then $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumber)) exitWith {hint "That isn't in an actual number format."};

if (!life_gang_atm) then
{
	if(_val > life_atmmoney) exitWith {hint "You don't have that much in your bank account!"};
	["cash","add",_val] call life_fnc_uC;
	["atm","take",_val] call life_fnc_uC;
	hint format ["You have withdrawn $%1 from your bank account",[_val] call life_fnc_numberText];
}
else
{
	if(!life_gov_atm && life_gang_rank > 2) exitWith {hint "You must be rank 2 or above to withdraw from the gang bank.";};
	if(_val > life_gang_atm_val) exitWith {hint "There isn't that much in your gang's bank account!"};
	if ((time - life_gang_bank_time) < 10) exitWith {systemChat "You may only deposit or withdraw from your gang bank once every 10 seconds."};
	if (life_gov_atm) then { [["999999",_val,"take",player],"ASY_fnc_updateGangBank",false,false] spawn life_fnc_MP; }
	else { 
		if(group player getVariable["gangBankInUse",""] != getPlayerUID player) exitWith {hint "Only one person may withdraw from the gang bank at a time."};
		[[life_gang,_val,"take",player],"ASY_fnc_updateGangBank",false,false] spawn life_fnc_MP; 
	};
	life_gang_bank_time = time;
	//[] call life_fnc_sessionUpdate;
};

if (life_gov_atm) then { [0,0,0,true,true] call life_fnc_atmMenu; }
else { [0,0,0,life_gang_atm] call life_fnc_atmMenu; };