//
//  TimerViewController.swift
//  Timer 01
//
//  Created by Тахмина on 15/12/2024.
//

import UIKit

class TimerViewController:UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    
    @IBOutlet weak var endDateLabel: UILabel!
    var startDate: Date!
            var endDate: Date!
            
            var timer: Timer?
            var isTimerRunning = false
            var currentTimerDate: Date!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // Устанавливаем начальное время таймера на startDate
                currentTimerDate = startDate
                
                // Обновляем метки
                updateDateLabels()
                updateTimerLabel()
            }
            
            func updateDateLabels() {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMMM yyyy, EEE HH:mm" // Формат даты
                
                // Обновляем start и end метки
                startDateLabel.text = "\(dateFormatter.string(from: startDate))"
                endDateLabel.text = " \(dateFormatter.string(from: endDate))"
            }
            
            func updateTimerLabel() {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
                timerLabel.text = " \(dateFormatter.string(from: currentTimerDate))"
            }
            
        @objc func updateTimer() {
            // Увеличиваем текущее время на 1 минуту при каждом вызове
            let oneMinute = TimeInterval(60) // 1 минута = 60 секунд
            currentTimerDate = currentTimerDate.addingTimeInterval(oneMinute)
            
            // Проверяем, не достигли ли мы конечной даты
            if currentTimerDate <= endDate {
                updateTimerLabel()
            } else {
                timer?.invalidate() // Останавливаем таймер, если достигли конечной даты
                timerLabel.text = "End time reached!"
            }
        }
        
    @IBAction func startTimer(_ sender: Any) {
        guard !isTimerRunning else { return } // Если таймер уже запущен, выходим
                 timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                 isTimerRunning = true
    }
    @IBAction func resetTimer(_ sender: Any) {
        timer?.invalidate()
                     isTimerRunning = false
                     currentTimerDate = startDate
                     updateTimerLabel()
    }
    @IBAction func pauseTimer(_ sender: Any) {
        timer?.invalidate()
                      isTimerRunning = false
    }
    
}

