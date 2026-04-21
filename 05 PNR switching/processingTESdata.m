%% PLOT 2D HISTOGRAMS SNSPDs

clear all; close all; clc;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
  cd(fileparts(matlab.desktop.editor.getActiveFilename));
end

load("PNRswitching.mat"); % Data collected with TESs

%% Calculate mean and avg of each photon number combination
P01avg = mean(P01./(P01+P10));
P01std = std(P01./(P01+P10));
P02avg = mean(P02./(P02+P20+P11));
P02std = std(P02./(P02+P20+P11));
P03avg = mean(P03./(P03+P30+P12+P21));
P03std = std(P03./(P03+P30+P12+P21));
P04avg = mean(P04./(P04+P40+P13+P22+P31));
P04std = std(P04./(P04+P40+P13+P22+P31));
P05avg = mean(P05./(P05+P50+P14+P23+P32+P41));
P05std = std(P05./(P05+P50+P14+P23+P32+P41));
P06avg = mean(P06./(P06+P60+P15+P24+P33+P42+P51));
P06std = std(P06./(P06+P60+P15+P24+P33+P42+P51));

P10avg = mean(P10./(P01+P10));
P10std = std(P10./(P01+P10));
P11avg = mean(P11./(P02+P20+P11));
P11std = std(P11./(P02+P20+P11));
P12avg = mean(P12./(P03+P30+P12+P21));
P12std = std(P12./(P03+P30+P12+P21));
P13avg = mean(P13./(P04+P40+P13+P22+P31));
P13std = std(P13./(P04+P40+P13+P22+P31));
P14avg = mean(P14./(P05+P50+P14+P23+P32+P41));
P14std = std(P14./(P05+P50+P14+P23+P32+P41));
P15avg = mean(P15./(P06+P60+P15+P24+P33+P42+P51));
P15std = std(P15./(P06+P60+P15+P24+P33+P42+P51));

P20avg = mean(P20./(P02+P20+P11));
P20std = std(P20./(P02+P20+P11));
P21avg = mean(P21./(P03+P30+P12+P21));
P21std = std(P21./(P03+P30+P12+P21));
P22avg = mean(P22./(P04+P40+P13+P22+P31));
P22std = std(P22./(P04+P40+P13+P22+P31));
P23avg = mean(P23./(P05+P50+P14+P23+P32+P41));
P23std = std(P23./(P05+P50+P14+P23+P32+P41));
P24avg = mean(P24./(P06+P60+P15+P24+P33+P42+P51));
P24std = std(P24./(P06+P60+P15+P24+P33+P42+P51));

P30avg = mean(P30./(P03+P30+P12+P21));
P30std = std(P30./(P03+P30+P12+P21));
P31avg = mean(P31./(P04+P40+P13+P22+P31));
P31std = std(P31./(P04+P40+P13+P22+P31));
P32avg = mean(P32./(P05+P50+P14+P23+P32+P41));
P32std = std(P32./(P05+P50+P14+P23+P32+P41));
P33avg = mean(P33./(P06+P60+P15+P24+P33+P42+P51));
P33std = std(P33./(P06+P60+P15+P24+P33+P42+P51));

P40avg = mean(P40./(P04+P40+P13+P22+P31));
P40std = std(P40./(P04+P40+P13+P22+P31));
P41avg = mean(P41./(P05+P50+P14+P23+P32+P41));
P41std = std(P41./(P05+P50+P14+P23+P32+P41));
P42avg = mean(P42./(P06+P60+P15+P24+P33+P42+P51));
P42std = std(P42./(P06+P60+P15+P24+P33+P42+P51));

P50avg = mean(P50./(P05+P50+P14+P23+P32+P41));
P50std = std(P50./(P05+P50+P14+P23+P32+P41));
P51avg = mean(P51./(P06+P60+P15+P24+P33+P42+P51));
P51std = std(P51./(P06+P60+P15+P24+P33+P42+P51));

P60avg = mean(P60./(P06+P60+P15+P24+P33+P42+P51));
P60std = std(P60./(P06+P60+P15+P24+P33+P42+P51));

%%
tau = (delay-0.91)*10^(-3)*2/3e8*10^12; % delay in ps

figure('Position', [100, 100, 1400, 800]); 
set(gcf,'color','w');
a=axes();
box on
set(a,'FontSize', 18, 'LineWidth',3);

subplot(2,3,1)
errorbar(tau, P01avg, P01std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P10avg, P10std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
ylabel('\eta')
legend('P_{0,1}','P_{1,0}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);

subplot(2,3,2)
errorbar(tau, P02avg, P02std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P20avg, P20std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P11avg, P11std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
legend('P_{0,2}','P_{2,0}','P_{1,1}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);

subplot(2,3,3)
errorbar(tau, P03avg, P03std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P30avg, P30std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P12avg, P12std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P21avg, P21std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
legend('P_{0,3}','P_{3,0}','P_{1,2}','P_{2,1}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);

subplot(2,3,4)
errorbar(tau, P04avg, P04std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P40avg, P40std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P13avg, P13std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P31avg, P31std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P22avg, P22std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
xlabel('Delay (ps)')
ylabel('\eta')
legend('P_{0,4}','P_{4,0}','P_{1,3}','P_{3,1}','P_{2,2}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);

subplot(2,3,5)
errorbar(tau, P05avg, P05std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P50avg, P50std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P14avg, P14std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P41avg, P41std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P23avg, P23std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P32avg, P32std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
xlabel('Delay (ps)')
legend('P_{0,5}','P_{5,0}','P_{1,4}','P_{4,1}','P_{2,3}','P_{3,2}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);

subplot(2,3,6)
errorbar(tau, P06avg, P06std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P60avg, P60std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P15avg, P15std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P51avg, P51std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P24avg, P24std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P42avg, P42std, '.', 'MarkerSize',8)
hold on
errorbar(tau, P33avg, P33std, '.', 'MarkerSize',8)
hold on
xlim([-2 2])
ylim([0 1])
xlabel('Delay (ps)')
legend('P_{0,6}','P_{6,0}','P_{1,5}','P_{5,1}','P_{2,4}','P_{4,2}','P_{3,3}')
set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);


