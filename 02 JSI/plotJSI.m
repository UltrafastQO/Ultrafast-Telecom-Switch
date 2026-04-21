%% SOURCE CHARAC - JSI

clear all; close all; clc;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
  cd(fileparts(matlab.desktop.editor.getActiveFilename));
end

%%
summedCorrs = zeros(250,250);

% Here, we measure the 2D timing histogram between the signal and idler
% Note that we use a 2-element detector, which acts as splitting our
% measurement into two detection channels, so we simply sum them here. 
% We measure 35 scans, which can allow for statistical analysis, but here
% we simply sum the counts for the JSI. 
for i = 1:1:35
    filename = strcat('scan', num2str(i), '.mat');
    load(filename)
    
    corrsBothDet = corrs2D_det3+corrs2D_det4;
    
    summedCorrs = summedCorrs + corrsBothDet;

end

%%

% Convert timestamp to wavelength
x = 1:1:250; % range of bin number for TOF measurement
timestamp = x*1000;
wavelengthX = -timestamp/1029+1673;
wavelengthY = -timestamp/1029+1673;

% Plot JSI
figure(1)
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);

surf(wavelengthX,wavelengthY,summedCorrs/600,'EdgeColor','none')
% surf(summedCorrs,'EdgeColor','none')
view(2)
xlim([1500 1600])
ylim([1500 1600])
caxis([0 950/600])
colormap(slanCM('viridis'));
% set(gca,'ColorScale','log')
ylabel('\lambda_{signal}')
xlabel('\lambda_{idler}')
colorbar

set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);
