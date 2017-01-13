

import UIKit

@available(iOS 9.0, *)
public class TelTechOnCallController : UIViewController {
    
    public var delegate: TelTechOnCallDelegate?
    
    @IBOutlet weak var callerIDLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var keypadButton: UIButton!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var endCallButton: UIButton!
    @IBOutlet weak var keypadStackView: UIStackView!
    @IBOutlet weak var controlsStackView: UIStackView!
    @IBOutlet weak var hideButton: UIButton!
    
    var timer: Timer?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public static func create() -> TelTechOnCallController {
        let podBundle = Bundle(for: TelTechOnCallController.self)
        let bundleURL = podBundle.url(forResource: "TelTechDialerView", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "OnCall", bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnCall") as! TelTechOnCallController
        return vc
    }
    
    @IBAction func tappedSpeaker(_ sender: Any) {
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
        self.delegate?.tappedMute?()
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
    
    /**
     Starts the call, according to the UI.
     Activates the call timer
     **/
    public func start() {
//        timer = Timer(timeInterval: 1.0, repeats: true, block: { (timer) in
//            
//        })
        
    }
    
    
}

@objc
public protocol TelTechOnCallDelegate {
    @objc optional func tappedSpeaker(state: Bool)
    @objc optional func tappedKeypad()
    @objc optional func tappedMute()
    @objc optional func tappedEndCall()
    
}
