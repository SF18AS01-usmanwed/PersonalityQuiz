//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Ousmane Ouedraogo on 2/7/19.
//  Copyright © 2019 Ousmane Ouedraogo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true;
        calculatePersonalityResult();


        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [AnimalType: Int]();   //dictionary
        let responseTypes: [AnimalType] = responses.map {$0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1;
        }
        
        let frequentAnswersSorted: [(key: AnimalType, value: Int)] = frequencyOfAnswers.sorted {$0.1 > $1.1}
        let mostCommonAnswer: AnimalType = frequentAnswersSorted.first!.key;
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!";
        resultDefinitionLabel.text = mostCommonAnswer.definition;
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
