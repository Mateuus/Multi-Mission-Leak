private["_sum"];
_sum = ["metylamine",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(life_action_in_use) exitWith {};
if(_sum > 0) then
{
	life_action_in_use = true;
	["Vol de Metylamine en cours...", 5] call life_fnc_showProgress;
	if(player distance meth_box > 5) exitWith {hint "Tu dois rester à 5m du stock!"};	
	if(([true,"metylamine",1] call life_fnc_handleInv)) then
	{
		_dice = random(100);
		if(_dice < 20) then 
		{
			[[meth_box,"BigAlarm",500],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		};	
		titleText["Tu as volé 1 bidon de metylamine.","PLAIN"];
	};
};
life_action_in_use = false;
