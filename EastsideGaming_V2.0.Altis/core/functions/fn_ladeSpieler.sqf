_handle = [] spawn {
	//if ((getplayeruid player) in ["76561198208681004","76561198153074011","76561198028669993"])exitWith{hint "Willkommen Chef!"};
	0 cutFadeOut 9999999;
	0 fadeSound 0.1;
	0 fadeMusic 1;
	showChat false;
	player allowDamage false;
	playMusic "LeadTrack01_F_EPA";
	disableSerialization;
	createDialog "ESG_spawnBefore";
	
	_messages = [];
	{
		_messages pushback _x;
	}foreach getArray(missionConfigfile >> "CfgInfos" >> "startScreen" >> "messages");
	_messages call BIS_fnc_arrayShuffle;
	_ui = findDisplay 88214;
	_progressBar = _ui displayCtrl 1000;
	_titleText = _ui displayCtrl 1001;
	_ctrlgruppe = _ui displayCtrl 121212;
	_btn = _ui displayCtrl 2400;
	_ui displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];
	_contenttext = '<br/><t font="PuristaBold" align="center">Serverteam</t><br/><t size="1.1" color="#C72A2A">Serverleitung:</t><br/>    - Rainer Blödsinn<br/>    - Livinya Sommer<br/>    - Pantyshot<br/><br/><t size="1.1" color="#FF0000">Projektmanagement:</t><br/>    - Basti<br/>    - Niel Skyfall<br/><br/><t size="1.1" color="#00AB47">Suportleitung:</t><br/>    - Dominik<br/>    - Harmy<br/><br/><t size="1.1" color="#0088FF">Development:</t><br/>    <t font="PuristaBold" size="0.8">Scripting:</t><br/>        - Basti<br/><br/>    <t font="PuristaBold" size="0.8">Design/Media:</t><br/>        - Gesucht -<br/><br/><br/><t font="PuristaBold" align="center">Fraktionsleitungen</t><br/><t size="1.1" color="#0069C4">Polizei:</t><br/>    - Niel Skyfall<br/>    - Gustav Krone<br/><t size="1.1" color="#b0000d">Feuerwehr:</t><br/>    - Michael McSilver';
	_ctrlgruppe ctrlSetStructuredText parseText _contenttext;
	_h = ctrlTextHeight _ctrlgruppe;
	_w = ((ctrlPosition _ctrlgruppe) select 2);
	_ctrlgruppe ctrlSetPosition [0, 0, _w, _h];
	_ctrlgruppe ctrlCommit 0;
	_progressBar progressSetPosition 0.01;
	_btn ctrlEnable false;
	_cP = 0;
	_t2 = "Fertig";
	_index = 0;
	_count = count _messages;
	_nextMessage = time;
	for "_i" from 0 to 1 step 0 do {
		if( _nextMessage < time ) then {
            _titleText ctrlSetStructuredText parsetext format["<t align='center'>%1...</t>", _messages select _index];
            _index = _index + 1;
            if( _index >= _count ) then {
                _index = 0;
            };
            _nextMessage = time + 2 + (random 2);
        };
        _cp = _cp + 0.0015;
		_progressBar progressSetPosition _cP;

		if (_cP >= 1) exitWith {};
		if (!alive player) exitWith {_t2 = "Abgebrochen";};
		sleep .06;
	};
	_titleText ctrlSetStructuredText parsetext format ["<t align='center' color='#42f445'>%1 (%2)</t>","Laden der Spielerinformationen",_t2];
	sleep 1;
};
waitUntil {scriptDone _handle};
disableSerialization;
_ui1 = findDisplay 88214;
_btn2 = _ui1 displayCtrl 2400;
_btn2 ctrlEnable true;
