import UIKit

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailField {
            validateEmail(textField: textField, range: range, string: string)
        } else if textField == passwordField {
            validatePassword(textField: textField, range: range, string: string)
        }
        return true
    }
    
    func validateEmail(textField: UITextField, range: NSRange, string: String) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            validEmail.isHidden = true
            invalidEmail.isHidden = true
        } else if updatedText.validateEmail() {
            validEmail.isHidden = false
            invalidEmail.isHidden = true
        } else {
            validEmail.isHidden = true
            invalidEmail.isHidden = false
        }
    }
    
    func validatePassword(textField: UITextField, range: NSRange, string: String) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            validPassword.isHidden = true
            invalidPassword.isHidden = true
        } else if updatedText.validatePassword() {
            validPassword.isHidden = false
            invalidPassword.isHidden = true
        } else {
            validPassword.isHidden = true
            invalidPassword.isHidden = false
        }
    }
}
