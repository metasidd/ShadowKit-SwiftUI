//
//  Gradient+Ext.swift
//  ShadowKit
//
//  Created by Siddhant Mehta on 2025/02/18.
//

import SwiftUI

/// Defines the requirements for gradient styles that can be used with shadow effects.
///
/// This protocol is adopted by SwiftUI's built-in gradient types:
/// - `LinearGradient`
/// - `AngularGradient`
/// - `RadialGradient`
/// - `EllipticalGradient`
public protocol GradientStyle: ShapeStyle { }

extension LinearGradient: GradientStyle { }
extension AngularGradient: GradientStyle { }
extension RadialGradient: GradientStyle { }
extension EllipticalGradient: GradientStyle { }
