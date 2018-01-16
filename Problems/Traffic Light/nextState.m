function nextState(h, varargin)

switch nargin
    case 1
        light_handle = h;
    case 2
        light_handle = varargin{1};
end

state = sprintf('%i', get(light_handle, 'UserData'));
switch state
    case '100'
        newState = [0, 1, 0];
    case '010'
        newState = [0, 0, 1];
    case '001'
        newState = [0, 1, 1];
    case '011'
        newState = [1, 0, 0];
    otherwise
        newState = [1, 0, 0];
end

setState(light_handle, newState)

end