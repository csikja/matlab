function changeState(obj, ~, tmr)
    if strcmp(get(tmr,'Running'), 'off')
        start(tmr)
    end
end
       