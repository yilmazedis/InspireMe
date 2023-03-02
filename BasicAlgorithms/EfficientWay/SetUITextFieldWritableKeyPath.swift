class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countyTextField: UITextField!
    @IBOutlet weak var municialityTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var buildingNoTextField: UITextField!
    @IBOutlet weak var apartmentNoTextField: UITextField!

    // The rest of your code goes here...
    func initCodesBestWay() {
        var address = DaskPropasalModel()
        
        // if you use KeyPath instead of WritableKeyPath, you cannot use address[keyPath: keyPath], beacue it will be read-only otherwise.
        let fields: [UITextField: WritableKeyPath<DaskPropasalModel, TextValueItemModel?>] = [
            cityTextField: \.city,
            countyTextField: \.county,
            municialityTextField: \.municipality,
            districtTextField: \.district,
            streetTextField: \.avenueStreet,
            buildingNoTextField: \.buildingNumber,
            apartmentNoTextField: \.apartmantNumber
        ]

        for (field, keyPath) in fields {
            let textValueItem = TextValueItemModel()
            textValueItem.text = field.text ?? ""
            address[keyPath: keyPath] = textValueItem
        }
    }
    
    func initTwo() {
      let address = DaskPropasalModel()

      let fields = [self.cityTextField, self.countyTextField, self.municialityTextField, self.districtTextField, self.streetTextField, self.buildingNoTextField, self.apartmentNoTextField]

      for (index, field) in fields.enumerated() {
          let textValueItem = TextValueItemModel()
          textValueItem.text = field?.text ?? ""

          switch index {
          case fields.firstIndex(of: self.cityTextField):
              address.city = textValueItem
          case fields.firstIndex(of: self.countyTextField):
              address.county = textValueItem
          case fields.firstIndex(of: self.municialityTextField):
              address.municipality = textValueItem
          case fields.firstIndex(of: self.districtTextField):
              address.district = textValueItem
          case fields.firstIndex(of: self.streetTextField):
              address.avenueStreet = textValueItem
          case fields.firstIndex(of: self.buildingNoTextField):
              address.buildingNumber = textValueItem
          case fields.firstIndex(of: self.apartmentNoTextField):
              address.apartmantNumber = textValueItem
          default:
              break
          }
      }
    }
    
    func initOne() {
        let address = DaskPropasalModel()

        let fields = [self.cityTextField, self.countyTextField, self.municialityTextField, self.districtTextField, self.streetTextField, self.buildingNoTextField, self.apartmentNoTextField]

        for (index, field) in fields.enumerated() {
            let textValueItem = TextValueItemModel()
            textValueItem.text = field?.text ?? ""
            
            switch index {
            case 0:
                address.city = textValueItem
            case 1:
                address.county = textValueItem
            case 2:
                address.municipality = textValueItem
            case 3:
                address.district = textValueItem
            case 4:
                address.avenueStreet = textValueItem
            case 5:
                address.buildingNumber = textValueItem
            case 6:
                address.apartmantNumber = textValueItem
            default:
                break
            }
        }
    }
    
    func initBadWay() {
      let address = DaskPropasalModel()
        
        let city = TextValueItemModel()
        city.text = self.cityTextField.text ?? ""
        address.city = city
        
        let county = TextValueItemModel()
        county.text = self.countyTextField.text ?? ""
        address.county = county
        
        let municipality = TextValueItemModel()
        municipality.text = self.municialityTextField.text ?? ""
        address.municipality = municipality
        
        let district = TextValueItemModel()
        district.text = self.districtTextField.text ?? ""
        address.district = district
        
        let avenueStreet = TextValueItemModel()
        avenueStreet.text = self.streetTextField.text ?? ""
        address.avenueStreet = avenueStreet
        
        let buildingNumber = TextValueItemModel()
        buildingNumber.text = self.buildingNoTextField.text ?? ""
        address.buildingNumber = buildingNumber
        
        let apartmantNumber = TextValueItemModel()
        apartmantNumber.text = self.apartmentNoTextField.text ?? ""
        address.apartmantNumber = apartmantNumber
    }
}

class DaskPropasalModel {
    var city: TextValueItemModel?
    var county: TextValueItemModel?
    var municipality: TextValueItemModel?
    var district: TextValueItemModel?
    var avenueStreet: TextValueItemModel?
    var buildingNumber: TextValueItemModel?
    var apartmantNumber: TextValueItemModel?
}

class TextValueItemModel: UILabel {
    let city: String = ""
}
