//
//  ViewController.swift
//  Jogo da Velha
//
//  Created by Wladimir Teixeira Neto on 1/25/16.
//  Copyright © 2016 Wladimir Teixeira Neto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        // Player 1  OH
        // Player 2  EX
    
    var activePlayer = 1
    var jogadas = 0
    var gameactive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
     // 0 ninguem clicou
    var combinacaovencedora = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    // 0 ninguem clicou
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var labelVez: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBAction func buttonResetPressed(sender: AnyObject) {
        activePlayer = 1
        jogadas = 0
        gameactive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        labelVez.text = "Vez do Player 1 - Bolinha"
        buttonReset.hidden = true
        
        var button: UIButton
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton   //pega o objeto da view
            button.setImage(nil, forState: .Normal)
        }
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState [sender.tag] == 0 && gameactive == true{
            var image = UIImage ()
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                image = UIImage (named: "oh.png")!
                activePlayer = 2
                jogadas = jogadas + 1
                labelVez.text = "Vez do Player 2 - Cruzinha"
                
            } else {
                
                image = UIImage (named: "ex.png")!
                activePlayer = 1
                jogadas = jogadas + 1
                labelVez.text = "Vez do Player 1 - Bolinha"
                
            }
            
            sender.setImage(image, forState: .Normal) //sender é qual imagem mandou
            for x in combinacaovencedora {
                if gameState[x[0]] != 0 && gameState[x[0]] == gameState[x[1]] && gameState[x[1]] == gameState[x[2]]{
                    labelVez.text = " Player \(gameState[x[0]]) é o vencedor!"
                    gameactive = false
                    buttonReset.hidden = false
                } 
            }
            if jogadas == 9 && gameactive != false {
                labelVez.text = "Empate"
                gameactive = false
                buttonReset.hidden = false
            }
            
            
        }
        
        
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonReset.hidden = true
        labelVez.text = "Vez do Player 1 - Bolinha"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

