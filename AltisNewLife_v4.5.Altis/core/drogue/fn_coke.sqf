closeDialog 0;
hint "Allez ca me fera pas de mal un peu de coke dans le pif";
[[0,format["%1 sniff une bonne grosse ligne de coke !",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,format["ATTENTION: Des civils sniff de plus en plus de coke, notre ile a besoin que vous arretez tous ces drogués ! -Anonyme",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

player setVariable["Druged",true,true];
//[player,"cocaine_son", 54] call life_fnc_globalSound;
player say3D "cocaine_son";

private["_force"];
for "_i" from 0 to 500 do
{
	_force = random 15;
	player setFatigue 0;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 50, _force / 50, false];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [1]; // intensity of blur
	"dynamicBlur" ppEffectCommit 15; // time till vision is fully blurred
	waituntil {ppEffectCommitted "chromAberration"};
	uiSleep 0.02;
};
life_thirst = 100;
life_hunger = 100;
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 20; // time it takes to normal
20 fadeSound 1; //fades the sound back to normal

player setVariable["Druged",false,true];

if(life_drug > 0.2) then {
[] spawn life_fnc_overdose;
};