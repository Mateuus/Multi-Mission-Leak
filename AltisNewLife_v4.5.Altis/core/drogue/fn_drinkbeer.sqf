closeDialog 0;
hintSilent parseText format["Votre taux d'alcoolemie est de<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[life_drink] call life_fnc_numberText];
uiSleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
player setVariable["inDrink",true,true];

for "_i" from 0 to 59 do
{
    if(life_drink > 0.12) then {

		"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.05,random 0.05,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.4,0.4];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 3, 1, random 3];
		uiSleep 1;
	};
};

player setVariable["inDrink",false,true];
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

resetCamShake;

if(life_drink > 0.2) then {
[] spawn life_fnc_overdose;
};