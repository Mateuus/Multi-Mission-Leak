/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
try
{
    if !(isNil "APBInfo") then 
    {
        throw "Error - Important Info is Missing!";
    };
  
    disableSerialization;
    private _display = findDisplay 56872;
    private _responding =  _display displayCtrl 3801;
    private _emergency = _display displayCtrl 3800;

    private _title = ctrlText 3500;
    private _description = ctrlText 3401;
    private _additionalInfo = ctrlText 3402;

    if (_title isEqualTo "" OR {_description isEqualTo ""}) then 
    {
        throw "You must enter something into either the Title or Description!";
    };

    if ([_title] call KRON_StrLen > 30) then 
    {
        throw "APB Title has to be under 30 characters!";
    };

    if ([_description] call KRON_StrLen > 60) then 
    {
        throw "APB Description has to be under 60 characters!";
    };

    if ([_additionalInfo] call KRON_StrLen > 60) then 
    {
        throw "APB Additional Info has to be under 60 characters!";
    };

    if ([":",_title] call BIS_fnc_inString) then 
    {
        throw "A bad character was found. Try again.";
    };

    if ([":",_description] call BIS_fnc_inString) then 
    {
        throw "A bad character was found. Try again.";
    };

    if ([":",_additionalInfo] call BIS_fnc_inString) then 
    {
        throw "A bad character was found. Try again.";
    };

    if (_additionalInfo isEqualTo "") then 
    {
        _additionalInfo = "No Addition Info";
    };

    if (cbChecked _responding && {!isNil "life_apb_task"}) then 
    {
        throw "You currently have an APB assigned to you. Complete it and remove it from the active list to accept another one!";
    }; 

    APBInfo = [];
    APBInfo = [player,(getPlayerUID player),profileName,_title,_description,_additionalInfo];

    private _isResponding = if (cbChecked _responding) then {profileName} else {"OPEN"};
    private _isEmergency = if (cbChecked _emergency) then {1} else {0};

    APBInfo pushBack _isResponding;
    APBInfo pushBack _isEmergency;
    
    closeDialog 0;

    openMap [true,true];
    hintSilent "Click on map to attach coordinates to new APB. Suggested Coords are rough estimate of APB location";
    onMapSingleClick "
        APBInfo pushBack _pos; 
        APBInfo remoteExecCall ['life_fnc_apbListNew',2]; 
        openMap [false,false];  
        APBInfo = nil; 
        onMapSingleClick ''; 
        false
    ";
}
catch
{
    hintSilent _exception;
};
