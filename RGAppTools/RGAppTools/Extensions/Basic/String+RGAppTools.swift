//
//  String+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import UIKit

extension String {
    public var rat: StringExtension {
        return StringExtension(string: self)
    }

    public static var rat: StringExtension.Type {
        return StringExtension.self
    }


    /// 判断字符串是否为 nil, 为空, 或只包括空字符
    public var rat_isBlank: Bool {
        return allSatisfy{ $0.isWhitespace }
    }

    /// 获取指定位置字符
    public subscript(original: Int) -> String {
        guard original < endIndex.utf16Offset(in: self) else {
            print("\(#function): original '\(original)' out of end index")
            return ""
        }
        guard original >= startIndex.utf16Offset(in: self) else {
            print("\(#function): original '\(original)' out of start index")
            return ""
        }
        return String(self[index(startIndex, offsetBy: original)])
    }

    /// 获取指定范围字符串
    public subscript(subRange: Range<Int>) -> String {
        guard let startIndex = rat_validStartIndex(original: subRange.lowerBound),
            let endIndex = rat_validEndIndex(original: subRange.upperBound),
            startIndex < endIndex else {
                print("\(#function): sub-range '\(subRange)' out of range")
                return ""
        }
        return String(self[startIndex ..< endIndex])
    }

    /// 在字符串指定位置插入一个字符
    ///
    /// - Parameters:
    ///   - newElement: 插入的字符
    ///   - i: 指定位置索引
    public mutating func rat_insert(_ newElement: Character, at i: Int) {
        guard (i <= endIndex.utf16Offset(in: self)) && (i >= startIndex.utf16Offset(in: self)) else {
            print("\(#function): index '\(i)' out of range")
            return
        }
        insert(newElement, at: index(startIndex, offsetBy: i))
    }

    /// 替换字符串指定范围内容
    ///
    /// - Parameters:
    ///   - subrange: 指定范围
    ///   - newValues: 用于替换的字符串
    public mutating func rat_replace(subrange: Range<Int>, with newValues: String) {
        let lowerBoundCondition = (subrange.lowerBound >= startIndex.utf16Offset(in: self))
        let upperBoundCondition = subrange.upperBound <= endIndex.utf16Offset(in: self)
        guard lowerBoundCondition && upperBoundCondition else {
            print("\(#function): sub-range '\(subrange)' out of range")
            return
        }
        let start = index(startIndex, offsetBy: subrange.lowerBound)
        let end = index(startIndex, offsetBy: subrange.upperBound)
        replaceSubrange(start ..< end, with: newValues)
    }

    /// 移除字符串指定位置的字符, 并返回被移除的字符
    ///
    /// - Parameter i: 指定位置索引
    /// - Returns: 被移除的字符
    public mutating func rat_remove(at i: Int) -> Character? {
        guard (i < endIndex.utf16Offset(in: self)) && (i >= startIndex.utf16Offset(in: self)) else {
            print("\(#function): index '\(i)' out of range")
            return nil
        }
        return remove(at: index(startIndex, offsetBy: i))
    }

    /// 移除字符串指定范围的内容
    ///
    /// - Parameter subrange: 指定的范围
    public mutating func rat_remove(subrange: Range<Int>) {
        let lowerBoundCondition = (subrange.lowerBound >= startIndex.utf16Offset(in: self))
        let upperBoundCondition = subrange.upperBound <= endIndex.utf16Offset(in: self)
        guard lowerBoundCondition && upperBoundCondition else {
            print("\(#function): sub-range '\(subrange)' out of range")
            return
        }
        let start = index(startIndex, offsetBy: subrange.lowerBound)
        let end = index(startIndex, offsetBy: subrange.upperBound)
        removeSubrange(start ..< end)
    }

    /// 如果含有某个后缀，则删除掉
    /// - Parameter suffix: 将要删除的后缀
    public mutating func rat_removeLast(ifHas suffix: String) {
        if hasSuffix(suffix){
            removeLast()
        }
    }


    /**
     * 以下三个方法对 String 的索引值做如下的检验
     * 1.索引值是否在合理的范围内, 如果不合理, 就拉回到最近的边界上
     * 2.索引值作为一个起始点 / 终止点是否合理, 如果不合理, 就返回 nil
     */

    /// 检验索引值是否可以作为起始点, 否则返回 nil
    ///
    /// - Parameter original: 待检验的索引值
    /// - Returns: 经过检验的有效索引值或 nil
    fileprivate func rat_validStartIndex(original: Int) -> String.Index? {
        guard original < endIndex.utf16Offset(in: self) else { return nil }
        return rat_validIndex(original: original)
    }

    /// 检验索引值是否可以作为终止点, 否则返回 nil
    ///
    /// - Parameter original: 待检验的索引值
    /// - Returns: 经过检验的有效索引值或 nil
    fileprivate func rat_validEndIndex(original: Int) -> String.Index? {
        guard original >= startIndex.utf16Offset(in: self) else { return nil }
        return rat_validIndex(original: original)
    }

    /// 检验索引值是否在合理的范围内, 不合理则拉回到最近的边界上
    ///
    /// - Parameter original: 待检验的索引值
    /// - Returns: 经过检验的有效索引值
    private func rat_validIndex(original: Int) -> String.Index {
        switch original {
        case ...startIndex.utf16Offset(in: self)    :   return startIndex
        case endIndex.utf16Offset(in: self)...      :   return endIndex
        default                                     :   return index(startIndex, offsetBy: original)
        }
    }
}


//  MARK: -
public struct StringExtension {
    private var string: String

    fileprivate init(string: String) {
        self.string = string
    }


    // MARK: - Basic
    /// 字符串长度
    public var length: Int {
        return string.distance(from: string.startIndex, to: string.endIndex)
    }

    /// 截取字符串(从首个字符到指定位置, 不包含指定位置的字符)
    ///
    /// - Parameter index: 指定位置索引
    /// - Returns: 截取到的字符串
    public func substring(upTo index: Int) -> String {
        guard (index <= string.count) && (index > string.startIndex.utf16Offset(in: string)) else {
            print("\(#function): index '\(index)' out of range")
            return ""
        }
        return String(string.prefix(upTo: string.index(string.startIndex, offsetBy: index)))
    }

    /// 截取字符串(从首个字符到指定位置, 包含指定位置的字符)
    ///
    /// - Parameter index: 指定位置索引
    /// - Returns: 截取到的字符串
    public func substring(through index: Int) -> String {
        guard (index < string.endIndex.utf16Offset(in: string)) && (index >= string.startIndex.utf16Offset(in: string)) else {
            print("\(#function): index '\(index)' out of range")
            return ""
        }
        return String(string.prefix(through: string.index(string.startIndex, offsetBy: index)))
    }

    /// 截取字符串(从制定位置到最后一个字符, 包含指定位置的字符)
    ///
    /// - Parameter index: 指定位置索引
    /// - Returns: 截取到的字符串
    public func substring(from index: Int) -> String {
        guard (index < string.endIndex.utf16Offset(in: string)) && (index >= string.startIndex.utf16Offset(in: string)) else {
            print("\(#function): index '\(index)' out of range")
            return ""
        }
        return String(string.suffix(from: string.index(string.startIndex, offsetBy: index)))
    }
    
    /// 截取字符串(指定范围)
    ///
    /// - Parameter range: 指定的范围
    /// - Returns: 截取到的字符串
    public func substring(with range: Range<Int>) -> String {
        guard let startIndex = string.rat_validStartIndex(original: range.lowerBound),
            let endIndex = string.rat_validEndIndex(original: range.upperBound),
            startIndex < endIndex else {
                print("\(#function): sub-range '\(range)' out of range")
                return ""
        }
        let startOffset = startIndex.utf16Offset(in: string)
        let endOffset = endIndex.utf16Offset(in: string)
        let start = string.index(string.startIndex, offsetBy: startOffset)
        let validLength = endOffset - startOffset
        let str = String(string.suffix(from: start))
        return String(str.prefix(validLength))
    }

    /// 如果含有某个后缀，则删除掉，并返回删除后缀得到的字符串
    /// - Parameter suffix: 将要删除的后缀
    public func removingLast(ifHas suffix: String) -> String {
        var resultString = string
        if resultString.hasSuffix(suffix) {
            resultString.removeLast()
        }
        return resultString
    }
}


// MARK: - Clear nil
extension StringExtension {

    /// 清除 nil 和 NSNull 对象，以及其他需要清除的字符串，并返回字符串
    /// - Parameters:
    ///   - otherConditions: 其他需要清除的字符串
    ///   - obj: 未经处理的对象
    public static func clearNil(and otherConditions: String..., for obj: Any?) -> String {
        guard let obj = obj else { return "" }

        if obj is NSNull {
            return ""
        } else {
            let condition = otherConditions.reduce(false) { (res, conditionItem) -> Bool in
                res || "\(obj)" == conditionItem
            }
            if condition {
                return ""
            } else {
                return "\(obj)"
            }
        }
    }

    /// 清除 nil 和 NSNull 对象，以及其他需要清除的字符串，并返回字符串
    /// - Parameters:
    ///   - otherConditions: 其他需要清除的字符串
    ///   - obj: 未经处理的对象
    public static func clearNil(and otherConditions: [String] = [], for obj: Any?) -> String {
        guard let obj = obj else { return "" }

        if obj is NSNull {
            return ""
        } else {
            let condition = otherConditions.reduce(false) { (res, conditionItem) -> Bool in
                res || "\(obj)" == conditionItem
            }
            if condition {
                return ""
            } else {
                return "\(obj)"
            }
        }
    }

}


//  MARK: - Size
extension StringExtension {
    /// 返回按照给定字体绘制时, 字符串所占有的边界大小
    ///
    /// - Parameter font: 要应用于字符串的字体
    /// - Returns: 按照给定字体绘制时, 字符串所占有的边界大小
    public func size(withFont font: UIFont) -> CGSize {
        return (string as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }

    /// 返回按照给定属性绘制时, 字符串所占有的边界大小
    ///
    /// - Parameter attrs: 要应用于字符串的文本属性的字典
    /// - Returns: 按照给定属性绘制时, 字符串所占有的边界大小
    public func size(attributes attrs: [NSAttributedString.Key: Any]? = nil) -> CGSize {
        return (string as NSString).size(withAttributes: attrs)
    }
}


//  MARK: - Trans
extension StringExtension {
    /// String 对应的 Boolean 值
    public var boolValue: Bool {
        return (string as NSString).boolValue
    }

    /// String 对应的 Int? 值
    public var int: Int? {
        return Int(string)
    }

    /// String 对应的 Int 值
    public var intValue: Int {
        return string.rat.int ?? 0
    }

    /// String 对应的 Float? 值
    public var float: Float? {
        return Float(string)
    }

    /// String 对应的 Float 值
    public var floatValue: Float {
        return string.rat.float ?? 0.0
    }

    /// String 对应的 Double? 值
    public var double: Double? {
        return Double(string)
    }

    /// String 对应的 Double 值
    public var doubleValue: Double {
        return string.rat.double ?? 0.0
    }

    /// String 对应的 Base64 Data
    public var base64Data: Data? {
        return Data(base64Encoded: string)
    }

    /// String 对应的 Base64 Image
    public var base64Image: UIImage? {
        guard let data = base64Data else { return nil }
        return UIImage(data: data)
    }

    /// 将字符串转换为 JSON 对象
    ///
    /// - Returns: 转换得到的 JSON 对象
    public func toObject() -> Any? {
        let str = string.replacingOccurrences(of: "\0", with: "")
        guard let data = str.data(using: String.Encoding.utf8) else {
            print("RGAppTools String to object Error:\n", "Fail to get data")
            return nil
        }
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let error as NSError {
            print("RGAppTools String to object Error:\n", error)
            return nil
        }
    }
}


// MARK: - Attributed String
extension StringExtension {
    /// 返回为 keyword 设定颜色、字体的 attributed string
    ///
    /// - Parameters:
    ///   - keyword: 关键词
    ///   - color: keyword 的颜色
    ///   - font: keyword 的字体
    /// - Returns: 完成 keyword 颜色、字体设定的 attributed string
    public func attributedString(keyword: String?,
                                 color: UIColor = UIColor.black,
                                 font: UIFont = UIFont.systemFont(ofSize: 17.0)) -> NSMutableAttributedString
    {
        let attributedString = NSMutableAttributedString(string: string)
        guard let keyword = keyword else { return attributedString }
        let keywordRange = (string as NSString).range(of: keyword)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: keywordRange)
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: keywordRange)
        return attributedString
    }
}


extension StringExtension {

    /// 依据默认处理方式返回的 Decimal Number 对应的字符串
    public var defaultBehaviorDecinalNumberString: String {
        return String(format: "%@", string.rat.defaultBehaviorDecinalNumber)
    }

    /// 依据默认处理方式返回字符串对应的 Decimal Number
    public var defaultBehaviorDecinalNumber: NSDecimalNumber {
        return string.rat.decinalNumber(behavior: NSDecimalNumberHandler.rat.defaultBehavior)
    }

    /// 依据数值处理方式返回字符串对应的 Decimal Number
    /// - Parameter behavior: 数值处理方式
    public func decinalNumber(behavior: NSDecimalNumberBehaviors? = nil) -> NSDecimalNumber {
        return NSDecimalNumber(string: string).rounding(accordingToBehavior: behavior)
    }

}
