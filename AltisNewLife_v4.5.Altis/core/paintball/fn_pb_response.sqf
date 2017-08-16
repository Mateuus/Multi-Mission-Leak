private["_respondmode","_message"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;

if (_respondmode==1) then {
	_message = [_this,1,"",[""]] call BIS_fnc_param;
	hint format ["%1",_message];
};

if (_respondmode==2) then {
	player addEventHandler ["handleDamage", {false}];
	playMusic "LeadTrack02_F_Bootcamp";
	hint "Bienvenue dans le Laser Quest d'AltisNewLife ! Le prochain match dura 6 minutes, bonne chance !";
	meinePos = getPos player;
	[] call life_fnc_saveGear;
	player enableFatigue false;
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
		_maxGeld = 1500;
		_grenzeAusz = 30;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Stats</t><br/><br/><t align='left'>Mort</t><t align='right'>%1</t><br/><t align='left'>Points</t><t align='right'>%2</t>",tode,_punkte];
	}];
};

if (_respondmode==3) then {
	life_gear = meingear;
	[] spawn life_fnc_Loadgear;
	player setPos meinePos;
	player allowDamage true;
	player removeAllEventHandlers "Hit";
	player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
	player enableFatigue true;
	_grenzeAusz = 30;
	if (tode>=_grenzeAusz) then {
		hint "Le jeu est termine. Desole, mais vous n'avez pas gagne assez de points pour recevoir un prix !";
	} else {
		_maxGeld = 1500;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		_geldMin= _geldTod*tode;
		_gesamt = _maxGeld-_geldMin;
		argent_liquide = argent_liquide + _gesamt;
		hint format ["Le jeu est termine. Vous avez gagne un total de %1 des points et recevez un prix en liquide de %2€. Felicitations !",_punkte,_gesamt];
	};
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};

if (_respondmode==5) then {
	_message = [_this,1,"",[""]] call BIS_fnc_param;
	hint format ["%1",_message];
	argent_liquide = argent_liquide - 500;
};