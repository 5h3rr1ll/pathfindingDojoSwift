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
        static var plusLineWidth: CGFloat = 1
        static var plusButtonScale: CGFloat = 1
        static var halfPointShift: CGFloat = 0.5
    }
    
    override func draw(_ rect: CGRect) {
        let rowAmount: Int = 20
        let colAmount: Int = 40
        
        let blockWidth = Int(floor(Double(Int(bounds.width) / rowAmount)))
        let blockHeight = Int(floor(Double(Int(bounds.height) / colAmount)))
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        print(blockWidth, blockHeight)
        
        let path = UIBezierPath(rect: rect)
        UIColor.lightGray.setFill()
        path.fill()
        row(blockHeight: blockHeight, width: width, height: height)
        col(blockWidth: blockWidth, width: width, height: height)
        drawObstacles(blockWidthMult: blockWidth, blockHeightMult: blockHeight)
        
    }
    
    func drawObstacles(blockWidthMult: Int, blockHeightMult: Int) {
        var obstacles:[Obstacle] = []

        let obstacle1 = Obstacle(x: 5,y: 5)
        obstacles.append(obstacle1)
        let obstacle2 = Obstacle(x: 10,y: 10)
        obstacles.append(obstacle2)

        for obstacle in obstacles {
            let rec = CGRect(x: obstacle.x * blockWidthMult, y: obstacle.y * Int(bounds.height / 40), width: Int(bounds.width / 20), height: Int(bounds.height / 40));
            let pathObs = UIBezierPath(rect: rec)
            UIColor.green.setFill()
            pathObs.fill()
        }
    }

    func row(blockHeight: Int, width: Int, height: Int) {
        let currentWidth = 0
        var currentHeight = blockHeight
        
        while currentHeight < height {
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
            
            currentHeight += height / 40
        }
    }
    
    func col(blockWidth: Int, width: Int, height: Int) {
        
        var currentWidth1 = blockWidth
        let currentHeight1 = 0
        
        while currentWidth1 < width{
            
            print(currentWidth1)
        
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
        
            currentWidth1 += width / 20
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
