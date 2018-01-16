function butt_down(src, evnt)

switch get(gco, 'Tag')
    case 'state1'
        set(gco, 'Tag', 'state2', 'Color', [0, 0, 0.7], 'EdgeColor', 'none');
    case 'state2'
        set(gco, 'Tag', 'state1', 'Color', [0, 0.7, 0], 'EdgeColor', [0, 0, 0]);
    otherwise
        set(gco, 'Tag', 'state1', 'Color', [0, 0.7, 0], 'EdgeColor', [0, 0, 0]);
end

end