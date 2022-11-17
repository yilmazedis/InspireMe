import AVFoundation
import UIKit

class CustomAVPlayerLayer: UIView {
    
    lazy var currentTimeLabel: UILabel = {
        let newValue = UILabel()
        newValue.textColor = AppColor.secondaryTint.color
        newValue.font = .appFont(.medium, size: 12.0)
        newValue.isOpaque = true
        newValue.numberOfLines = 1
        newValue.setContentCompressionResistancePriority(.required, for: .horizontal)
        newValue.sizeToFit()
        newValue.text = "0.0"
        return newValue
    }()
    
    lazy var durationLabel: UILabel = {
        let newValue = UILabel()
        newValue.textColor = AppColor.secondaryTint.color
        newValue.font = .appFont(.medium, size: 12.0)
        newValue.isOpaque = true
        newValue.numberOfLines = 1
        newValue.setContentCompressionResistancePriority(.required, for: .horizontal)
        newValue.sizeToFit()
        newValue.text = "0.0"
        return newValue
    }()
    
    lazy var timeSlider: UISlider = {
       let view = UISlider()
        
        return view
    }()
    
    lazy var playButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(Image.iconPlay.image, for: .normal)
        view.setImage(Image.iconPlay.image, for: .selected)
        //view.tintColor = .red
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let newValue = UIStackView()
        newValue.spacing = 16
        newValue.axis = .horizontal
        newValue.alignment = .fill
        newValue.distribution = .fill
        newValue.isOpaque = true
        return newValue
    }()
    
    lazy var videoView: UIView = {
       let view = UIView()
        return view
    }()
    
    lazy var controllerView: UIView = {
       let view = UIView()
        return view
    }()
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        setupStackView()
        
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        timeSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = videoView.bounds
    }
    
    func setAVPlayerURL(url: String) {
        guard let sourceURL = URL(string: url) else {
            return
        }
        
        let playerItem = AVPlayerItem(url: sourceURL)
        
        player = AVPlayer(playerItem: playerItem)
        addTimeObserver()
        
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(videoPlayBackFinished),
                         name: .AVPlayerItemDidPlayToEndTime,
                         object: player?.currentItem)
        
        NotificationCenter.default.addObserver(self,
                                       selector: #selector(didEnterBackground),
                                       name: UIApplication.didEnterBackgroundNotification,
                                       object: nil)
        
        player?.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resize
        videoView.layer.addSublayer(playerLayer ?? AVPlayerLayer())
    }
    
    private func setupStackView() {
        backgroundColor = AppColor.darkLabel.color
        
        addSubview(videoView)
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        videoView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: 375).isActive = true
        
        addSubview(controllerView)
        controllerView.translatesAutoresizingMaskIntoConstraints = false
        controllerView.topAnchor.constraint(equalTo: videoView.bottomAnchor).isActive = true
        controllerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        controllerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        controllerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        controllerView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        controllerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: controllerView.topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: controllerView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: controllerView.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: controllerView.bottomAnchor, constant: -16).isActive = true
        
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(currentTimeLabel)
        stackView.addArrangedSubview(timeSlider)
        stackView.addArrangedSubview(durationLabel)
    }
    
    @objc private func playButtonAction(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            player?.play()
        } else {
            player?.pause()
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        player?.seek(to: CMTimeMake(value: Int64(sender.value * 1000), timescale: 1000))
    }
    
    @objc private func videoPlayBackFinished() {
        playButton.isSelected = false
        player?.seek(to: CMTime.zero)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "duration", let duration = player?.currentItem?.duration, duration.seconds > 0.0 {
            durationLabel.text = getTimeString(from: duration)
        }
    }
    
    private func getTimeString(from time: CMTime) -> String {
        let totalSecond = CMTimeGetSeconds(time)
        let hours = Int(totalSecond / 36000)
        let minutes = Int(totalSecond / 60) % 60
        let seconds = Int(totalSecond.truncatingRemainder(dividingBy: 60))
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        } else {
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }
     
    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [weak self] time in
            guard let self = self, let currentItem = self.player?.currentItem else { return }
            self.timeSlider.maximumValue = Float(currentItem.duration.seconds)
            self.timeSlider.minimumValue = 0
            self.timeSlider.value = Float(currentItem.currentTime().seconds)
            self.currentTimeLabel.text = self.getTimeString(from: currentItem.currentTime())
        })
    }
    
    @objc private func didEnterBackground() {
        player?.pause()
    }
}

/*
playerController = AVPlayerViewController()
playerController?.player = player

addChild(playerController!)
playerController?.view.frame = viewForPlayer.bounds
viewForPlayer.addSubview((playerController?.view)!)
playerController?.didMove(toParent: self)
*/
