//
//  ViewController.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet {
            passwordTextField.tintColor = UIColor.white
            passwordTextField.setIcon(UIImage(systemName: "lock")!)
        }
     }
    @IBOutlet weak var emailTextField: UITextField!{
        didSet {
            emailTextField.tintColor = UIColor.white
            emailTextField.setIcon(UIImage(systemName: "mail")!)
        }
     }
    
    var dataViewModel = Injection.provide.ApiProtocolInjection()
    
    var loginInstance: LoginModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        registerKeyboardNotifications()
        // Do any additional setup after loading the view.
        configurationOfView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configurationOfView(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        emailTextField.addBottomBorder()
        passwordTextField.addBottomBorder()
    }
    @IBAction func loginBtn(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" && isValidEmail(emailTextField.text!)  {
            loginInstance = LoginModel(userEmail: emailTextField.text!, password: passwordTextField.text!)
            dataViewModel.loginUser(login: loginInstance!) { result in
                switch result {
                case .success(_):
                    print("successfull")
                case .failure(let error):
                    self.showAlert(alertText: "Error", alertMessage: error.localizedDescription)
                }
            }
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeVc, animated: true)
        }
        else{
            showAlert(alertText: "Email", alertMessage: "Please check Your Email and password")
        }
    }
    
    
}


extension ViewController{
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        
        // reset back the content inset to zero after keyboard is gone
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
