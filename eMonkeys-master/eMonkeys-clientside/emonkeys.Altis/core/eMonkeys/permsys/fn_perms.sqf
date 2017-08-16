/*

	returns ALL perms (static perms and dyn perms)

*/

private["_staticperms", "_dynperms"];

_staticperms = call EMonkeys_perms;
_dynperms = EMonkeys_dynperms;

_staticperms + _dynperms;