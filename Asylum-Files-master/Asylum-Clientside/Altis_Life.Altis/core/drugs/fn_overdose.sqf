/*
	File: fn_overdose.sqf
	Author: John "Paratus" VanderZwet / cptjames32
	
	Description:
	Took things a little too far!
*/

_gesture = "GestureSpasm%1";
_duration = ceil random 20;

systemChat "You have overdosed!";

disableUserInput true;
player playActionNow format[_gesture,1];

for "_i" from 1 to _duration do {
	switch (_i) do
	{
		case (5): { player playActionNow format[_gesture,2]; };
		case (10): { player playActionNow format[_gesture,3]; };
		case (15): { player playActionNow format[_gesture,4]; };
	};
	sleep 2;
};

disableUserInput false;

_death = random 1;
if (_death > 0.7) then { systemChat "You have died of a drug overdose."; player setDamage 1; }
else { player playActionNow "gestureNod"; };

life_drug_level = life_drug_level - 1;