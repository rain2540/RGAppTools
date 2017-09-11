//
//  String+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

infix operator >
func > (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) == .orderedDescending
}

infix operator >=
func >= (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) != .orderedAscending
}

infix operator <
func < (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) == .orderedAscending
}

infix operator <=
func <= (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) != .orderedDescending
}

extension String {
    public var rat: StringExtension {
        return StringExtension(string: self)
    }

    public static var rat: StringExtension.Type {
        return StringExtension.self
    }

    /// 获取指定位置字符
    public subscript(index: Int) -> Character {
        return self[characters.index(startIndex, offsetBy: index)]
    }

    /// 获取指定范围字符串
    public subscript(subRange: Range<Int>) -> String {
        return self[characters.index(startIndex, offsetBy: subRange.lowerBound) ..< characters.index(startIndex, offsetBy: subRange.upperBound)]
    }

    /// 在字符串指定位置插入一个字符
    ///
    /// - Parameters:
    ///   - newElement: 插入的字符
    ///   - i: 指定位置索引
    public mutating func rat_insert(_ newElement: Character, at i: Int) {
        insert(newElement, at: index(startIndex, offsetBy: i))
    }

    /// 替换字符串指定范围内容
    ///
    /// - Parameters:
    ///   - subrange: 指定范围
    ///   - newValues: 用于替换的字符串
    public mutating func rat_replace(subrange: Range<Int>, with newValues: String) {
        let start = index(startIndex, offsetBy: subrange.lowerBound)
        let end = index(startIndex, offsetBy: subrange.upperBound)
        replaceSubrange(start ..< end, with: newValues)
    }

    /// 移除字符串指定位置的字符, 并返回被移除的字符
    ///
    /// - Parameter i: 指定位置索引
    /// - Returns: 被移除的字符
    public mutating func rat_remove(at i: Int) -> Character {
        return remove(at: index(startIndex, offsetBy: i))
    }

    /// 移除字符串指定范围的内容
    ///
    /// - Parameter subrange: 指定的范围
    public mutating func rat_remove(subrange: Range<Int>) {
        let start = index(startIndex, offsetBy: subrange.lowerBound)
        let end = index(startIndex, offsetBy: subrange.upperBound)
        removeSubrange(start ..< end)
    }
}

public struct StringExtension {
    private var string: String

    fileprivate init(string: String) {
        self.string = string
    }

    // MARK: Clear nil
    /// 清除 nil 和 NSNull 对象，并返回字符串
    ///
    /// - Parameter obj: 未经处理的对象
    /// - Returns: 经处理后的字符串
    public static func withoutNil(_ obj: Any?) -> String {
        guard let obj = obj else {
            return ""
        }

        if obj is NSNull {
            return ""
        } else if obj is NSNumber {
            return "\(obj)"
        } else {
            return "\(obj)"
        }
    }

    //  MARK: Size
    /// 返回按照给定字体绘制时, 字符串所占有的边界大小
    ///
    /// - Parameter font: 要应用于字符串的字体
    /// - Returns: 按照给定字体绘制时, 字符串所占有的边界大小
    public func size(withFont font: UIFont) -> CGSize {
        return (string as NSString).size(attributes: [NSFontAttributeName: font])
    }

    /// 返回按照给定属性绘制时, 字符串所占有的边界大小
    ///
    /// - Parameter attrs: 要应用于字符串的文本属性的字典
    /// - Returns: 按照给定属性绘制时, 字符串所占有的边界大小
    public func size(attributes attrs: [String: Any]? = nil) -> CGSize {
        return (string as NSString).size(attributes: attrs)
    }

    //  MARK: Trans
    /// String 对应的 Boolean 值
    public var boolValue: Bool {
        return (string as NSString).boolValue
    }

    /// String 对应的 Int 值
    public var intValue: Int? {
        return Int(string)
    }

    /// String 对应的 Float 值
    public var floatValue: Float? {
        return Float(string)
    }

    /// String 对应的 Double 值
    public var doubleValue: Double? {
        return Double(string)
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

    // MARK: Basic
    /// 字符串长度
    public var length: Int {
        return string.characters.distance(from: string.startIndex, to: string.endIndex)
    }

    /// 截取字符串(从首个字符到指定位置, 不包含指定位置的字符)
    ///
    /// - Parameter index: 指定位置索引
    /// - Returns: 截取到的字符串
    public func substring(to index: Int) -> String {
        return string.substring(to: string.characters.index(string.startIndex, offsetBy: index))
    }

    /// 截取字符串(从制定位置到最后一个字符, 包含指定位置的字符)
    ///
    /// - Parameter index: 指定位置索引
    /// - Returns: 截取到的字符串
    public func substring(from index: Int) -> String {
        return string.substring(from: string.characters.index(string.startIndex, offsetBy: index))
    }

    /// 截取字符串(指定范围)
    ///
    /// - Parameter range: 指定的范围
    /// - Returns: 截取到的字符串
    public func substring(with range: Range<Int>) -> String {
        let start = string.characters.index(string.startIndex, offsetBy: range.lowerBound)
        let end = string.characters.index(string.startIndex, offsetBy: range.upperBound)
        return string.substring(with: start ..< end)
    }
}
