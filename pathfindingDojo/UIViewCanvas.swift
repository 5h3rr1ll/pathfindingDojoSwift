//
//  PushButton.swift
//  pathfindingDojo
//
//  Created by Patrick Weber on 12.09.18.
//  Copyright © 2018 Patrick Weber. All rights reserved.
//

import UIKit

//@IBDesignable

class UIViewCanvas: UIView {
    
    private struct Constants {
        static var plusLineWidth: CGFloat = 1.5
        static var plusButtonScale: CGFloat = 1
        static var halfPointShift: CGFloat = 0.5
    }
    
    override func draw(_ rect: CGRect) {

        let path = UIBezierPath(rect: rect)
        UIColor.lightGray.setFill()
        path.fill()
        row()
        col()
        //drawObstacles()
        
    }
    
//    func drawObstacles() {
//        var obstacles:[Obstacle] = []
//        let obstacle1 = Obstacle(x: 5,y: 5)
//
//        obstacles.append(obstacle1)
//
//        let path
//    }

    func row() {
        let currentWidth: CGFloat = 0
        var currentHeight: CGFloat = bounds.height / 40
        
        while currentHeight < bounds.height {
            let plusPath = UIBezierPath()
            
            plusPath.lineWidth = Constants.plusLineWidth
            
            plusPath.move(to: CGPoint(
                x: currentWidth,
                y: currentHeight))
            
            plusPath.addLine(to: CGPoint(
                x: currentWidth + bounds.width,
                y: currentHeight))
            
            UIColor.black.setStroke()
            plusPath.stroke()
            
            currentHeight += bounds.height / 40
        }
    }
    
    func col() {
        
        var currentWidth1: CGFloat = bounds.width / 20
        let currentHeight1: CGFloat = 0
        
        while currentWidth1 < bounds.width{
        
            let plusPath1 = UIBezierPath()
        
            plusPath1.lineWidth = Constants.plusLineWidth
        
            plusPath1.move(to: CGPoint(
            x: currentWidth1,
            y: currentHeight1))
        
            plusPath1.addLine(to: CGPoint(
            x: currentWidth1,
            y: currentHeight1 + bounds.height))
        
            UIColor.black.setStroke()
            plusPath1.stroke()
        
            currentWidth1 += bounds.width / 20
        }
    }
    
}

public class Obstacle {
    let x : Int
    let y : Int
    
    init(x : Int, y: Int) {
        self.x = x
        self.y = y
    }
}
