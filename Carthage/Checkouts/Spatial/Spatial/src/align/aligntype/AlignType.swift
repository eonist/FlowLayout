import Foundation
/**
 * Single align type
 * - Todo: ⚠️️ Reference AlignType in HorAlign and VerAlign, and prob use CenterX,CenterY naming instead
 * - Note: Use .rawValue if you want to get the string "topLeft"
 */
public enum AlignType: String {
   case left
   case right
   case top
   case bottom
   case centerHor
   case centerVer
}
