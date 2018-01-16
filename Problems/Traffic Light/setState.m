function setState(light_handle, state)

lights = get(light_handle, 'Children');
lights = lights((end-1):-1:1);


set(lights(1), 'FaceColor', state(1)*[1, 0, 0])
set(lights(2), 'FaceColor', state(2)*[1, 0.6, 0])
set(lights(3), 'FaceColor', state(3)*[0, 0.6, 0])

set(light_handle, 'UserData', state)

end