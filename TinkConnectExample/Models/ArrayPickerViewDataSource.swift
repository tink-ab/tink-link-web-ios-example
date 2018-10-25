import UIKit

class ArrayPickerViewDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private let data: [String]

    init(data: [String]) {
        self.data = data
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

    func string(at index: Int) -> String {
        return data[index]
    }
}
