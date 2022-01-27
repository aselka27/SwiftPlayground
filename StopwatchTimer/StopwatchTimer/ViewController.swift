//
//  ViewController.swift
//  StopwatchTimer
//
//  Created by саргашкаева on 26.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var timer = Timer()
    var isTimerRunning = false
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    var counter: Int = 0
    
    var imageView = UIImageView()
    var timerImage = UIImage(systemName: "timer")
    var imageView2 = UIImageView()
    let stopwatchImage = UIImage(systemName: "stopwatch")
    private var segmentedControl = UISegmentedControl()
    let elementsArray = ["Timer","Stopwatch"]
    var labelView = UILabel()
    var stopButton = UIButton(type: .system)
    var pauseButton = UIButton()
    var startButton = UIButton()
    let pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set timer Image
        view.backgroundColor = .yellow
        imageView = UIImageView (image: timerImage)
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        imageView.tintColor = UIColor.black
//
        //Set stopwatch Image
        imageView2 = UIImageView(image: stopwatchImage)
        view.addSubview(imageView2)
        imageView2.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        imageView2.tintColor = UIColor.black
        imageView2.isHidden = true
        
        //Set Segmented Control
        segmentedControl = UISegmentedControl(items: elementsArray)
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints {
                    $0.centerX.equalToSuperview()
                    $0.top.equalTo(imageView.snp.top).inset(100)
        }
        segmentedControl.addTarget(self, action: #selector(changeSegmentedControl(segmentedControl:)), for: .valueChanged)
        //Set label text 00:00:00
        labelView.text = "00:00:00"
        labelView.font = UIFont.boldSystemFont(ofSize: 75)
        labelView.textAlignment = .center
        view.addSubview(labelView)
        labelView.snp.makeConstraints {
                   $0.centerX.equalToSuperview()
            $0.top.equalTo(segmentedControl.snp.top).inset(50) }
       // Make StopButton
        stopButton = UIButton(type: .system)
        stopButton.tintColor = .black
        stopButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 80), forImageIn: .normal)
        stopButton.setImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        view.addSubview(stopButton)
        stopButton.snp.makeConstraints {
                   $0.left.equalTo(40)
                   $0.width.height.equalTo(80)
                   $0.bottom.equalToSuperview().inset(170)
                   }
        stopButton.addTarget(self, action: #selector(onStopClick), for: .touchUpInside)
        
        //Make PauseButton
        pauseButton = UIButton(type: .system)
        pauseButton.tintColor = .black
        pauseButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 80), forImageIn: .normal)
        pauseButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        view.addSubview(pauseButton)
        pauseButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
            $0.bottom.lessThanOrEqualToSuperview().inset(170)
        }
        pauseButton.addTarget(self, action: #selector(onPauseClick), for: .touchUpInside)
        
        //Make start button
        startButton = UIButton(type: .system)
        startButton.tintColor = .black
        startButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 80), forImageIn: .normal)
        startButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        view.addSubview(startButton)
        startButton.snp.makeConstraints{
            $0.right.equalToSuperview().inset(40)
            $0.width.height.equalTo(80)
            $0.bottom.equalToSuperview().inset(200)
        }
        startButton.addTarget(self, action: #selector(onStartClick), for: .touchUpInside)
        
        //Create pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints{
            $0.top.equalTo(labelView.snp.top).inset(60)
            $0.right.left.equalToSuperview().inset(20)
        }
        
        pickerView.isHidden = false
        
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        
        
        }
   @objc func onStartClick(){
       if !isTimerRunning {
           if pickerView.isHidden==true {
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runStopWatch), userInfo: nil, repeats: true)
               isTimerRunning = true
               stopButton.isEnabled = true
               pauseButton.isEnabled = true
               startButton.isEnabled = false
           }
           if pickerView.isHidden == false {
               runTimer()
               isTimerRunning = true
               stopButton.isEnabled = true
               pauseButton.isEnabled = true
               startButton.isEnabled = false
           }
           
           }
       }
    
    @objc func onStopClick (){
        timer.invalidate()
                isTimerRunning = false
                counter = 0
                labelView.text = "00:00:00"
                stopButton.isEnabled = false
                pauseButton.isEnabled = false
                startButton.isEnabled = true
        
    }
    
    @objc func onPauseClick (){
                stopButton.isEnabled = true
                startButton.isEnabled = true
                pauseButton.isEnabled = false
                
                isTimerRunning = false
                timer.invalidate()
    }
    @objc func runStopWatch(){
        counter += 1
               // HH:MM:SS
              
               let hour = counter / 3600
               var hourString = "\(hour)"
               if hour < 10 {
                   hourString = "0\(hour)"
               }
               let minute = (counter%3600)/60
               var minuteString = "\(minute)"
               if minute < 10{
                   minuteString = "0\(minute)"
               }
               let second = (counter % 3600) % 60
               var secondString = "\(second)"
               if second < 10{
                   secondString = "0\(second)"
               }
               labelView.text = "\(hourString):\(minuteString):\(secondString)"

       }
       
    @objc func changeSegmentedControl (segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pickerView.isHidden = false
            imageView2.isHidden = true
            imageView.isHidden = false
            timer.invalidate()
            
            
        default:
            pickerView.isHidden = true
            imageView2.isHidden = false
            imageView.isHidden = true
            timer.invalidate()
            
        
        }

   }
    @objc func runTimer() {
           timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
               
               if self.seconds == 0 && self.minutes != 0 {
                   self.minutes -= 1
                   self.seconds = 59
               } else if self.minutes == 0 && self.hours != 0 {
                   self.hours -= 1
                   self.minutes = 59
                   self.seconds = 59
               } else if self.minutes == 0 && self.hours == 0 && self.seconds == 0 {
                   self.timer.invalidate()
                  
               } else {
                   self.seconds -= 1
               }
               
               self.labelView.text = String(format:"%02i:%02i:%02i", self.hours, self.minutes, self.seconds)
           }
       }
    
   
   
    
}
extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    switch component{
    case 0:
        return 24
    default:
        return 60
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(format: "%02d", row)
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0{
                hours = row
            } else if component == 1 {
                minutes = row
            } else {
                seconds = row + 1
            }
        }
}

