class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countyTextField: UITextField!
    @IBOutlet weak var municialityTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var buildingNoTextField: UITextField!
    @IBOutlet weak var apartmentNoTextField: UITextField!
    
    private lazy var fields: [UITextField: WritableKeyPath<ViewModel, String?>] = [
        cityTextField: \ViewModel.city,
        countyTextField: \.county,
        municialityTextField: \.municipality,
        districtTextField: \.district,
        streetTextField: \.avenueStreet,
        buildingNoTextField: \.buildingNumber,
        apartmentNoTextField: \.apartmantNumber
    ]
    
    func setTextFieldsBestWay() -> ViewModel {
        var address = ViewModel()
        for (field, keyPath) in fields {
            address[keyPath: keyPath] = field.text ?? ""
        }
        return address
    }
    
    func setTextFieldsBadWay() -> ViewModel {
        let address = ViewModel()
        address.city = self.cityTextField.text ?? ""
        address.county = self.countyTextField.text ?? ""
        address.municipality =  self.municialityTextField.text ?? ""
        address.district = self.districtTextField.text ?? ""
        address.avenueStreet = self.streetTextField.text ?? ""
        address.buildingNumber = self.buildingNoTextField.text ?? ""
        address.apartmantNumber = self.apartmentNoTextField.text ?? ""
        return address
    }
}

class ViewModel {
    var city: String?
    var county: String?
    var municipality: String?
    var district: String?
    var avenueStreet: String?
    var buildingNumber: String?
    var apartmantNumber: String?
}
