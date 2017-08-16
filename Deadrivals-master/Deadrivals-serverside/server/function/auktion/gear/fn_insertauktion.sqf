private["_handler","_thread","_queryResult","_query","_alias","_moneyciv","_bankciv","_moneycop","_bankcop","_moneymedic","_bankmedic","_moneymedic","_bankmedic","_moneyeast","_bankeast","_querySkill"]; 
_item = [_this,0,"",[""]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_name = [_this,2,"",[""]] call BIS_fnc_param; 
_preis = [_this,3,0,[0]] call BIS_fnc_param; 
_ownerID = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
_sting = ""; 
 
_query = format["INSERT INTO auctionhouse SET item = '%1', verkauferuid = '%2', verkaufername = '%3', kauferuid = '-1', kaufername = '%4', preis = '%5'",_item,_uid,_name,_sting,_preis]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_auctions_inserate = "ready"; 
_ownerID publicVariableClient "NOCRIS_auctions_inserate"; 
 
