//
//  ActionDeliveryModule.swift
//  rnliveacitivities
//
//  Created by Luciano Lima Ferreira on 05/05/24.
//

import Foundation
import ActivityKit

@objc(ActionDeliveryModule)
class ActionDeliveryModule: NSObject {
  
  @objc(startActionDelivery)
  func startActionDelivery(){
    do {
      let actionDeliveryAttributes = ActionDeliveryAttributes(name: "You Content Here")
      let actionDeliveryContentState = ActionDeliveryAttributes.ContentState(
        dynamicLeadingLabel: "teste 1", dynamicTrailingLabel: "Teste 2", dynamicBottomLabel: "Teste 3"
      )
      let activity = try Activity<ActionDeliveryAttributes>.request(attributes: actionDeliveryAttributes, contentState: actionDeliveryContentState, pushType: nil)
    } catch (_) {
      print("Module not supported")
    }
  }
  
  @objc(endActionDelivery)
  func endActionDelivery(){
    Task {
      for activity in Activity<ActionDeliveryAttributes>.activities {
        await activity.end()
      }
    }
  }
}
