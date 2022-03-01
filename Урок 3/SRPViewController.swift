//
//  SRPViewController.swift
//  SOLIDDRYKISS
//
//  Created by Александров Роман Витальевич on 09.02.2022.
//

import UIKit
import Foundation

enum CaloriesCalculatorType {
    case mifflin
    case harrisBenedict
}

enum ProportionType {
    case paleo
    case keto
}

struct Nutrients {
    let carbs: Int
    let fats: Int
    let proteins: Int
}

protocol CaloriesCalculation {
    func calculationProrortion(proportionType: ProportionType) -> Nutrients
}
protocol ProportionCalculation {
    func calculationTargetColorias(caloriesCalculationType: CaloriesCalculatorType) -> Int
}

struct Calories: CaloriesCalculation {
    func calculationProrortion(proportionType: ProportionType) -> Nutrients {
        var nutrients: Nutrients
        switch proportionType {
        case .paleo:
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        default:
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        return nutrients
    }
}

struct Proportion: ProportionCalculation {
    func calculationTargetColorias(caloriesCalculationType: CaloriesCalculatorType) -> Int {
        var targetCalories: Int
        switch caloriesCalculationType {
        case .harrisBenedict:
            targetCalories = 1200
        default:
            targetCalories = 1400
        }
        return targetCalories
    }
}

var calories = Calories()
calories.calculationProrortion(proportionType: .paleo)

var proportion = Proportion()
proportion.calculationTargetColorias(caloriesCalculationType: .harrisBenedict)

class SRPViewController {
    var calories = Calories()
    var proportion = Proportion()
}
