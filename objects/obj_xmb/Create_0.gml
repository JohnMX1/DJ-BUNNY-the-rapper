global.pause = false;
//the y position
xbar = 0;
//the x position
ybar = 0;

//yes I fucked that up

is_in = 0;

ini_open(working_directory+"/mainfiles/config.djbf");
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
		xbar_icons[3] = "Extras";
		ybar_text4[0] = "A ser adicionado";
		ybar_subtext4[0] = "A ser adicionado";
		break;
    default:
        // code here
		show_error("Unsupported Launguage", true);
        break;
}

target_x = 1366;
target_y = 384;
target_angle = 0;
iconx[0] = 0;
icony[0] = 0;
iconx[1] = 0;
icony[1] = 0;
iconx[2] = 0;
icony[2] = 0;
iconx[3] = 0;
icony[3] = 0;

radius = 0;
//the circle
angle[0] = 0;
//the rest is the icons
angle[1] = 45;
angle[2] = 90;
angle[3] = 135;
angle[4] = 180;
tangle[0] = 45;
tangle[1] = 90;
tangle[2] = 135;
tangle[3] = 180;
angle_speed = 2;
image_alpha = 0;
image_alphaa = 0;
icon_alpha = 0;
alpa[0] = 0;
alpa[1] = 0;
alpa[2] = 0;
alpa[3] = 0;
talpa[0] = 0;
talpa[1] = 0;
talpa[2] = 0;
talpa[3] = 0;