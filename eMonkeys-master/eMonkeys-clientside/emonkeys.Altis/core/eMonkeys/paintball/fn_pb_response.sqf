private["_respondmode","_message","_grenzeAusz","_maxGeld","_geldTod","_grenzeAusz","_geldMin","_punkte","_gesamt","_pbPositions"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;
_pbPositions = getArray(missionConfigFile >> "Cfgmaster" >> "paintballpos");

if (_respondmode==1) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
};

if (_respondmode==2) then {
    player addEventHandler ["handleDamage", {false}];
    playMusic "LeadTrack02_F_Bootcamp";
    hint "Willkommen in der Paintballarena! Das kommende Spiel wird 5 Minuten gehen, viel Spaß!";
    meinePos = getPos player;
    [] call EMonkeys_fnc_civFetchGear;
	eM_paintball = true;
    player enableFatigue false;
    meingear = civ_gear;
    civ_gear set [16,[]];
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
    _wohin = round(random (count _pbPositions));
    if (_wohin==count _pbPositions) then {_wohin=_wohin-1;};
    _position = _pbPositions select _wohin;
    player setPos _position;
    tode = 0;
    player addEventHandler ["Hit", { 
	
		
		[_this,"TON_fnc_dbpaintball",false,false] call EMonkeys_fnc_mp;

        _wohin = round(random (count _pbPositions));
        if (_wohin==count _pbPositions) then {_wohin=_wohin-1;};
        _position = _pbPositions select _wohin;
        player setPos _position;
		
		//Damage zurücksetzen
		eM_face_hub = 0;
		eM_neck = 0;
		eM_head = 0;
		eM_pelvis = 0;
		eM_spine1 = 0;
		eM_spine2 = 0;
		eM_spine3 = 0;
		eM_body = 0; 
		eM_arms = 0;
		eM_hands = 0;
		eM_legs = 0;
		eM_damage_null = 0;

		["shortWeak"] spawn EMonkeys_fnc_weaknessEffects;
        tode = tode+1;
        _maxGeld = 5000;
        _grenzeAusz = 50;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistik</t><br/><br/><t align='left'>Tode</t><t align='right'>%1</t><br/><t align='left'>Punkte</t><t align='right'>%2</t>",tode,_punkte];
    }];
};

if (_respondmode==3) then {
    civ_gear = meingear;
    [] spawn EMonkeys_fnc_civLoadGear;
    player setPos meinePos;
    player removeAllEventHandlers "Hit";
    player addEventHandler["handleDamage",{_this call EMonkeys_fnc_handleDamage;}];
    player enableFatigue true;
    _grenzeAusz = 50;
	uisleep 2;
	player allowDamage true;
	eM_paintball = false;
    if (tode>=_grenzeAusz  && tode  == 0) then {   
        hint "Das Spiel wurde beendet. Leider hast du nicht genügend Punkte erspielt, um einen Geldpreis zu erhalten!";
    } else {
        _maxGeld = 5000;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        _geldMin= _geldTod*tode;
        _gesamt = _maxGeld-_geldMin;
        EMonkeys_c164 = EMonkeys_c164 + _gesamt;
        hint format ["Das Spiel wurde beendet. Du hast insgesamt %1 Punkte erspielt und einen Geldpreis (%2€) erhalten. Glückwunsch!",_punkte,_gesamt];
    };
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};

if (_respondmode==5) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
    EMonkeys_c164 = EMonkeys_c164 - 100;
};