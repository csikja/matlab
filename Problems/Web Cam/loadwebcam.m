%%
% Supported formats for 'winvideo'
% YUY2_Resolution, where Resolution can be: imaqhwinfo.DeviceInfo.SupportedFormats
%
% 1024x768
% 1280x1024, 1280x720
% 1600x1200, 1600x904
% 176x144, 320x240, 640x480


Cam = imaqhwinfo('winvideo');

SP = Cam.DeviceInfo.SupportedFormats;

clc
disp('Available resolutions')
disp('---------------------')
for i = 1:length(SP)
    disp([num2str(i), '. ' , SP{i}((find(SP{i}=='_')+1):end)])
end
    R = input('Please choose resolution: ');

VideoObj = videoinput('winvideo', 1, SP{R});