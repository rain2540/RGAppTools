//
//  CLLocation+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/18.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import CoreLocation

private let TransPI: CLLocationDegrees = .pi * 3000.0 / 180.0

extension RGAppTools where Base: CLLocation {

  /// 百度坐标 ---> 火星坐标
  ///
  /// - Parameter baiduCoordinate: 记录百度坐标经纬度的结构体
  /// - Returns: 记录火星坐标经纬度的结构体
  public static func locationMars(fromBaidu baiduCoordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    let x = baiduCoordinate.longitude - 0.0065;
    let y = baiduCoordinate.latitude - 0.006
    let z = sqrt(x * x + y * y) - 0.00002 * sin(y * TransPI)
    let theta = atan2(y, x) - 0.000003 * cos(x * TransPI)
    let gg_longitude = z * cos(theta)
    let gg_latitude = z * sin(theta)
    return CLLocationCoordinate2DMake(gg_latitude, gg_longitude)
  }

  /// 火星坐标 ---> 百度坐标
  ///
  /// - Parameter marsCoordinate: 记录火星坐标经纬度的结构体
  /// - Returns: 记录百度坐标经纬度的结构体
  public static func locationBaidu(fromMars marsCoordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    let x = marsCoordinate.longitude
    let y = marsCoordinate.latitude
    let z = sqrt(x * x + y * y) + 0.00002 * sin(y * TransPI)
    let theta = atan2(y, x) + 0.000003 * cos(x * TransPI)
    let bd_longitude = z * cos(theta) + 0.0065
    let bd_latitude = z * sin(theta) + 0.006
    return CLLocationCoordinate2DMake(bd_latitude, bd_longitude)
  }

}
