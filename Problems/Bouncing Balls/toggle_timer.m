function toggle_timer(~, ~, timer)
switch get(timer, 'Running')
    case 'on'
        stop(timer)
    case 'off'
        start(timer)
end
end