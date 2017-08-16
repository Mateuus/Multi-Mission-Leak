private["_haystack","_needle","_result","_i","_q"];
_haystack = _this select 0;
_needle = _this select 1;
_result = -1;
try
{
	for "_i" from 0 to ((count _haystack) -1) do
	{
		_q = (_haystack select _i) find _needle;
		if (_q != -1) then
		{
			throw _i;
		};
	};
}
catch
{
	_result = _exception;
};
_result
