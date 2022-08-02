//
//  Bundle+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/12.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit


/// 应用版本号 Build 字段格式
///
/// - normal: 括号 形如: 1.0.0 (29)
/// - dot: 点  形如: 1.0.0.29
public enum BuildVersionFormat {
  /// 应用版本号 Build 字段格式 - 括号 (默认值) 形如: 1.0.0 (29)
  case normal
  /// 应用版本号 Build 字段格式 - 点 形如: 1.0.0.29
  case dot
}


// MARK: - App

extension RGAppTools where Base: Bundle {

  /// 应用的 Bundle Identifier
  public static var appIdentifier: String {
    return Bundle.rat.mainBundleIdentifier ?? ""
  }

  /// 应用显示名称
  public static var appDisplayName: String {
    return Bundle.rat.mainBundleDisplayName ?? ""
  }

  /// 应用版本号
  public static var appVersion: String {
    return appVersion(format: .normal)
  }

  /// 应用版本号
  /// - Parameter format: 输出的格式
  /// - Returns: 表示应用版本号的字符串
  public static func appVersion(format: BuildVersionFormat) -> String {
    guard let version = mainBundleVersion, let build = mainBundleBuild else {
      return ""
    }
    return format == .normal ? "\(version) (\(build))" : "\(version).\(build)"
  }

}


// MARK: - Main Bundle

extension RGAppTools where Base: Bundle {

  /// Main Bundle 路径
  public static var mainBundlePath: String {
    return Bundle.main.bundlePath
  }

  /// Main Bundle Info Dictionary
  public static var mainBundleInfo: [String: Any]? {
    return Bundle.main.infoDictionary
  }

  /// Main Bundle Identifier
  public static var mainBundleIdentifier: String? {
    return Bundle.main.rat.identifier
  }

  /// Main Bundle Name
  public static var mainBundleName: String? {
    return Bundle.main.rat.name
  }

  /// Main Bundle Display Name
  public static var mainBundleDisplayName: String? {
    return Bundle.main.rat.displayName
  }

  /// Main Bundle Version Number
  public static var mainBundleVersion: String? {
    return Bundle.main.rat.version
  }

  /// Main Bundle Build Number
  public static var mainBundleBuild: String? {
    return Bundle.main.rat.build
  }

  /// 获取 Main Bundle 中的文件路径
  /// - Parameters:
  ///   - name: 文件名
  ///   - ext: 文件后缀名
  /// - Returns: Main Bundle 中文件的路径
  public static func path(
    forResourceInMainBundle name: String?,
    ofType ext: String?) -> String?
  {
    return Bundle.main.path(forResource: name, ofType: ext)
  }

  /// 获取 Main Bundle 中文件内的字符串
  /// - Parameters:
  ///   - name: 文件名
  ///   - ext: 文件后缀名
  /// - Returns: Main Bundle 中文件内的字符串
  public static func string(
    pathForResourceInMainBundle name: String?,
    ofType ext: String?) -> String?
  {
    return Bundle.main.rat.string(forResource: name, ofType: ext)
  }

}


// MARK: - Bundle

extension RGAppTools where Base: Bundle {

  /// Bundle Identifier
  public var identifier: String? {
    return base.infoDictionary?["CFBundleIdentifier"] as? String
  }

  /// Bundle Name
  public var name: String? {
    return base.infoDictionary?["CFBundleName"] as? String
  }

  /// Bundle Display Name
  public var displayName: String? {
    return base.infoDictionary?["CFBundleDisplayName"] as? String
  }

  /// Bundle Version Number
  public var version: String? {
    return base.infoDictionary?["CFBundleShortVersionString"] as? String
  }

  /// Bundle Build Number
  public var build: String? {
    return base.infoDictionary?["CFBundleVersion"] as? String
  }

  /// 获取 Bundle 中文件内的字符串
  /// - Parameters:
  ///   - name: 文件名
  ///   - ext: 文件后缀名
  /// - Returns: Bundle 中文件内的字符串
  public func string(
    forResource name: String?,
    ofType ext: String?) -> String?
  {
    guard let path = base.path(forResource: name, ofType: ext) else {
      print("RGAppTools String init with path for resource in bundle error: \n", "path is nil")
      return nil
    }
    do {
      return try String(contentsOfFile: path)
    } catch {
      print("RGAppTools String init with path for resource in bundle error: \n", error)
      return nil
    }
  }

  /// 获取 Bundle 中的图片路径
  /// - Parameters:
  ///   - name: 图片文件名
  ///   - ext: 图片文件名后缀
  /// - Returns: Bundle 中的图片路径
  public func imagePath(
    forResource name: String?,
    ofType ext: String?) -> String?
  {
    guard let name = name else { return nil }
    guard let ext = ext else { return nil }

    var scaleString = "@2x"
    if UIScreen.main.scale == 3.0 {
      scaleString = "@3x"
    } else if UIScreen.main.scale == 1.0 {
      scaleString = "@1x"
    }

    guard let path = base.path(forResource: name + scaleString, ofType: ext) else {
      return base.path(forResource: name, ofType: ext)
    }
    return path
  }

}
