//
//  PushButton.swift
//  pathfindingDojo
//
//  Created by Patrick Weber on 12.09.18.
//  Copyright © 2018 Patrick Weber. All rights reserved.
//

import UIKit

private struct Constants {
    static var columns: Int = 20
    static var rows: Int = 40
}

@IBDesignable

class UIViewCanvas: UIView {
    
    override func draw(_ rect: CGRect) {
        var blockWidth = Int(floor(Double(Int(bounds.width) / Constants.columns)))
        var blockHeight = Int(floor(Double(Int(bounds.height) / Constants.rows)))
        if blockWidth > blockHeight {
            blockWidth = blockHeight
        } else {
            blockHeight = blockWidth
        }
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        let widthBorder = width - blockWidth * Constants.columns
        let heightBorder = height - blockHeight * Constants.rows
        
        drawBackground(rect: rect)
        drawFactoryHall1(blockWidth: blockWidth, blockHeight: blockHeight)
        drawRobot(blockWidth: blockWidth, blockHeight: blockHeight)
        drawGoal(blockWidth: blockWidth, blockHeight: blockHeight)
        drawRow(blockHeight: blockHeight, width: width, height: height, widthBorder: widthBorder, heightBorder: heightBorder)
        drawCol(blockWidth: blockWidth, width: width, height: height, widthBorder: widthBorder, heightBorder: heightBorder)
        
    }
    
    func drawBackground(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.lightGray.setFill()
        path.fill()
    }
    
    func drawRobot(blockWidth: Int, blockHeight: Int) {
        let robot = squareBlock(x: 12,y: 30)
        let rec = CGRect(x: robot.x * blockWidth, y: robot.y * blockHeight, width: blockWidth, height: blockHeight);
        let pathObs = UIBezierPath(rect: rec)
        UIColor.red.setFill()
        pathObs.fill()
    }
    
    func drawGoal(blockWidth: Int, blockHeight: Int) {
        let goal = squareBlock(x: 10, y: 3)
        let rec = CGRect(x: goal.x * blockWidth, y: goal.y * blockHeight, width: blockWidth, height: blockHeight);
        let pathObs = UIBezierPath(rect: rec)
        UIColor.green.setFill()
        pathObs.fill()
    }
    
    func drawFactoryHall1(blockWidth: Int, blockHeight: Int) {
        for obstacle in hall(hallNumber: 1) {
            let rec = CGRect(x: obstacle.x * blockWidth, y: obstacle.y * blockHeight, width: blockWidth, height: blockHeight);
            let pathObs = UIBezierPath(rect: rec)
            UIColor.blue.setFill()
            pathObs.fill()
        }
    }
    
    func hall(hallNumber: Int) -> Array<squareBlock> {
        if hallNumber == 1 {
            var obstacles:[squareBlock] = []
            for i in 0...19 where (i != 11) && (i != 12) && (i != 13) {
                obstacles.append(squareBlock(x: i, y: 23))
            }
            for i in 10...14 {
                obstacles.append(squareBlock(x: i, y: 26))
            }
            
            return obstacles
        } else if hallNumber == 2 {
            var obstacles:[squareBlock] = []
            for i in 0...25 where (i != 5) && (i != 12) && (i != 13) {
                obstacles.append(squareBlock(x: i, y: 23))
            }
            for i in 0...14{
                obstacles.append(squareBlock(x: i, y: 17))
            }
            for i in 13...19{
                obstacles.append(squareBlock(x: i, y: 19))
            }
            for i in 10...14 {
                obstacles.append(squareBlock(x: i, y: 26))
            }
            return obstacles
        }
        return []
    }

    func drawRow(blockHeight: Int, width: Int, height: Int, widthBorder: Int, heightBorder: Int) {
        var currentHeight = blockHeight
        
        for col in 1...Constants.rows {
            let rowPath = UIBezierPath()
            
            rowPath.move(to: CGPoint(x: 0, y: currentHeight))
            
            rowPath.addLine(to: CGPoint(x: width - widthBorder, y: currentHeight))
            
            UIColor.black.setStroke()
            rowPath.stroke()
            
            currentHeight = blockHeight * col
        }
        let rec = CGRect(x: 0, y: height - heightBorder, width: width, height: height);
        let pathObs = UIBezierPath(rect: rec)
        UIColor.black.setFill()
        pathObs.fill()
    }
    
    func drawCol(blockWidth: Int, width: Int, height: Int, widthBorder: Int, heightBorder: Int) {
        var currentWidth1 = blockWidth
        
        for row in 1...Constants.columns {
            let colPath = UIBezierPath()
        
            colPath.move(to: CGPoint(x: currentWidth1, y: 0))
        
            colPath.addLine(to: CGPoint(x: currentWidth1, y: 0 + height))
        
            UIColor.black.setStroke()
            colPath.stroke()
        
            currentWidth1 = blockWidth * row
        }
        let rec = CGRect(x: width - widthBorder, y: 0, width: width, height: height);
        let pathObs = UIBezierPath(rect: rec)
        UIColor.black.setFill()
        pathObs.fill()
    }
    
}

public class squareBlock {
    let x : Int
    let y : Int
    
    init(x : Int, y: Int) {
        self.x = x
        self.y = (-1 * (y - Constants.rows)) - 1
    }
}
