/*
    File: fn_autoMessages.sqf
    Author: BenjaminSansNom

    Description:
    Auto messages in game every X seconds
*/

/*
[] spawn {
    // Add a line in this array to add a message
    _messages = [
        "Herzlich Willkommen auf dem Phoenix Squad Tanoa Life Server!!! Unsere Website und unser Teamspeak sind hier zu finden:<br/> <t color='#e32828' size='1.5'>phoenix-squad.de/dons</t>",
        ];

    _refreshTime = 900; // Time between each message (in seconds)

    _i = 0;
    while {true} do {
        _count = count _messages;
        _message = _messages select _i;
        hint parseText format["<t color='#ffffff' size='2'>Phoenix</t><t color='#c45454' size='2'>Squad</t><br/><br/><img shadown='false' size='6' image='textures\armalife.jpg'/><br/><br/>%1", _message];
        sleep _refreshTime;
        if (_i == (_count - 1)) then {
            _i = 0;
        } else {
            _i = _i + 1;
        };
    };
};
*/


    _refreshTime = 1800; // Time between each message (in seconds)

    while {true} do {
        hint parseText format["<t color='#ffffff' size='2'>Phoenix</t><t color='#c45454' size='2'>Squad</t><br/><br/><img shadown='false' size='6' image='textures\armalife.jpg'/><br/><br/>Herzlich Willkommen auf dem Phoenix Squad Tanoa Life Server!!! Unsere Website und unser Teamspeak sind hier zu finden:<br/> <t color='#e32828' size='1.5'>phoenix-squad.de</t>"];
        sleep _refreshTime;
    };
