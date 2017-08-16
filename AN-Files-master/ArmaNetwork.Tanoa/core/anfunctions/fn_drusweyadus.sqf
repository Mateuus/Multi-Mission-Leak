drug_level = drug_level + 0.10;
if (drug_level > 1) then { drug_level = 1;};
if(isNil "meth_effect") then {meth_effect = 0;};
if (meth_effect isEqualTo 0) then {
	meth_effect = time;
	[] spawn {
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [drug_level/10,drug_level/10,true];
		"chromAberration" ppEffectCommit 1;
		player setVariable ["drug_meth",true,true];
		waitUntil {!alive player || ((time - meth_effect) > (3 * 60))};
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		player setVariable ["drug_meth",nil,true];
		meth_effect = nil;
	};
};

meth_effect = time;
