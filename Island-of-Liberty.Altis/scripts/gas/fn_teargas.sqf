private ["_grenade","_inGas"];
_grenade = _this select 0;
if(isNull _grenade) exitWith {};
_inGas = false;

if (_grenade distance player < 1000) then {
	while {!isNull _grenade} do {
		if((_grenade distance player < 10) && (getPosATL _grenade select 2 < 0.5) && !(vest player in ["V_PlateCarrier1_blk","V_TacVest_blk_POLICE"])) then {
			if(!_inGas) then {
				_inGas = true;
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
				"dynamicBlur" ppEffectCommit 3;
				enableCamShake true;
				addCamShake [10, 45, 10]; // set shakevalues
				player setFatigue 1; // sets the fatigue to 100%
			};
		} else {
			if(_inGas) then {
				//Set back to normal in 15sec;
				"dynamicBlur" ppEffectAdjust [0];
				"dynamicBlur" ppEffectCommit 15;
				resetCamShake;
				_inGas = false;
			};
		};
		sleep 5;
	};
	sleep 3;
	//Set back to normal in 15sec;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 15;
	resetCamShake;
	
	sleep 16;
	"dynamicBlur" ppEffectEnable false;
};