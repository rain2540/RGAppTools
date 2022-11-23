//
//  CLLocation+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/18.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import CoreLocation

private let PI: CLLocationDegrees = .pi
private let TransPI: CLLocationDegrees = .pi * 3000.0 / 180.0
/// 长半轴
private let SemimajorAxis: Double = 6378245.0
private let ee: Double = 0.00669342162296594323

extension RGAppTools where Base: CLLocation {

  /**
   * WGS-84 坐标系 - 地球坐标系，国际通用坐标系
   * GCJ-02 坐标系 - 火星坐标系，WGS-84 坐标系加密后的坐标系；Google 国内地图、高德、QQ地图 使用
   * BD-09 坐标系 - 百度坐标系，GCJ-02 坐标系加密后的坐标系；百度地图使用
   */

  /// WGS-84 ---> GCJ-02
  /// - Parameter wgsCoordinate: 记录 WGS-84 坐标经纬度的结构体
  /// - Returns: 记录 GCJ-02 坐标经纬度的结构体
  public static func locationGCJ(fromWGS wgsCoordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    let deltaLongitude00 = wgsCoordinate.longitude - 105.0
    let deltaLatitude00 = wgsCoordinate.latitude - 35.0

    let deltaLongitude01 = deltaLongitude4WGS2GCJBy(deltaLon: deltaLongitude00, deltaLat: deltaLatitude00)
    let deltaLatotude01 = deltaLatitude4WGS2GCJBy(deltaLon: deltaLongitude00, deltaLat: deltaLatitude00)

    let B_WGS = wgsCoordinate.latitude * PI / 180.0
    let sinRad = sin(B_WGS)
    let powW = 1 - ee * sinRad * sinRad
    let factorW = sqrt(powW)
    let factorN = factorN(by: factorW)

    let deltaLongitude02 = (deltaLongitude01 * 180.0) / (PI * factorN * cos(B_WGS))
    let deltaLatitude02 = (180.0 * deltaLatotude01 * powW) / (PI * factorN * (1 - ee))

    let coordinate = CLLocationCoordinate2D(
      latitude: wgsCoordinate.latitude + deltaLatitude02,
      longitude: wgsCoordinate.longitude + deltaLongitude02)
    return coordinate
  }

  /// 经度变换
  /// - 用于 WGS-84 ---> GCJ-02
  private static func deltaLongitude4WGS2GCJBy(
    deltaLon: CLLocationDegrees,
    deltaLat: CLLocationDegrees) -> CLLocationDegrees
  {
    var lon = 300.0 + deltaLon + 2.0 * deltaLat + 0.1 * deltaLon * deltaLon + 0.1 * deltaLon * deltaLat
    lon +=  0.1 * sqrt(fabs(deltaLon))
    lon += (20.0 * sin(6.0 * deltaLon * PI)) * 2.0 / 3.0
    lon += (20.0 * sin(2.0 * deltaLon * PI)) * 2.0 / 3.0
    lon += (20.0 * sin(deltaLon * PI)) * 2.0 / 3.0
    lon += (40.0 * sin(deltaLon / 3.0 * PI)) * 2.0 / 3.0
    lon += (150.0 * sin(deltaLon / 12.0 * PI)) * 2.0 / 3.0
    lon += (300.0 * sin(deltaLon / 30.0 * PI)) * 2.0 / 3.0
    return lon
  }

  /// 纬度变换
  /// - 用于 WGS-84 ---> GCJ-02
  private static func deltaLatitude4WGS2GCJBy(
    deltaLon: CLLocationDegrees,
    deltaLat: CLLocationDegrees) -> CLLocationDegrees
  {
    var lat = -100.0 + 2.0 * deltaLon + 3.0 * deltaLat + 0.2 * deltaLat * deltaLat + 0.1 * deltaLon * deltaLat
    lat += 0.2 * sqrt(fabs(deltaLon))
    lat += (20.0 * sin(6.0 * deltaLon * PI)) * 2.0 / 3.0
    lat += (20.0 * sin(2.0 * deltaLon * PI)) * 2.0 / 3.0
    lat += (20.0 * sin(deltaLat * PI)) * 2.0 / 3.0
    lat += (40.0 * sin(deltaLat / 3.0 * PI)) * 2.0 / 3.0
    lat += (160.0 * sin(deltaLat / 12.0 * PI)) * 2.0 / 3.0
    lat += (320.0 * sin(deltaLat * PI / 30.0)) * 2.0 / 3.0
    return lat
  }

  /// 参与 WGS-84 ---> GCJ-02 计算的 N 因子
  /// - Parameter factorW: 参与 WGS-84 ---> GCJ-02 计算的 W 因子
  /// - Returns: N 因子的值
  private static func factorN(by factorW: Double) -> Double {
    let res = SemimajorAxis / factorW
    return res
  }

  /// 百度坐标 ---> 火星坐标
  /// - BD-09 ---> GCJ-02
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
  /// - GCJ-02 ---> BD-09
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
