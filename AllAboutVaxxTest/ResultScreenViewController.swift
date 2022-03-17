//
//  ResultScreenViewController.swift
//  AllAboutVaxxTest
//
//  Created by Derrick Duller on 2/19/22.
//

import UIKit

class ResultScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (scoring == 4) {
            labeling.text = "Congratulations.\n You can enter the building."
            QuizResult.text = "The user has answered the following questions correctly.\n\n 1) Have you experienced any symptoms of COVID-19, including a fever of 100.0 degrees F or greater, a new cough, new loss of taste or smell or shortness of breath within the past 10 days?  (NO).\n\n  2) In the past 10 days, have you gotten a positive result from a COVID-19 test that tested saliva or used a nose or throat swab? (not a blood test)  (NO).\n\n 3)To the best of your knowledge, in the past 14 days, have you been in close contact (within 6 feet for at least 10 minutes) with anyone who tested positive for COVID-19 or who has or had symptoms of COVID-19?  (NO).\n\n 4) Have you traveled internationally or from a state with widespread community transmission of COVID-19 per the New York State Travel Advisory in the past 14 days? (NO)"
            HealthScreeningCheck.image = UIImage(named: "CheckMark")
            
        }
        else {
            labeling.text = "You cannot enter the building."
            QuizResult.text = "It looks you have answered 1 or more questions wrong. Please, click on the return button to take the quiz again. Thanks! "
            HealthScreeningCheck.image = UIImage(named: "XMark")
        }        // Do any additional setup after loading the view.
    }
    
    var scoring = 0
    
    @IBOutlet weak var HealthScreeningCheck: UIImageView!
    
    @IBOutlet weak var labeling: UILabel!
    
    @IBOutlet weak var QuizResult: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
