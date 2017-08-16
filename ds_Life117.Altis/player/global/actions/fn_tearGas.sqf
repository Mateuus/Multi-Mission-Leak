private["_distance","_pos","_eyeDir","_pPos","_impactPos","_norm","_angle","_blurEffect","_ppEffect","_mcu","_force","_headGear","_timer","_position"];

_pos = _this select 0;
_distance = _this select 1;
_position = (position _pos);

sleep 3;
_position = (position _pos);
if(player distance _pos > _distance)exitwith{};//Currently position is where it was thrown from, not where it lands.

if((headgear player) in ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_I"])exitwith{};
_timer = 75;
if((headgear player) in ["H_RacingHelmet_1_orange_F","H_Shemag_khk","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_tan","H_RacingHelmet_1_black_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F"])then{_timer = 25;};
if((player getVariable ["security",false])&&((DS_infoArray select 19) > 21)&&(headgear player) in ["H_Shemag_khk","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_tan","H_RacingHelmet_1_black_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F"])exitwith{};
if(player distance (getMarkerPos "auctionHouse") < 300)exitwith{};
if((playerside == west)&&((DS_infoArray select 21) > 26))exitwith{};

			player forceWalk true;
			player enableStamina true;
			player setCustomAimCoef 2;
			sleep 0.5;

_blurEffect = ppEffectCreate ["DynamicBlur",500];
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;
_blurEffect ppEffectAdjust [2.1];

	15 fadeSound 0.25;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 10;
	for "_i" from 0 to _timer do
	{
		_force = random 15;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
		"chromAberration" ppEffectCommit (0.3 + random 0.1);
		waituntil {ppEffectCommitted "chromAberration"};
		sleep 0.02;
		if(((_i)%25) == 0)then
			{
			[[player,"cough"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
			};
	};
	15 fadeSound 1;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
	"chromAberration" ppEffectEnable false;
	"chromAberration" ppEffectAdjust [0,0,true];
	"chromAberration" ppEffectCommit 5;
	"radialBlur" ppEffectAdjust  [0,0,0,0];
	"radialBlur" ppEffectCommit 5;
	sleep 6;
	"chromAberration" ppEffectEnable false;
	"radialBlur" ppEffectEnable false;
	resetCamShake;
	
			player forceWalk false;
			player enableStamina false;
			sleep 0.5;
			[] call DS_fnc_stamina;