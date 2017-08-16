private["_sum","_dice","_dice2"];   
if(isNil "life_action_in_use") then {life_action_in_use = false;};
_dice2=ceil(random 3);
_sum = ["eaudist",_dice2,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(life_action_in_use) exitWith {};
if(_sum > 0) then
{
life_action_in_use = true;
    ["Collecte de bouteille d'eau distiller...", 5] call life_fnc_showProgress;
    if(player distance water_box > 7) exitWith {hint "Tu dois rester à 7m du stock!"};		
    	if(([true,"eaudist",_sum] call life_fnc_handleInv)) then
    	{
    		titleText[format["Tu as rempli %1 bouteilles d'eau distille.",_sum],"PLAIN"];
    	};
    };     
life_action_in_use = false;