/*
    @Author: =IFD= Cryptonat
    @Created: 2/22/14
    
    Description:
    Saves the player's gear every 10 minutes.
*/

while {true} do {    //Tells the function to continually loop.
    sleep 600;   //Sleep for 600 seconds/10 minutes
    if (alive player) then   //If the player is alive, then do this
        {
        [false] call SOCK_fnc_syncData;;  //Same function used by the "Sync" button
        hint "Spiel automatisch gespeichert."   //Just to tell you that the game is saving
    };
};