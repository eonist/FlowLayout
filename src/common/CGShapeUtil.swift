import UIKit

internal class CGShapeUtil {
   /**
    * Draw line
    * NOTE: remember to: shapeLayer.addSublayer(lineLayer)
    * It's also possible to do this with UIBezierPath
    * let path:UIBezierPath = {
    *    let aPath = UIBezierPath.init()//cgPath: linePath
    *    aPath.move(to: p1)
    *    aPath.addLine(to: p2)
    *    aPath.close()//Keep using the method addLineToPoint until you get to the one where about to close the path
    *    return aPath
    * }()
    */
   static func drawLine(lineLayer:CAShapeLayer, line:(p1: CGPoint, p2: CGPoint), style:(stroke: UIColor,strokeWidth: CGFloat)) -> CAShapeLayer{
      let lineLayer:CAShapeLayer = .init()
      let path: CGMutablePath = .init()
      path.move(to: line.p1)
      path.addLine(to: line.p2)
      lineLayer.path = path/*Setup the CAShapeLayer with the path, colors, and line width*/
      lineLayer.strokeColor = style.stroke.cgColor
      lineLayer.lineWidth = style.strokeWidth
      lineLayer.lineCap = .butt
      return lineLayer
   }
   /**
    * Draws circle
    * PARAM: progress: 0-1
    * - TODO: ⚠️️ write method for nsbez... that use bezierPath.appendBezierPathWithArcWithCenter as init
    */
   static func drawCircle(with circleLayer:CAShapeLayer, circle:(center:CGPoint,radius:CGFloat), style:(fill:UIColor, stroke:UIColor, strokeWidth:CGFloat), progress:CGFloat) -> CAShapeLayer{
      let origin:CGPoint = .init(x: circle.center.x-circle.radius, y: circle.center.y-circle.radius)
      let size:CGSize = .init(width:circle.radius*2,height:circle.radius*2)
      let rect:CGRect = .init(origin:origin , size: size)
      //      let circlePath:BezierPath = .init(ovalIn: rect)
      let cgPath:CGPath = .init(ellipseIn: rect, transform: nil)
      //UIBezierPath(arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
      circleLayer.path = cgPath//circlePath.cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      circleLayer.fillColor = style.fill.cgColor
      circleLayer.strokeColor = style.stroke.cgColor
      circleLayer.lineWidth = style.strokeWidth
      circleLayer.lineCap = .round
      circleLayer.strokeEnd = progress/*Sets progress of the stroke between predefined start and predefined end*/
      return circleLayer
   }
}
