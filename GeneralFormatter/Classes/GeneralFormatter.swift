import Foundation

public enum GeneralFormatter {
    
    case cpf
    case cnpj
    case cpfCnpj
    case phone
    case cep
    case custom(formatter: Formatter)
    
    var formatter: Formatter {
        switch self {
        case .cpf:
            return CPFFormatter()
        case .phone:
            return PhoneFormatter()
        case .cep:
            return CEPFormatter()
        case .cnpj:
            return CNPJFormatter()
        case .cpfCnpj:
            return CPFCNPJFormatter()
        case .custom(let formatter):
            return formatter
        }
    }
    
    public func formatTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return formatter.shouldChangeCharacters(of: textField, inRange: range)
    }
}
