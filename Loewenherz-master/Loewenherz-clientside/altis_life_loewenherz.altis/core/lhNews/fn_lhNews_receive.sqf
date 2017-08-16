/*
    Author: H4SHK3KS (ofpectag: PG)
    File: fn_lhNews_recieve.sqf

    Description:
    Recieves a  news

    Parameters:
    None

    Returns:
    Nothing
*/
disableSerialization;
_message = param[0,"",[""]];
_sender = param[1,"",[""]];

if(_message == "") exitWith {};
if(_sender == "") exitWith {};

player say3D "lh_news_flash";

_temp = format ["%2%3<br/><br/>Nachricht gesendet von: %1",_sender,"<t size='6.7'><img image='core\textures\icons\misc\newsflashLH.paa'/></t><br/><br/>",_message];
hint parseText _temp;

systemChat format ["Channel 7 News: %1 Nachricht gesendet von: %2",_message,_sender];