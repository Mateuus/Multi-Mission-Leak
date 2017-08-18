private["_respondmode","_message"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;

if (_respondmode==1) then {
	_message = [_this,1,"",[""]] call BIS_fnc_param;
	hint format ["%1",_message];
};

if (_respondmode==2) then {
	playMusic "LeadTrack02_F_Bootcamp";
    hint "Welcome to the paintball arena! The next game is in 5 minutes!";
	meinePos = getPos player;
	[] call life_fnc_saveGear;
	meingear = life_gear;
	life_gear set [16,[]];
	RemoveAllWeapons player;
	{player removeMagazine _x;} foreach (magazines player);
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadGear player;
	player forceAddUniform "U_I_Protagonist_VR";
	player addWeaponGlobal "hgun_Pistol_heavy_02_Yorris_F";
	player addMagazines ["6Rnd_45ACP_Cylinder" , 25];
	{
		player unassignItem _x;
		player removeItem _x;
	} foreach (assignedItems player);
	player allowDamage false;
	_wohin = round(random (count pb_positionen));
	if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
	_position = pb_positionen select _wohin;
	player setPos _position;
	tode = 0;
	player addEventHandler ["Hit", {
		_wohin = round(random (count pb_positionen));
		if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
		_position = pb_positionen select _wohin;
		player setPos _position;
		tode = tode+1;
		_maxGeld = 15000;
		_grenzeAusz = 30;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistic</t><br/><br/><t align='left'>Deaths</t><t align='right'>%1</t><br/><t align='left'>Points</t><t align='right'>%2</t>",tode,_punkte];
	}];
};

if (_respondmode==3) then {
	life_gear = meingear;
	[] spawn life_fnc_Loadgear;
	player setPos meinePos;
	player allowDamage true;
	player removeAllEventHandlers "Hit";
	_grenzeAusz = 30;
	if (tode>=_grenzeAusz) then {
		hint "The game has ended. Sorry, but you have not earned enough points to receive a cash prize!";
	} else {
		_maxGeld = 15000;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		_geldMin= _geldTod*tode;
		_gesamt = _maxGeld-_geldMin;
		life_cash = life_cash + _gesamt;
		hint format ["The game has ended. You've earned a total of %1 pints and received a cash prize of ($%2) dollars. Congratulations!",_punkte,_gesamt];
	};
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};