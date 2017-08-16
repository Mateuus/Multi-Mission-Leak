drug_level = drug_level + 0.10;
if(drug_level > 1) then { drug_level = 1;};
if(isNil "heroin_effect") then {heroin_effect = 0;};
if (heroin_effect isEqualTo 0) then {
	heroin_effect = time;
	[] spawn {
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [drug_level/10,drug_level/10,true];
		"chromAberration" ppEffectCommit 1;
		player setVariable ["drug_heroin",true,true];
		waitUntil {!alive player || ((time - heroin_effect) > (3 * 60))};
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		player setVariable ["drug_heroin",nil,true];
		heroin_effect = nil;
	};
};
heroin_effect = time;
