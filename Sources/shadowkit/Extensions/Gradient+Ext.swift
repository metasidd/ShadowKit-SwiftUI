//
//  Gradient+Ext.swift
//  real-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025/02/18.
//

import SwiftUI

public protocol GradientStyle: ShapeStyle { }

extension LinearGradient: GradientStyle { }
extension AngularGradient: GradientStyle { }
extension RadialGradient: GradientStyle { }
extension EllipticalGradient: GradientStyle { }
