//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mario Vizcaino on 10/12/16.
//  Copyright © 2016 Mario Vizcaino. All rights reserved.
//

import Foundation


class CalculatorBrain {
    
    private var accumulator = 0.0
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String,Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
    ]
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation {
                case .Constant (let value) : accumulator = value
                case .BinaryOperation : break
                
                case .Equals : break
                
                case .UnaryOperation (let function) : accumulator = function(accumulator)
            }
        }
    }
    var result: Double{
        get{
            return accumulator
        }
    }
}