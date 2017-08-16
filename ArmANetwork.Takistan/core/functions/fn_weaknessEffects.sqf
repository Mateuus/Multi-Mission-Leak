// Bunch of WeaknessEffects created by Mario
private["_effect","_hndl_color","_hndl_chrom"];

_effect = _this select 0;

switch (_effect) do
{
	case "shortWeak":
	{
		_hndl_color = ppEffectCreate ["colorCorrections",1500002];
		_hndl_color ppEffectEnable true;
		_hndl_color ppEffectAdjust [0.75, 0.75, 0, [0, 0, 0.0, 0],[0, 0, 0, 1.0],[0, 0, 0, 0]];
		_hndl_color ppEffectCommit 2;
		_hndl_chrom = ppEffectCreate ["chromAberration",100];
		_hndl_chrom ppEffectEnable true;
		_hndl_chrom ppEffectAdjust [0.15,0.15,true];
		_hndl_chrom ppEffectCommit 2;
		
		addCamShake [8, 8, 1];

		uisleep 2;

		_hndl_color ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0],[1.0, 1.0, 1.0, 1.0],[0.199, 0.587, 0.114, 0.0]];
		_hndl_color ppEffectCommit 2;
		_hndl_chrom ppEffectAdjust [0.0,0.0,true];
		_hndl_chrom ppEffectCommit 2;

		uisleep 3;

		ppEffectDestroy _hndl_color;
		ppEffectDestroy _hndl_chrom;
	};
	
	case "hardDrugUse":
	{
		_hndl_color = ppEffectCreate ["colorCorrections",1500002];
		_hndl_color ppEffectEnable true;
		_hndl_color ppEffectAdjust [1.5, 1.5, 0, [0, 0, 0.0, 0],[0, 0, 0, 1.0],[0, 0, 0, 0]];
		_hndl_color ppEffectCommit 6;
		_hndl_chrom = ppEffectCreate ["chromAberration",100];
		_hndl_chrom ppEffectEnable true;
		_hndl_chrom ppEffectAdjust [0.2,0.2,true];
		_hndl_chrom ppEffectCommit 6;

		uisleep 6;

		_hndl_color ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0],[1.0, 1.0, 1.0, 1.0],[0.199, 0.587, 0.114, 0.0]];
		_hndl_color ppEffectCommit 0.7;
		_hndl_chrom ppEffectAdjust [0.0,0.0,true];
		_hndl_chrom ppEffectCommit 0.7;

		uisleep 2;

		ppEffectDestroy _hndl_color;
		ppEffectDestroy _hndl_chrom;
	};

};