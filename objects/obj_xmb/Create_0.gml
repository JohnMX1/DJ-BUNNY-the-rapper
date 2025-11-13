global.pause = false;
xbar = 0;
ybar = 0;

ini_open("/mainfiles/config.djbf");
global.language = ini_read_real("GAME", "language", 0);
useramount = ini_read_real("GAME", "useramount", 0);
ini_close();
//0 = English
//1 = Português
//2 >= Crash
switch (global.language) {
	case 1:
		// Usuários LEMBRAR DE MUDAR
		xbar_icons[0] = "Equipe";
		ybar_text1[0] = "Criar Equipe";
		ybar_subtext1[0] = "Faça sua equipe para competir e salvar o progresso no jogo";
		ybar_text1[1] = "(Sem Equipe)";
		ybar_subtext1[1] = "NÃO SALVARÁ PROGRESSO, Uso recomendável para testes.";
		if useramount > 0 {
			for (var i = 0; i < useramount; ++i) {
				if i > 0 {
					ini_open("/mainfiles/config.djbf");
					txt[i] = ini_read_string("GAME", "user"+string(i), "[[EMPTY]]");
					ini_close();
					ybar_text1[1+i] = txt[i];
				}
			}
		}
		
		// Configurações
		xbar_icons[1] = "Configurações";
		ybar_text2[0] = "Acessibilidade";
		ybar_subtext2[0] = "Veja as opções de acessibilidade.";
		ybar_text2[1] = "Controles";
		ybar_subtext2[1] = "Mude os controles do jogo para seu gosto.";
		ybar_text2[2] = "Gráficos";
		ybar_subtext2[2] = "Mude o visual do jogo.";
		ybar_text2[3] = "Áudio";
		ybar_subtext2[3] = "Altere a altura do jogo.";
		ybar_text2[4] = "Língua";
		ybar_subtext2[4] = "Mude a língua para a que mais te agrada. Atualmente está em Português";
		ybar_text2[5] = "Dados Salvos";
		ybar_subtext2[5] = "Apague ou veja os dados salvos.";
		
		//Jogo
		xbar_icons[2] = "Jogos";
		ybar_text3[0] = "DJ BUNNY the rapper";
		ybar_subtext3[0] = "O Único!";
		//Extras
		break;
    default:
        // code here
		show_error("Unsupported Launguage", true);
        break;
}
