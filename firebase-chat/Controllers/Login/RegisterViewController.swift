//
//  RegisterViewController.swift
//  firebase-chat
//
//  Created by Fernando Marins on 15/12/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        field.textColor = .black
        
        // adding some padding to the text field
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.rightViewMode = .always
        
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        field.textColor = .black
        
        // adding some padding to the text field
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.rightViewMode = .always
        
        return field
    }()
    
    private let emailFied: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.attributedPlaceholder = NSAttributedString(
            string: "Email address",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        field.textColor = .black
        
        // adding some padding to the text field
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.rightViewMode = .always
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        field.textColor = .black
        
        // adding some padding to the text field
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.rightViewMode = .always
        
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        // masks to bounds: cuts everything that overlays the corners
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Register"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        
        
        registerButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        emailFied.delegate = self
        passwordField.delegate = self
        
        // add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailFied)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture))
        gesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(gesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width - size)/2, y: 20, width: size, height: size)
        firstNameField.frame = CGRect(x: 30, y: imageView.bottom + 10, width: scrollView.width - 60, height: 52)
        lastNameField.frame = CGRect(x: 30, y: firstNameField.bottom + 10, width: scrollView.width - 60, height: 52)
        emailFied.frame = CGRect(x: 30, y: lastNameField.bottom + 10, width: scrollView.width - 60, height: 52)
        passwordField.frame = CGRect(x: 30, y: emailFied.bottom + 10, width: scrollView.width - 60, height: 52)
        registerButton.frame = CGRect(x: 30, y: passwordField.bottom + 10, width: scrollView.width - 60, height: 52)
        
        imageView.layer.cornerRadius = imageView.width/2.0
    }
    
    @objc private func didTapChangeProfilePicture() {
        presentPhotoActionSheet()
    }
    
    @objc private func loginButtonTapped() {
        
        emailFied.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        
        guard let email = emailFied.text,
              let password = passwordField.text,
              let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
                  alertLoginError()
                  return
              }
        
        DatabaseManager.shared.userExists(with: email) { [weak self] exists in
            guard !exists else {
                let alert = self?.showAlert("ERROR", "Usuário já existe", .alert)
                alert!.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert!, animated: true, completion: nil)
                // user already exists
                return
            }
            
            Firebase.Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard result != nil, error == nil  else {
                    print("error creating user")
                    return
                }
                
                DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: firstName, lastName: lastName, emailAddress: email))
                
                self?.navigationController?.dismiss(animated: true, completion: nil)
            }
        }
        
        
    }
    
    func alertLoginError() {
        let alert = showAlert("Woops", "Please enter all information to create a new account", .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailFied {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { [weak self] _ in
            self?.presentCameraOrAlbum(isCamera: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose photo", style: .default, handler: { [weak self] _ in
            self?.presentCameraOrAlbum(isCamera: false)
        }))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func presentCameraOrAlbum(isCamera: Bool) {
        let pickerView = UIImagePickerController()
        pickerView.sourceType = isCamera ? .camera : .photoLibrary
        pickerView.delegate = self
        pickerView.allowsEditing = true
        present(pickerView, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] else {
            return
        }
        
        imageView.image = selectedImage as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
}
