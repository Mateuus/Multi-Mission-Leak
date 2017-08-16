_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\sirenalarm.ogg";
        playSound3D [_soundToPlay, siren1, false, getPosASL siren1, 5, 1, 0]; //Kavala
hint "Sirene aktiviert!";