
params [
	["_skill","",[""]]
];

if (_skill isEqualTo "") exitWith {};

private _success = false;
private _has = _skill in AN_Skills;

if !(_has) then
{
    AN_Skills pushBack _skill;
	_success = true;
};

_success
