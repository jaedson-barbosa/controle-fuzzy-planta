function simular(tg,var,tsim,nome)
    global data_aberto data_fuzzy data_pid target variancia

    target = tg;
    variancia = var;
    sim('modelo',tsim)
    plot_sim(nome,tsim)
end