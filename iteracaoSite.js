// Aba de configuracoes do user
<<<<<<< HEAD
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
=======
const botaoExplore = document.getElementsByClassName('explore__rodape--button');
const abaConfiguracoes = document.getElementsByClassName('configuracoes');
const abaPrincipal = document.getElementsByClassName('principal')

botaoExplore[0].addEventListener('click', function() {

    if (abaConfiguracoes[0].style.display === 'none') {
        abaConfiguracoes[0].style.display = 'revert';
        abaPrincipal[0].style.width = '75%';
    } else {
        abaConfiguracoes[0].style.display = 'none';
        abaPrincipal[0].style.width = '100%';
        abaPrincipal[0].style.transition = '0.3s';
>>>>>>> ff560471f115a289ca6114b73a02595c4a0cada5
    }

});

