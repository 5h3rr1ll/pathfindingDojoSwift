//
//  PushButton.swift
//  pathfindingDojo
//
//  Created by Patrick Weber on 12.09.18.
//  Copyright © 2018 Patrick Weber. All rights reserved.
//

import UIKit

//@IBDesignable

private struct Constants {
    static var plusLineWidth: CGFloat = 1
    static var plusButtonScale: CGFloat = 1
    static var halfPointShift: CGFloat = 0.5
    static var rows: Int = 20
    static var columns: Int = 40
}

class UIViewCanvas: UIView {
    
    override func draw(_ rect: CGRect) {
        let rowAmount: Int = 20
        let colAmount: Int = 40
        
        let blockWidth = Int(floor(Double(Int(bounds.width) / rowAmount)))
        let blockHeight = Int(floor(Double(Int(bounds.height) / colAmount)))
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        
        let path = UIBezierPath(rect: rect)
        UIColor.lightGray.setFill()
        path.fill()
        factoryHall1(blockWidth: blockWidth, blockHeight: blockHeight)
        row(blockHeight: blockHeight, width: width, height: height)
        col(blockWidth: blockWidth, width: width, height: height)
        
    }
    
    func factoryHall1(blockWidth: Int, blockHeight: Int) {
        var obstacles:[Obstacle] = []

        for i in 0...19 where (i != 11) && (i != 12) && (i != 13) {
            obstacles.append(Obstacle(x: i, y: 23))
        }
        
        for i in 10...14 {
            obstacles.append(Obstacle(x: i, y: 26))
        }

        for obstacle in obstacles {
            let rec = CGRect(x: obstacle.x * blockWidth, y: obstacle.y * blockHeight, width: blockWidth, height: blockHeight);
            print(obstacle.x, obstacle.y)
            print(obstacle.x * blockWidth,obstacle.y * blockHeight, blockWidth, blockHeight)
            let pathObs = UIBezierPath(rect: rec)
            UIColor.blue.setFill()
            pathObs.fill()
        }
    }

    func row(blockHeight: Int, width: Int, height: Int) {
        let currentWidth = 0
        var currentHeight = blockHeight
        
        for i in 1...Constants.columns {
            let plusPath = UIBezierPath()
            
            plusPath.lineWidth = Constants.plusLineWidth
            
            plusPath.move(to: CGPoint(
                x: currentWidth,
                y: currentHeight))
            
            plusPath.addLine(to: CGPoint(
                x: currentWidth + width,
                y: currentHeight))
            
            UIColor.black.setStroke()
            plusPath.stroke()
            
            currentHeight = blockHeight * i
        }
    }
    
    func col(blockWidth: Int, width: Int, height: Int) {
        
        var currentWidth1 = blockWidth
        let currentHeight1 = 0
        
        for i in 1...Constants.rows {
        
            let plusPath1 = UIBezierPath()
        
            plusPath1.lineWidth = Constants.plusLineWidth
        
            plusPath1.move(to: CGPoint(
            x: currentWidth1,
            y: currentHeight1))
        
            plusPath1.addLine(to: CGPoint(
            x: currentWidth1,
            y: currentHeight1 + height))
        
            UIColor.black.setStroke()
            plusPath1.stroke()
        
            currentWidth1 = blockWidth * i
        }
    }
    
}

public class Obstacle {
    let x : Int
    let y : Int
    
    init(x : Int, y: Int) {
        self.x = x
        self.y = (-1 * (y - Constants.columns)) - 1
    }
}
