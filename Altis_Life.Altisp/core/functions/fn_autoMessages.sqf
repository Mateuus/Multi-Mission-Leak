/*
    File: fn_autoMessages.sqf
    Author: BenjaminSansNom

    Description:
    Auto messages in game every X seconds
*/

[] spawn {
    // Add a line in this array to add a message
    _messages = [
        "Strona Serwera:<br/>
        <t color='#44CBFF' size='1.5'>www.aln.ct8.pl</t><br/><br/>
        TeamSpeak:<br/>
        <t color='#44CBFF' size='1.5'>stabilne.it</t><br/><br/>
        Restarty Serwera:<br/>
        <t color='#44CBFF' size='1.5'>00:00 | 06:00 | 12:00 | 18:00</t>
        "
    ];

    _refreshTime = 1800; // Time between each message (in seconds)

    _i = 0;
    while {true} do {
        _count = count _messages;
        _message = _messages select _i;
        hint parseText format["<t color='#ffffff' size='2'>Niespodzianki</t><t color='#c45454' size='2'>Altis</t><br/><br/><img shadown='false' size='6' image='logo.paa'/><br/><br/>%1", _message];
        sleep _refreshTime;
        if (_i == (_count - 1)) then {
            _i = 0;
        } else {
            _i = _i + 1;
        };
    };
};