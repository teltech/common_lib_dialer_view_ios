

import UIKit

@available(iOS 9.0, *)
public class TelTechOnCallController : UIViewController {
    
    public var delegate: TelTechOnCallDelegate?
    
    @IBOutlet weak var callerIDLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel! {
        didSet {
            self.timerLabel.font = timerLabel.font.ttMonospacedDigitFont
        }
    }
    @IBOutlet weak var muteButton: TelTechDialerButton!
    @IBOutlet weak var keypadButton: TelTechDialerButton!
    @IBOutlet weak var speakerButton: TelTechDialerButton!
    @IBOutlet weak var endCallButton: UIButton!
    @IBOutlet weak var keypadStackView: UIStackView!
    @IBOutlet weak var controlsStackView: UIStackView!
    @IBOutlet weak var hideButton: UIButton!
    
    private var timer: Timer?
    private(set) var callTime: Double = 0

    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /** Call this method to create a new on call controller **/
    public static func create() -> TelTechOnCallController {
        let podBundle = Bundle(for: TelTechOnCallController.self)
        let bundleURL = podBundle.url(forResource: "TelTechDialerView", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "OnCall", bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnCall") as! TelTechOnCallController
        return vc
    }
    
    
    /**
     Starts the call, according to the UI.
     Activates the call timer
     **/
    public func start() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true);
        
    }
    
    /** Call this method to end a call **/
    public func end() {
        timer?.invalidate()
        timer = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
        Set the displayed caller ID
    **/
    public func setCallerID(callerID: String) {
        self.callerIDLabel.text = callerID
    }
    

    
    
    @IBAction func tappedSpeaker(_ sender: Any) {
        self.speakerButton.isOn = !self.speakerButton.isOn
        self.delegate?.tappedSpeaker?(state: true)
    }
    
    @IBAction func tappedKeypad(_ sender: Any) {
        self.delegate?.tappedKeypad?()

        self.hideButton.isHidden = false
        self.keypadStackView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.hideButton.alpha = 1.0
            self.keypadStackView.alpha = 1.0
            self.controlsStackView.alpha = 0
        }) { (completed) in
            if completed {

                self.controlsStackView.isHidden = true
                
            }
        }
    }
    
    @IBAction func tappedMute(_ sender: Any) {
        self.muteButton.isOn = !self.muteButton.isOn
        self.delegate?.tappedMute?(state: self.muteButton.isOn)
    }
    
    @IBAction func tappedEndCall(_ sender: Any) {
        self.delegate?.tappedEndCall?()
    }
    
    @IBAction func tappedHide(_ sender: Any) {

        self.controlsStackView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.hideButton.alpha = 0
            self.keypadStackView.alpha = 0
            self.controlsStackView.alpha = 1.0
        }) { (completed) in
            if completed {
                self.hideButton.isHidden = true
                self.keypadStackView.isHidden = true
            }
        }
    }
    

    @IBAction func tappedKeypadButton1(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "1")
    }

    @IBAction func tappedKeypadButton2(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "2")

    }
    
    @IBAction func tappedKeypadButton3(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "3")

    }
    
    @IBAction func tappedKeypadButton4(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "4")

    }
    
    @IBAction func tappedKeypadButton5(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "5")

    }
    
    @IBAction func tappedKeypadButton6(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "6")

    }
    
    @IBAction func tappedKeypadButton7(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "7")

    }
    
    @IBAction func tappedKeypadButton8(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "8")

    }
    
    @IBAction func tappedKeypadButton9(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "9")

    }
    
    @IBAction func tappedKeypadButtonStar(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "*")

    }
    
    @IBAction func tappedKeypadButton0(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "0")

    }
    
    @IBAction func tappedKeypadButtonPound(_ sender: Any) {
        self.delegate?.tappedKeypadButton?(button: "#")

    }
    
    @objc private func timerFired() {
        if let timer = timer {
            callTime += timer.timeInterval
            self.timerLabel.text = formatTime(callTime)
        }
    }
    
    
    private func formatTime(_ seconds: Double) -> String {
        let hours = (Int64(seconds)) / 60 / 60
        let minutes = (Int64(seconds) / 60) % 60
        let displaySeconds = Int64(seconds) % 60
        
        let hoursString = (hours > 0 ? (String(hours) + ":") : "")
        let minutesString = ((minutes < 10 && hours > 0) ? ("0" + String(minutes)) : String(minutes))
        let secondsString = (displaySeconds < 10 ? ("0" + String(displaySeconds)) : String(displaySeconds))
        return hoursString + minutesString + ":" + secondsString
    }
    
    
}

@objc
public protocol TelTechOnCallDelegate {
    @objc optional func tappedSpeaker(state: Bool)
    @objc optional func tappedKeypad()
    @objc optional func tappedMute(state: Bool)
    @objc optional func tappedEndCall()
    @objc optional func tappedKeypadButton(button: String)
    
}
