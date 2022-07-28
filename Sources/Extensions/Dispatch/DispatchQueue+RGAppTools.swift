//
//  DispatchQueue+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/12.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: DispatchQueue {

  /// 只执行一次与唯一 Token 相关的代码块。代码是线程安全的, 即使在存在多线程调用的情况下, 也只会执行一次代码。
  /// - Parameters:
  ///   - token: 唯一 token 的名称, 采用反向 DNS 风格, 如: com.apple
  ///   - task: 只执行一次的代码块
  public static func once(token: String, task: () -> Void) {
    objc_sync_enter(Base.self)

    defer {
      objc_sync_exit(Base.self)
    }

    if Base.onceToken.contains(token) {
      return
    }
    Base.onceToken.append(token)

    task()
  }

  /// 切换到主队列异步执行 (如果已在主线程，则不切换，直接执行)
  /// - Parameter execute: 在主队列异步执行的代码块
  public static func mainAsync(execute: @escaping () -> Void) {
    if Thread.current.isMainThread {
      execute()
    } else {
      Base.main.async { execute() }
    }
  }

  /// 切换到主队列延迟执行 (如果已在主线程，则不切换，直接延迟执行)
  /// - Parameters:
  ///   - delay: 延迟时间 (单位: 秒)
  ///   - execute: 延迟执行的代码块
  public static func mainAsyncAfter(
    _ delay: TimeInterval,
    execute: @escaping () -> Void)
  {
    if Thread.current.isMainThread {
      Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in execute() }
    } else {
      Base.main.asyncAfter(deadline: .now() + delay) { execute() }
    }
  }

  /// 在指定时间后将工作项提交到调度队列以异步执行。
  /// - Parameters:
  ///   - delay: 从当前时间为起点，应该执行工作项的时间间隔（ 单位：秒），以`DispatchTime`的形式给出。
  ///   - qos: 应该执行工作项的 QoS。默认为“DispatchQoS.unspecified”。
  ///   - flags: 控制工作项执行环境的标志。
  ///   - execute: 要在队列中调用的工作项。
  public func after(
    _ delay: TimeInterval,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    execute: @escaping () -> Void)
  {
    base.asyncAfter(
      deadline: .now() + delay,
      qos: qos,
      flags: flags,
      execute: execute)
  }
    execute: @escaping () -> Void)
  {
  }

}


// MARK: -

public extension DispatchQueue {

  fileprivate static var onceToken: [String] = []

}
