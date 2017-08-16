/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
		*edit by MR AWESOME HIMSELF -> infiSTAR hihi

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
if(!alive player)exitWith{false};
params[['_unit',objNull],['_selectionName',''],['_damage',0],['_source',objNull],['_projectile',''],['_hitPartIndex',0]];
if(!isNull _source)then
{
	//Fuck glitcher
	if(_source getVariable['restrained',false])exitWith{_damage = damage player;_damage};


	_unitOnFoot = isNull objectParent player;
	_sourceOnFoot = isNull objectParent _source;

	//anti vdm
	if((_unitOnFoot)&&{!_sourceOnFoot}&&{_projectile isEqualTo ''})exitWith
	{
		[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		_damage = damage player;_damage
	};

	if(!(_source isEqualTo _unit)&&(_sourceOnFoot))then
	{
		_sidesource = side _source;
		if(_sidesource in [west,east])then
		{
			_curWep = currentWeapon _source;
			
			//Taser
			if(_curWep in ['hgun_P07_snds_F','arifle_SDAR_F'])exitWith
			{
				if((_unit distance _source) < 50)then
				{
					if(!life_istazed && !(_unit getVariable ['restrained',false]))then
					{
						if(typeOf (vehicle player) == 'B_Quadbike_01_F')then
						{
							player action ['Eject',vehicle player];
						};
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
				_damage = damage player;_damage
			};
			
			//Rubberbullets
			if(_curWep in ['arifle_MXC_Black_F','arifle_MXC_F'])then
			{
				if(_unitOnFoot)exitWith
				{
					if(!life_istazed && !(_unit getVariable ['restrained',false]))then
					{
						[_unit,_source] spawn life_fnc_handleDowned;
					};
					_damage = damage player;_damage
				};
			};
			
		};
	};
};
[] call life_fnc_hudUpdate;
_damage