//
//  ViewController.swift
//  LearningTask-5.3
//
//  Created by rafael.rollo on 12/03/2022.
//

import UIKit

class ContadorViewController: UIViewController {

    @IBOutlet var planoDeFundoView: UIView!
    @IBOutlet weak var numeroLabel: UILabel!
    
    @IBOutlet weak var valorIncrementoLabel: UILabel!
    @IBOutlet weak var incrementoStepper: UIStepper!
    
    var contador: Contador? {
        didSet {
            if isViewLoaded {
                atualizaViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaViews()
    }

    private func atualizaViews() {
        // só é chamado em didSet, então contador! sempre existe
        
        if contador!.ehNegativo() {
            planoDeFundoView.backgroundColor = UIColor(named: "Almond")
        }
        else {
            planoDeFundoView.backgroundColor = UIColor(named: "Satin Linen")
        }
        
        numeroLabel.text = contador!.numeroAtual.description
        valorIncrementoLabel.text = contador!.incremento.description
        
    }
    
    @IBAction func decrementarBotaoPressionado(_ sender: UIButton) {
        contador?.decrementa()
    }
    
    @IBAction func incrementarBotaoPressionado(_ sender: UIButton) {
        contador?.incrementa()
    }
    
    @IBAction func resetBotaoPressionado(_ sender: UIButton) {
        contador?.reinicia()
        
        // ugh isso n parece a solucao certa...
        incrementoStepper.value = 1.0
        
    }
    
    @IBAction func incrementoStepperMudou(_ sender: UIStepper) {
        contador?.mudaIncremento(novoIncremento: Int(incrementoStepper.value))
        valorIncrementoLabel.text = Int(incrementoStepper.value).description
    }
}

