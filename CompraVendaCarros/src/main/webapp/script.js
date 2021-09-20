let TAM = 20

function cardCarros() {
    for (let i = 1; i < TAM; i++) {
        // Seleciona o elemento no DOM
        var cards = document.getElementById('carros'),

            // String de texto
            HTMLNovo =
                '<section class="box">' +
                '<div class="card">' +
                '<img src="imagens/fiat.jpg" alt="fiat">' +
                '<ul class="dadosCarro">' +
                '<li class="modelo">' +
                'Luigi' +
                '</li>' +
                '<li>' +
                'Marca: Fiati' +
                '</li>' +
                '<li>' +
                'Ano: 1800' +
                '</li>' +
                '<li>' +
                'Estado: Velho' +
                '</li>' +
                '<li class="oferta">' +
                '<br>$50.000' +
                '</li>' +
                '</ul>' +
                '</div>' +
                '</section>';

        // Insere o texto antes do conteúdo atual do elemento
        cards.insertAdjacentHTML('beforeend', HTMLNovo);
    }
}

setInterval(function filtro() {
    var filtrar = document.getElementById('filtro')
    var modelos = document.querySelectorAll('.modelo')
    var cards = document.querySelectorAll('.box')
    for (let i = 0; i < TAM; i++) {
        if (filtrar.value == '') {
            cards[i].style = 'display: block;'
        }
        else {
            /*console.log(filtrar.value.toUpperCase())
            console.log(modelos[i].textContent.toUpperCase())*/
            if (filtrar.value.toUpperCase() != modelos[i].textContent.toUpperCase()) {
                cards[i].style = 'display: none;'
            }
            if (filtrar.value.toUpperCase() == modelos[i].textContent.toUpperCase()) {
                cards[i].style = 'display: block;'
            }
        }
    }
}, 1000)

window.onload = cardCarros;