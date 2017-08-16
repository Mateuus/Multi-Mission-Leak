/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Sends a report of RDM to all Admins
*/

private["_from","_killer"];

_from = _this select 0;
_killer = _this select 1;

hint format ["RDM COMPLAINT\n\n%1 claims they were just RDM'd by\n\n%2.",(name _from),_killer];
systemchat format ["RDM COMPLAINT: %1 claims they were just RDM'd by - %2.",(name _from),_killer];