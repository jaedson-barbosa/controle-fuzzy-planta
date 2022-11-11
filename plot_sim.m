function plot_sim(file_name,tsim)
    % Importamos variaveis globais
    global data_aberto data_fuzzy data_pid target

    % Grafico geral
    current = figure;
    hold on
    grid
    xlabel('tempo (s)')
    plot(data_aberto.y.Time,data_aberto.y.Data,'c')
    plot(data_pid.y.Time,data_pid.y.Data,'b')
    plot(data_fuzzy.y.Time,data_fuzzy.y.Data,'g')
    plot(target.Time,target.Data,'m')
    xlim([0 tsim])
    legend('aberto','pid','fuzzy','target')
    saveas(current,['fig/' file_name '.png'])
    close(current)

    % Grafico do aberto
    current = figure;
    hold on
    grid
    xlabel('tempo (s)')
    plot(data_aberto.controle.Time,data_aberto.controle.Data,'c')
    plot(data_aberto.de.Time,data_aberto.de.Data,'b')
    plot(data_aberto.e.Time,data_aberto.e.Data,'g')
    plot(data_aberto.y.Time,data_aberto.y.Data,'m')
    xlim([0 tsim])
    legend('controle','de/dt','erro','y')
    saveas(current,['fig/' file_name '_aberto.png'])
    close(current)

    % Grafico do fuzzy
    current = figure;
    hold on
    grid
    xlabel('tempo (s)')
    plot(data_fuzzy.controle.Time,data_fuzzy.controle.Data,'c')
    plot(data_fuzzy.de.Time,data_fuzzy.de.Data,'b')
    plot(data_fuzzy.e.Time,data_fuzzy.e.Data,'g')
    plot(data_fuzzy.y.Time,data_fuzzy.y.Data,'m')
    xlim([0 tsim])
    legend('controle','de/dt','erro','y')
    saveas(current,['fig/' file_name '_fuzzy.png'])
    close(current)

    % Grafico do pid
    current = figure;
    hold on
    grid
    xlabel('tempo (s)')
    plot(data_pid.controle.Time,data_pid.controle.Data,'c')
    plot(data_pid.de.Time,data_pid.de.Data,'b')
    plot(data_pid.e.Time,data_pid.e.Data,'g')
    plot(data_pid.y.Time,data_pid.y.Data,'m')
    xlim([0 tsim])
    ylim([-2 2])
    legend('controle','de/dt','erro','y')
    saveas(current,['fig/' file_name '_pid.png'])
    close(current)
end