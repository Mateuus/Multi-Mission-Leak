/*File: fn_drinkmoonshine.sqf author:[midgetgrimm] drinkypoo*/
closeDialog 0;
_prom = EMonkeys_dr164 * 10;
hintSilent parseText format["Du hast <br/> <t size='1.4'><t color='#FF0000'>%1</t></t>Promille",_prom];
uisleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
//"wetDistortion" ppEffectEnable true;
enableCamShake true;

player setVariable["inDrink",true,true];

for "_i" from 0 to 89 do
{
    if(EMonkeys_dr164 > 0.15) then {
		
		//"wetDistortion" ppEffectAdjust [random 5];
		"chromAberration" ppEffectAdjust [random 0.07,random 0.07,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust[0.04, 0.09, 0.25, 0.29];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uisleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.03,random 0.03,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.43,0.43];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uisleep 1;
	};
};
if (EMonkeys_dr164 > 0.22) then {
			titleText ["Du hast einen Blackout","BLACK OUT"];
			player playMoveNow "Incapacitated";
			uisleep 15;
			removeUniform player;removeVest player;
			player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
			uisleep 10;
			EMonkeys_dr164 = 0;
			titleText["Was zur Hölle ist mit mir passiert?","PLAIN"];
			player playMoveNow "amovppnemstpsraswrfldnon";
			[[0,format["%1 hat sich in der Öffentlichkeit betrunken",profileName]],"EMonkeys_fnc_broadcast",nil,false] call EMonkeys_fnc_mp;
			[[getPlayerUID player,profileName,"390"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
			
};
//Stop effects
player setVariable["inDrink",false,true];
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uisleep 6;

//Deactivate ppEffects
//"chromAberration" ppEffectEnable false;
//"radialBlur" ppEffectEnable false;
//"wetDistortion" ppEffectEnable false;
resetCamShake;

if(EMonkeys_dr164 != 0) then {EMonkeys_dr164 = EMonkeys_dr164 - 0.02;};