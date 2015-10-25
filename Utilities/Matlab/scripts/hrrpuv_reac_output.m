% McDermott
% 10-22-2015
% hrrpuv_reac_output.m

close all
clear all

datadir = '../../Verification/Species/';

% single reaction

M = importdata([datadir,'hrrpuv_reac_single_devc.csv'],',',2);

t_single = M.data(:,1);
q_single = M.data(:,2);
q1 = M.data(:,3);

figure
plot_style

hh(1)=plot(t_single,q_single,'ko'); hold on
hh(2)=plot(t_single,q1,'k--');

axis([0 1.1 0 10^4])

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)

xlabel('{\it t} (s)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
ylabel('{\it q} (kW/m^3)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
lh=legend(hh,'HRRPUV','{\it q} R1','location','northwest');
set(lh,'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
legend('boxoff')

% add Git version if file is available

Git_Filename = [datadir,'hrrpuv_reac_single_git.txt'];
addverstr(gca,Git_Filename,'linear')

% print to pdf
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf','../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/hrrpuv_reac_single')

% check errors
err = abs(q_single(end)-q1(end))/abs(q_single(end));
if err > 1e-6
   display(['Matlab Warning: hrrpuv_reac_single is out of tolerance. Error = ',num2str(err)])
end

% parallel reactions (two fuels)

M = importdata([datadir,'hrrpuv_reac_parallel_devc.csv'],',',2);

t_parallel = M.data(:,1);
q_parallel = M.data(:,2);
q1 = M.data(:,3);
q2 = M.data(:,4);

figure
plot_style
clear hh
hh(1)=plot(t_parallel,q_parallel,'ko'); hold on
hh(2)=plot(t_parallel,q1,'b+--');
hh(3)=plot(t_parallel,q2,'rx--');
hh(4)=plot(t_parallel,q1+q2,'k--');

axis([0 1.1 0 10^4])

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)

xlabel('{\it t} (s)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
ylabel('{\it q} (kW/m^3)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
lh=legend(hh,'HRRPUV','{\it q} R1','{\it q} R2','{\it q} R1 + {\it q} R2','location','northwest');
set(lh,'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
legend('boxoff')

% add Git version if file is available

Git_Filename = [datadir,'hrrpuv_reac_parallel_git.txt'];
addverstr(gca,Git_Filename,'linear')

% print to pdf
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf','../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/hrrpuv_reac_parallel')

% check errors
err = abs(q_parallel(end)-(q1(end)+q2(end)))/abs(q_parallel(end));
if err > 1e-6
   display(['Matlab Warning: hrrpuv_reac_parallel is out of tolerance. Error = ',num2str(err)])
end

% parallel reactions (two products)

M = importdata([datadir,'hrrpuv_reac_parallel_2_devc.csv'],',',2);

t_parallel_2 = M.data(:,1);
q_parallel_2 = M.data(:,2);
q1 = M.data(:,3);
q2 = M.data(:,4);

figure
plot_style
clear hh
hh(1)=plot(t_parallel_2,q_parallel_2,'ko'); hold on
hh(2)=plot(t_parallel_2,q1,'b+--');
hh(3)=plot(t_parallel_2,q2,'rx--');
hh(4)=plot(t_parallel_2,q1+q2,'k--');

axis([0 1.1 0 10^4])

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)

xlabel('{\it t} (s)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
ylabel('{\it q} (kW/m^3)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
lh=legend(hh,'HRRPUV','{\it q} R1','{\it q} R2','{\it q} R1 + {\it q} R2','location','northwest');
set(lh,'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
legend('boxoff')

% add Git version if file is available

Git_Filename = [datadir,'hrrpuv_reac_parallel_2_git.txt'];
addverstr(gca,Git_Filename,'linear')

% print to pdf
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf','../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/hrrpuv_reac_parallel_2')

% check errors
err = abs(q_parallel_2(end)-(q1(end)+q2(end)))/abs(q_parallel_2(end));
if err > 1e-6
   display(['Matlab Warning: hrrpuv_reac_parallel_2 is out of tolerance. Error = ',num2str(err)])
end

% series reactions

M = importdata([datadir,'hrrpuv_reac_series_devc.csv'],',',2);

t_series = M.data(:,1);
q_series = M.data(:,2);
q1 = M.data(:,3);
q2 = M.data(:,4);
q3 = M.data(:,5);

figure
plot_style
clear hh
hh(1)=plot(t_series,q_series,'ko'); hold on
hh(2)=plot(t_series,q1,'b+--');
hh(3)=plot(t_series,q2,'rx--');
hh(4)=plot(t_series,q3,'g^--');
hh(5)=plot(t_series,q1+q2+q3,'k--');

axis([0 2.1 0 5000])

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)

xlabel('{\it t} (s)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
ylabel('{\it q} (kW/m^3)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
lh=legend(hh,'HRRPUV','{\it q} R1','{\it q} R2','{\it q} R3','{\it q} R1 + {\it q} R2 + {\it q} R3','location','northwest');
set(lh,'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
legend('boxoff')

% add Git version if file is available

Git_Filename = [datadir,'hrrpuv_reac_series_git.txt'];
addverstr(gca,Git_Filename,'linear')

% print to pdf
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf','../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/hrrpuv_reac_series')

% check errors
err = abs(q_series(end)-(q1(end)+q2(end)+q3(end)))/abs(q_parallel_2(end));
if err > 1e-6
   display(['Matlab Warning: hrrpuv_reac_series is out of tolerance. Error = ',num2str(err)])
end

% compare total heat release curves

figure
plot_style
clear hh
hh(1)=plot(t_single,q_single,'ko--'); hold on
hh(2)=plot(t_parallel,q_parallel,'b+--');
hh(3)=plot(t_parallel_2,q_parallel_2,'rx--');

axis([0 1.1 0 13000])

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)

xlabel('{\it t} (s)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
ylabel('{\it q} (kW/m^3)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
lh=legend(hh,'single','parallel','parallel 2','location','northwest');
set(lh,'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter,'Fontname',Font_Name)
legend('boxoff')

% add Git version if file is available

Git_Filename = [datadir,'hrrpuv_reac_single_git.txt'];
addverstr(gca,Git_Filename,'linear')

% print to pdf
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'PaperPosition',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf','../../Manuals/FDS_User_Guide/SCRIPT_FIGURES/hrrpuv_reac_comp')




