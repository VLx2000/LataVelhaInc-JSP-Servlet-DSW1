/*let TAM = 5

function cardCarros() {
    for (let i = 0; i < TAM; i++) {
        // Seleciona o elemento no DOM
        var cards = document.getElementById('carros'),

            // String de texto
            HTMLNovo =
                    '<section class="box">' +
                        '<div class="card">' +
                            '<div class="container">' +
                                '<img src="imagens/fiat.jpg" alt="fiat">' +
                            '</div>' +
                            '<ul class="dadosCarro">' +
                                '<li class="modelo">' +
                                    '${veiculo.modelo}' +
                                '</li>' +
                                '<li>' +
                                    'Loja: ${veiculo.loja.nome}' +
                                '</li>' +
                                '<li>' +
                                    'Uso: ${veiculo.quilometragem}' +
                                '</li>' +
                                '<li class="oferta">' +
                                    '${veiculo.valor}' +
                                '</li>' +
                            '</ul>' +
                        '</div>' +
                    '</section>';

        // Insere o texto depois do conteúdo section do elemento (carros)
        cards.insertAdjacentHTML('beforeend', HTMLNovo);
    }
}*/

setInterval(function filtro() {
    var filtrar = document.getElementById('filtro')
    var modelos = document.querySelectorAll('.modelo')
    var cards = document.querySelectorAll('.box')
    for (let i = 0; i < cards.length; i++) {
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
}, 100)

//window.onload = cardCarros;