//
//  WKScriptMessageHandler.swift
//  
//
//  Created by Jaehong Kang on 2020/01/22.
//  Copyright © 2020 Sinoru. All rights reserved.
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

#if canImport(WebKit)

import WebKit

private class _WKScriptMessageHandlerWrapper<Handler: WKScriptMessageHandler>: NSObject, WKScriptMessageHandler {
    weak var handler: Handler?

    init(_ handler: Handler) {
        self.handler = handler
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        handler?.userContentController(userContentController, didReceive: message)
    }
}

extension WKScriptMessageHandler {
    public var weakScriptMessageHandler: WKScriptMessageHandler {
        return _WKScriptMessageHandlerWrapper(self)
    }
}

#endif
