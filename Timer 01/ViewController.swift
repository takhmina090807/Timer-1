//
//  ViewController.swift
//  Timer 01
//
//  Created by Тахмина on 15/12/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    override func viewDidLoad() {
            super.viewDidLoad()
            startDatePicker.datePickerMode = .dateAndTime
                    endDatePicker.datePickerMode = .dateAndTime
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "toTimerScreen" {
                    guard let timerVC = segue.destination as? TimerViewController else { return }
                    timerVC.startDate = startDatePicker.date
                    timerVC.endDate = endDatePicker.date
                }
            }
    }


