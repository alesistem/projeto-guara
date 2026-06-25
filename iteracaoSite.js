// Aba de configuracoes do user
const botaoExplore = document.querySelector('.explore__rodape--button');
const abaConfiguracoes = document.querySelector('.configuracoes');
const abaPrincipal = document.querySelector('.principal')

botaoExplore.addEventListener('click', function() {

    if (abaConfiguracoes.style.display === 'none') {
        abaConfiguracoes.style.display = 'revert';
        abaPrincipal.style.width = '75%';
    } else {
        abaConfiguracoes.style.display = 'none';
        abaPrincipal.style.width = '100%';
        abaPrincipal.style.transition = '0.3s';
    }

});

