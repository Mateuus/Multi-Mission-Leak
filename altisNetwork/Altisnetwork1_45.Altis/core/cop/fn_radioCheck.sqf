while { true } do {

    if ( "ItemRadio" in assignedItems player ) then {

        if ( ( player getVariable "hasRadio" ) ) then {

            player setVariable [ "hasRadio", false, true ];

        };

    };

    sleep 3;

};
