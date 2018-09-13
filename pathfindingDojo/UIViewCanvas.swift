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

class UIViewCanvas: UIView {
    
    override func draw(_ rect: CGRect) {
        let blockWidth = Int(floor(Double(Int(bounds.width) / Constants.columns)))
        let blockHeight = Int(floor(Double(Int(bounds.height) / Constants.rows)))
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        
        drawBackground(rect: rect)
        drawFactoryHall1(blockWidth: blockWidth, blockHeight: blockHeight)
        drawRow(blockHeight: blockHeight, width: width)
        drawCol(blockWidth: blockWidth, height: height)
        
    }
    
    func drawBackground(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.lightGray.setFill()
        path.fill()
    }
    
    func drawFactoryHall1(blockWidth: Int, blockHeight: Int) {
        var obstacles:[Obstacle] = []
        for i in 0...19 where (i != 11) && (i != 12) && (i != 13) {
            obstacles.append(Obstacle(x: i, y: 23))
        }
        for i in 10...14 {
            obstacles.append(Obstacle(x: i, y: 26))
        }
        
        for obstacle in obstacles {
            let rec = CGRect(x: obstacle.x * blockWidth, y: obstacle.y * blockHeight, width: blockWidth, height: blockHeight);
            let pathObs = UIBezierPath(rect: rec)
            UIColor.blue.setFill()
            pathObs.fill()
        }
    }

    func drawRow(blockHeight: Int, width: Int) {
        var currentHeight = blockHeight
        
        for col in 1...Constants.rows {
            let rowPath = UIBezierPath()
            
            rowPath.move(to: CGPoint(x: 0, y: currentHeight))
            
            rowPath.addLine(to: CGPoint(x: 0 + width, y: currentHeight))
            
            UIColor.black.setStroke()
            rowPath.stroke()
            
            currentHeight = blockHeight * col
        }
    }
    
    func drawCol(blockWidth: Int, height: Int) {
        var currentWidth1 = blockWidth
        
        for row in 1...Constants.columns {
            let colPath = UIBezierPath()
        
            colPath.move(to: CGPoint(x: currentWidth1, y: 0))
        
            colPath.addLine(to: CGPoint(x: currentWidth1, y: 0 + height))
        
            UIColor.black.setStroke()
            colPath.stroke()
        
            currentWidth1 = blockWidth * row
        }
    }
    
}

public class Obstacle {
    let x : Int
    let y : Int
    
    init(x : Int, y: Int) {
        self.x = x
        self.y = (-1 * (y - Constants.rows)) - 1
    }
}
