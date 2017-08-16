#include "..\script_macros.hpp"

/*


*       Wenn du Blöck lesen, dan bischte xCooL


*/
params
[
    ["_mode","",["",0]]
];

switch (_mode) do {
    case "hund1": { 

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Fin_random_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund1"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        }; 
    };

    case "hund2": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Fin_blackwhite_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund2"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "hund3": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Fin_tricolour_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund3"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
     };
    case "hund4": { 

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Alsatian_Sand_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund4"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "hund5": { 

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Alsatian_Black_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund5"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "hund6": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Alsatian_Sandblack_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Dog: Call", {["hund6"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Dog: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Dog: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Dog: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "hase": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Rabbit_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Hase: Call", {["hase"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Hase: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Hase: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Hase: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "ziege": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Goat_random_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Ziege: Call", {["ziege"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Ziege: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Ziege: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Ziege: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 
        };
    };
    case "sheep": {

        removeAllActions player;

        if ( (FETCH_CONST(ES_donator) == 3) && (playerSide == civilian) && (HundWufWuf) ) then {

        HundWufWuf = false;

        HundHide = false;

        ES_grp = createGroup EAST;
        ES_dogFollowing = false;

        ES_dog = ES_grp createUnit ["Sheep_random_F", getPos player, [], 5, "CAN_COLLIDE"];

        ES_dogFollowPlayer = {
            ES_dogFollowing = true;

            0 = [] spawn {
                while {ES_dogFollowing} do 
                {
                    if (alive ES_dog) then 
                    {
                        ES_dog doMove getPos player;
                        sleep 1; 
                    } else { ES_dogFollowing = false; HundWufWuf = true; HundHide = false; removeAllActions player; hint "Dein Tier ist tot..."; };
                };
            };
        };

        ES_dogStopFollowing = {
            ES_dogFollowing = false;

            ES_dog playMove "Dog_Idle_Stop";
            doStop ES_dog;
        };

        ES_dogHide = {

            ES_dogFollowing = false;

            deleteVehicle ES_dog;

            removeAllActions player;

            HundWufWuf = true;

            HundHide = true;

            player addAction ["Sheep: Call", {["sheep"] spawn ES_fnc_tiere;;}];

        };
            player addAction ["Sheep: Start following player", {[] call ES_dogFollowPlayer;}];
            player addAction ["Sheep: Stop following", {[] call ES_dogStopFollowing;}];
            player addAction ["Sheep: Hide", {[] call ES_dogHide;}];

        } else { 

            InfoText = "Du hast leider kein Gold ViP Premium!";
            [[],"ES_fnc_hudSetup",true,true] spawn ES_fnc_MP;

            sleep 5;

            InfoText = "www.Eisenschmiede-Gaming.de";
            [[],"ES_fnc_hudSetup",true,true] spawn ES_fnc_MP; 
        };
    };
    default {  };
};