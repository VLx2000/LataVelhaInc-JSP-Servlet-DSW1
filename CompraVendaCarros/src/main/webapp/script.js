let TAM = 20

function cardCarros() {
    for (let i = 0; i < TAM; i++){
        // Seleciona o elemento no DOM
        var cards = document.getElementById('carros'),
        
        // String de texto
        HTMLNovo = 
            '<section class="box">' +
                '<div class="card">' +
                    '<img src="imagens/fiat.jpg" alt="fiat">' +
                    '<ul class="dadosCarro">' +
                        '<li>' +
                            'Fiati Luigi' +
                        '</li>' +
                        '<li>' +
                            'Ano: 1800' +
                        '</li>' +
                        '<li>' +
                            'Estado: Velho' +
                        '</li>' +
                        '<li id="oferta">' +
                            '<br>$50.000' +
                        '</li>' +                 
                    '</ul>' +
                '</div>' +
            '</section>';

        // Insere o texto antes do conteúdo atual do elemento
        cards.insertAdjacentHTML('beforeend', HTMLNovo);
    }
}

window.onload = cardCarros;