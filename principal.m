% Preparação
clc
clear
close all

global data_aberto data_fuzzy data_pid target variancia

load("target.mat")
target_custom = Group_1.get('custom');
target_step = Group_1.get('step');

% Simulação com parâmetros fornecidos
wn = 3;
ep = 0.7;
Num = wn^2;
Den = [1 2*ep*wn wn^2];

simular(target_step, 0, 4, 'step_puro') % Degrau sem ruído
info_aberto = stepinfo(data_aberto.y.Data,data_aberto.y.Time);
info_fuzzy = stepinfo(data_fuzzy.y.Data,data_fuzzy.y.Time);
info_pid = stepinfo(data_pid.y.Data,data_pid.y.Time);

simular(target_custom, 0, 10, 'custom_puro') % Custom sem ruído
simular(target_step, 0.25, 4, 'step_ruido') % Degrau com ruído
simular(target_custom, 0.25, 10, 'custom_ruido') % Custom com ruído

% Simulação com parâmetros diferentes
wn = 4;
ep = 0.5;
Num = wn^2;
Den = [1 2*ep*wn wn^2];

simular(target_step, 0.25, 4, 'step_puro_1') % Degrau com ruído
info_aberto_1 = stepinfo(data_aberto.y.Data,data_aberto.y.Time);
info_fuzzy_1 = stepinfo(data_fuzzy.y.Data,data_fuzzy.y.Time);
info_pid_1 = stepinfo(data_pid.y.Data,data_pid.y.Time);

simular(target_custom, 0.25, 10, 'custom_ruido_1') % Custom com ruído

% Salvar stepinfos
save('stepinfos', 'info_aberto', 'info_fuzzy', 'info_pid', 'info_aberto_1', 'info_fuzzy_1', 'info_pid_1')

% Impressão de diagramas
open_system('FT.slx');
print -dpng -sFT fig/FT.png;
close_system('FT')
open_system("modelo.slx");
print -dpng -smodelo fig/modelo.png;
close_system('modelo')

% Impressão do fuzzy
fis = readfis('./fuzzy.fis');
current = figure;
plotmf(fis,'input',1)
saveas(current,'fig/fuzzy_input_1.png')
plotmf(fis,'input',2)
saveas(current,'fig/fuzzy_input_2.png')
plotmf(fis,'output',1)
saveas(current,'fig/fuzzy_output.png')
gensurf(fis)
saveas(current,'fig/fuzzy_surface.png')
close(current)