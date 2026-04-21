%% SOURCE CHARAC DATA

clear all; close all; clc;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
  cd(fileparts(matlab.desktop.editor.getActiveFilename));
end

%%
load("jointPNRdata.mat");

tic
for pows=1:1:17
    ind1=1;
    ind2=1000000;
    ind2=ind1+999;
    for ii=1:1000000/1000 % Breaking up the photon number counts into chunks for statistical analysis
        idlerChunk = idlerPhoton(ind1:ind2,pows);
        signalChunk = signalPhoton(ind1:ind2,pows);
        
        meanIdler(ii) = mean(idlerChunk);
        meanSignal(ii) = mean(signalChunk);
        
        maxNum=11;
        for i=1:1:maxNum+1 % searching for photon numbers up to 10
            for j=1:1:maxNum+1
                idlerInd = find(idlerChunk==i-1);
                signalInd = find(signalChunk==j-1);
                
                probs(i,j) = length(intersect(idlerInd,signalInd));
                
                % writematrix(probs,'jointPNR_TES_matrix_10mW.txt','Delimiter','space') % Data written to txt file, for plotting in Mathematica
            end
        end
        ind1=ind2+1;
        ind2=ind1+999;

    end
    
    mean_num_idler_avg(pows) = mean(meanIdler);
    mean_num_signal_avg(pows) = mean(meanSignal);
    mean_num_idler_std(pows) = std(meanIdler);
    mean_num_signal_std(pows) = std(meanSignal);
    toc
    
    % Plot joint PNR distribution
    n_i = 0:1:11;
    n_s = 0:1:11;
    
    figure(pows)
    set(gcf,'color','w');
    a=axes();
    box on
    set(a,'FontSize', 18, 'LineWidth',3);
    
    surf(n_s,n_i,probs,'EdgeColor','none')
    view(2)
    xlabel("n_s")
    ylabel("n_i")
    xlim([0 8])
    ylim([0 8])
    
    set(findobj(gcf,'type','axes'),'FontSize',18,'LineWidth', 2);
end
