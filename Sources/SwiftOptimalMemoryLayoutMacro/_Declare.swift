//
//  _Declare.swift
//
//
//  Created by Evan Anderson on 1/19/25.
//

import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics
import Utilities

enum _Declare : MemberMacro {
    static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, conformingTo protocols: [TypeSyntax], in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        return []
    }
}