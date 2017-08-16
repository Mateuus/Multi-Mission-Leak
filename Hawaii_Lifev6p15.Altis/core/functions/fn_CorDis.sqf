if(!life_CorDis) then {
	"colorCorrections" ppEffectAdjust [1.1, 1.00, -0.1, [3.5, 3.5, 2.8, 0], [0.55, 0.55, 0.72, 1.35],  [0.799, 0.587, 0.514, 2000.03]];
	"colorCorrections" ppEffectCommit 0;   
	"colorCorrections" ppEffectEnable true;
	life_CorDis = true;
} else {
	"ColorCorrections" ppEffectEnable false;
	life_CorDis = false;
};