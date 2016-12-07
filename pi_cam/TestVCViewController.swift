////
////  TestVCViewController.swift
////  pi_cam
////
////  Created by Marquavious on 12/6/16.
////  Copyright © 2016 marqmakesapps. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
////NOT WORKING - Unable to see Camera View in UIView: http://stackoverflow.com/questions/28683863/front-camera-to-fill-circular-uiview
//
//class TestVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
//    
//    var previewView : UIView!;
//    var boxView:UIView!;
//    
//    //Camera Capture requiered properties
//    var videoDataOutput: AVCaptureVideoDataOutput!;
//    var videoDataOutputQueue : DispatchQueue!;
//    var previewLayer:AVCaptureVideoPreviewLayer!;
//    var captureDevice : AVCaptureDevice!
//    let session=AVCaptureSession();
//    var currentFrame:CIImage!
//    var done = false;
//    
//    
//    var cameraView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        cameraView.frame = CGRect(x: 100, y: self.view.center.y-260, width: 568, height: 568)
//        cameraView.backgroundColor = UIColor(red:26/255, green:188/255, blue:156/255, alpha:1)
//        cameraView.layer.cornerRadius = 284
//        cameraView.layer.borderColor = UIColor.white.cgColor
//        cameraView.layer.borderWidth = 15
//        cameraView.contentMode = UIViewContentMode.scaleToFill
//        cameraView.layer.masksToBounds = true
//        
//        
//        
//        var screenSize = UIScreen.main.bounds.size;
//        self.previewView = UIView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height));
//        self.previewView.contentMode = UIViewContentMode.scaleAspectFit
//        self.view.addSubview(previewView);
//        
//        //Add a box view
//        self.boxView = UIView(frame: CGRect(x:0, y:0, width:100,  height:200));
//        self.boxView.backgroundColor = UIColor.green;
//        self.boxView.alpha = 0.3;
//        
//        self.view.addSubview(self.boxView);
//        
//        self.setupAVCapture();
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        if !done {
//            session.startRunning();
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
////    func shouldAutorotate() -> Bool {
////        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft ||
////            UIDevice.current.orientation == UIDeviceOrientation.landscapeRight ||
////            UIDevice.current.orientation == UIDeviceOrientation.unknown) {
////            return false;
////        }
////        else {
////            return true;
////        }
////    }
//}
//
//
//// AVCaptureVideoDataOutputSampleBufferDelegate protocol and related methods
//extension TestVC {
//    
//    func setupAVCapture(){
//        session.sessionPreset = AVCaptureSessionPreset640x480
//        
//        let devices = AVCaptureDevice.devices();
//        // Loop through all the capture devices on this phone
//        for device in devices! {
//            // Make sure this particular device supports video
//            if ((device as AnyObject).hasMediaType(AVMediaTypeVideo)) {
//                // Finally check the position and confirm we've got the front camera
//                if((device as AnyObject).position == AVCaptureDevicePosition.front) {
//                    captureDevice = device as? AVCaptureDevice
//                    if captureDevice != nil {
//                        beginSession()
//                        break
//                    }
//                }
//            }
//        }
//    }
//    
//    func beginSession(){
//        var err : NSError? = nil
////        var deviceInput:AVCaptureDeviceInput = AVCaptureDeviceInput(device: captureDevice, error: err)
////        if err != nil {
////            print("error: \(err?.localizedDescription)")
////        }
////        if self.session.canAddInput(deviceInput){
////            self.session.addInput(deviceInput)
////        }
//        
//        self.videoDataOutput = AVCaptureVideoDataOutput()
//        var rgbOutputSettings = [NSNumber(value: Int(kCMPixelFormat_32BGRA)):kCVPixelBufferPixelFormatTypeKey]
//        self.videoDataOutput.alwaysDiscardsLateVideoFrames=true
////        self.videoDataOutputQueue = DispatchQueue("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL)
//        self.videoDataOutput.setSampleBufferDelegate(self, queue:self.videoDataOutputQueue)
//        if session.canAddOutput(self.videoDataOutput){
//            session.addOutput(self.videoDataOutput)
//        }
//        self.videoDataOutput.connection(withMediaType: AVMediaTypeVideo).isEnabled = true
//        
//        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
//        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
//        
//        var rootLayer :CALayer = self.cameraView.layer
//        rootLayer.masksToBounds=true
//        self.previewLayer.frame = rootLayer.bounds
//        rootLayer.addSublayer(self.previewLayer)
//        session.startRunning()
//        
//    }
//    
//    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
//        // do stuff here
//        
//    }
//    
//    // clean up AVCapture
//    func stopCamera(){
//        session.stopRunning()
//    }
//    
//}
