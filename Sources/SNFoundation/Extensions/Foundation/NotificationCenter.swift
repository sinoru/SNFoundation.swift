//
//  NotificationCenter.swift
//  
//
//  Created by Jaehong Kang on 2019/11/16.
//  Copyright © 2019 Sinoru. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

extension NotificationCenter {
    open class Observation: NSObject {
        private(set) internal weak var notificationCenter: NotificationCenter?
        private(set) internal var name: NSNotification.Name?
        private(set) internal weak var object: AnyObject?
        private(set) internal var observer: NSObjectProtocol

        internal init(notificationCenter: NotificationCenter, name: NSNotification.Name?, object: AnyObject?, observer: NSObjectProtocol) {
            self.notificationCenter = notificationCenter
            self.name = name
            self.object = object
            self.observer = observer
        }

        deinit {
            self.invalidate()
        }

        public func invalidate() {
            self.notificationCenter?.removeObserver(self.observer, name: self.name, object: self.object)
        }
    }

    open func observe(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) -> Observation {
        return Observation(
            notificationCenter: self,
            name: name,
            object: obj as AnyObject?,
            observer: self.addObserver(forName: name, object: obj, queue: queue, using: block)
        )
    }
}
