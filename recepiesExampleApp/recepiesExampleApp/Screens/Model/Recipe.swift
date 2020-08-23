//
//  Recipe.swift
//  recepiesExampleApp
//
//  Created by Maria Eduarda Casanova Nascimento on 14/08/20.
//  Copyright © 2020 Maria Eduarda. All rights reserved.
//

import Foundation

class Recipe: Identifiable {
    var id: UUID
    
    var name: String
    var timeInMinutes: Int
    var serves: Int
    var isFavorited: Bool
    
    var ingredients: String
    var preparationMode: String
    
    var imageName: String
    var imageDescription: String
    
    init(name: String,
    timeInMinutes: Int,
    serves: Int,
    isFavorited: Bool,
    ingredients: String,
    preparationMode: String,
    imageName: String,
    imageDescription: String) {
        self.id = UUID()
        self.name = name
        self.timeInMinutes = timeInMinutes
        self.serves = serves
        self.isFavorited = isFavorited
        self.ingredients = ingredients
        self.preparationMode = preparationMode
        self.imageName = imageName
        self.imageDescription = imageDescription
    }
    #if DEBUG

    static let pancakes: Recipe =
        Recipe(name: "Panquecas com mel",
                 timeInMinutes: 20,
                 serves: 2,
                 isFavorited: false,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "pancakes",
                 imageDescription: "")
    
    static let eggs: Recipe =
        Recipe(name: "Ovo mexido com ricota",
                 timeInMinutes: 10,
                 serves: 1,
                 isFavorited: true,
                 ingredients: "",
                 preparationMode: "",
                 imageName: "eggs",
                 imageDescription: "")
    
    static let falafel: Recipe =
    Recipe(name: "Falafel",
             timeInMinutes: 45,
             serves: 6,
             isFavorited: false,
             ingredients: "• 1 ¼ de xícara (chá) de grão-de-bico seco (250 g) \n• ½ cebola \n• ¼ de xícara (chá) de folhas de salsinha (+/- 8 ramos) \n• ¼ de xícara (chá) de folhas de coentro (+/- 8 ramos) \n• 1 dente de alho \n• 1 colher (chá) de cominho em pó \n• 1 colher (chá) de pimenta síria \n• ¼ de colher (chá) de canela em pó \n• 1 colher (chá) de semente de coentro \n• 1 ½ colher (chá) de sal \n• ½ colher (chá) de bicarbonato de sódio em pó \n• 1 ½ colher (sopa) de farinha de trigo \n• noz-moscada ralada na hora a gosto \n• pimenta-do-reino moída na hora a gosto \n• 500 ml de óleo para fritar",
             preparationMode: "1)Numa tigela grande, coloque os grãos-de-bico, cubra com bastante água e deixe de molho por 24 horas.  \n 2) Passe os grãos-de-bico demolhados por uma peneira e deixe escorrer bem a água. Abra um pano de prato limpo sobre a bancada e seque bem os grãos-de-bico – é importante que os grãos estejam bem sequinhos para não umedecer a massa, evitando que os bolinhos quebrem ao fritar. \n \n3) Descasque e corte a cebola em 4 pedaços. Descasque o dente de alho. Lave e seque bem a salsinha e o coentro. \n \n 4) No processador, coloque a cebola, o alho, a salsinha e o coentro. Processe por 1 minuto, para triturar bem. Junte metade do grão de bico, o sal e as especiarias e bata bem por 5 minutos, até formar uma pasta – na metade do tempo, pare de bater e misture com uma espátula para que tudo fique bem misturado.\n \n 5) Adicione a outra metade do grão-de-bico, e bata novamente por 1 minuto – a ideia é que os grãos sejam processados mas ainda tenham pedacinhos. \n \n 6) Coloque o óleo numa panela de borda alta (se preferir, utilize uma wok) e leve ao fogo médio para aquecer. Enquanto isso, forre uma travessa com papel toalha. Transfira a massa de falafel para uma tigela, junte o bicarbonato, a farinha de trigo e misture bem. \n \n 7) Para modelar cada falafel, utilize uma colher de sopa medidora: pressione uma porção de massa na colher, apertando bem para deixar a massa compacta e nivelar; aproxime do óleo e, com a ponta de uma colherinha, transfira o bolinho para o óleo quente. Abaixe o fogo e coloque até 5 bolinhos de uma vez. Deixe fritar por cerca de 1 minuto e meio até dourar, mexendo de vez em quando com uma escumadeira. Atenção: se o óleo estiver muito quente os bolinhos queimam por fora e ficam crus por dentro.\n \n 8) Com a escumadeira, transfira os bolinhos fritos para a travessa com papel toalha e repita com o restante da massa. Sirva a seguir, com molho de tahine.",
             imageName: "falafel",
             imageDescription: "Um prato branco com 6 falafels fritos")
    
    static let salad: Recipe =
    Recipe(name: "Salada Cesar",
             timeInMinutes: 25,
             serves: 4,
             isFavorited: true,
             ingredients: "",
             preparationMode: "",
             imageName: "salad",
             imageDescription: "")
    
    static let quiche: Recipe =
    Recipe(name: "Quiche de alho póro com ricota",
             timeInMinutes: 60,
             serves: 8,
             isFavorited: false,
             ingredients: "",
             preparationMode: "",
             imageName: "quiche",
             imageDescription: "")
    
    static let lasagna: Recipe =
    Recipe(name: "Lasanha bolonhesa",
             timeInMinutes: 40,
             serves: 5,
             isFavorited: false,
             ingredients: "",
             preparationMode: "",
             imageName: "lasagna",
             imageDescription: "")
    
    static let breakfast = [Recipe.pancakes,Recipe.eggs]
    static let popular = [Recipe.falafel,Recipe.salad,Recipe.quiche,Recipe.lasagna]
    
    #endif
}
