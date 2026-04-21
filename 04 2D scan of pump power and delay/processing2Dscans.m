%% PLOT 2D HISTOGRAMS SNSPDs

clear all; close all; clc;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
  cd(fileparts(matlab.desktop.editor.getActiveFilename));
end

%%

switchEff = [];


for i = 2:1:28
    filename = strcat('power', num2str(i), '.mat'); % load delay scans at each power
    load(filename)
    
    powers(i) = currPow;
    
    Vport = permute(sum(histoV(195:225,190:220,:),1:2),[3 2 1]); % Sum over one-photon events
    Hport = permute(sum(histoH(195:225,205:235,:),1:2),[3 2 1]); % Sum over one-photon events
    
    switchEff(i,:) = Vport./(Vport+Hport); % calculate switch efficiency
    err_switchEff(i,:) = sqrt(Hport.*Vport./(Hport+Vport).^3); % extract error bars on effiicency

end

tau = (delayStage-0.9)*10^(-3)*2/3e8*10^12; % delay in ps

energy = powers*10^(-3)/200e3*10^9; % pump pulse energy

% Plot 2D delay and power scan
figure(1)
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);

surf(tau,energy,switchEff)
xlabel('Delay (ps)')
ylabel('Pump Pulse Energy (nJ)')
view(2)
shading interp
xlim([-2 2])
ylim([0 12])
colorbar 
% caxis([0 1])

set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);


%%

delayTrace = [switchEff(18,:).' err_switchEff(18,:).'];
powerTrace = [switchEff(:,41) err_switchEff(:,41)];

% Plot power dependence at optimized delay
figure(2)
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);
errorbar(powers, powerTrace(:,1),powerTrace(:,2),'k.','MarkerSize',8)
xlabel('Pump Pulse Energy (nJ)')
ylabel('Switching Efficiency')

set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);


% Plot delay dependence at optimized power
figure(3)
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);
errorbar(tau, delayTrace(:,1),delayTrace(:,2),'k.','MarkerSize',8)
xlabel('Delay (ps)')
ylabel('Switching Efficiency')

set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);