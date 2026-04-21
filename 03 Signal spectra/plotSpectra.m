%% PLOT SIGNAL SPECTRA FROM TOF SNSPDs

clear all; close all; clc;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
  cd(fileparts(matlab.desktop.editor.getActiveFilename));
end


switchedSpec = readmatrix('switchedSpec.txt');
unswitchedSpec = readmatrix('unswitchedSpec.txt');

% Plot switched and unswitched signal spectra
figure(1)
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);

% Here, we smooth the spectral data
plot(switchedSpec(:,1),smoothdata(switchedSpec(:,2)/10,"movmean",15),'.','MarkerSize',8) % Note division by 10s integration time
hold on
plot(unswitchedSpec(:,1),smoothdata(unswitchedSpec(:,2)/10,"movmean",15),'.','MarkerSize',8) % Note division by 10s integration time
hold on
xlim([1525 1575])

legend('Switched','Unswitched')
xlabel('Wavelength (nm)')
ylabel('Counts')

set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);
