_this spawn {
 
        private "_text";
        _text = _this;
       
        // Compile date
        private [ "_month", "_day", "_hour", "_minute" ];
        _month = str (date select 1 );
        _day = str ( date select 2 );
        _hour = str ( date select 3 );
        _minute = str ( date select 4 );
       
        if ( date select 1 < 10 ) then { _month = format [ "0%1", str ( date select 1 ) ] };
        if ( date select 2 < 10 ) then { _day = format [ "0%1", str ( date select 2 ) ] };
        if ( date select 3 < 10 ) then { _hour = format [ "0%1", str ( date select 3 ) ] };
        if ( date select 4 < 10 ) then { _minute = format [ "0%1", str ( date select 4 ) ] };
       
        private [ "_time", "_date" ];
        _time = format [ "%1:%2", _hour, _minute ];
        _date = format [ "%1-%2-%3", str ( date select 0 ), _month, _day ];
       
        // Compile SITREP
        private "_sitrep";
        _sitrep = [
                [ _date + " ", "" ],
                [ _time, "font = 'PuristaMedium'" ]
        ];
       
        if ( count _text > 0 ) then {
 
                _sitrep = _sitrep + [ [ "", "<br/>" ] ];
                { _sitrep = _sitrep + [ _x ] } forEach _text;
 
        };
 
        // Display SITREP
        [
                _sitrep,
                safeZoneX - 0.01,
                safeZoneY + (1 - /0.175) * safeZoneH,
                true,
                "<t align = 'right' size = '1.0' font = 'PuristaLight'>%1</t>"
        ] spawn BIS_fnc_typeText2;
 

    };
