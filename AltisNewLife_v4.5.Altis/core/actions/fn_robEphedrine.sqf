private["_sum","_dice"];
_sum = ["ephedrine",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(life_action_in_use) exitWith {};
if(_sum > 0) then
{
	life_action_in_use = true;
	["Vol d'Ephedrine en cours...", 5] call life_fnc_showProgress;
	if(player distance ephedrine_box > 5) exitWith {hint "Tu dois rester à 5m du stock!"};	
	if(([true,"ephedrine",1] call life_fnc_handleInv)) then
	{
		_dice = random(100);
		if(_dice < 20) then 
		{
			[[ephedrine_box,"BigAlarm",500],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		};	
		titleText["Tu as volé 1 fiole d'ephedrine.","PLAIN"];
	};
};
life_action_in_use = false;