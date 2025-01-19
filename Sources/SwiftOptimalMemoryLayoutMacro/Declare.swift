//
//  main.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics
import Utilities

enum Declare : MemberMacro {
    static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, conformingTo protocols: [TypeSyntax], in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard let arguments = node.arguments?.children(viewMode: .all) else { return [] }
        var variables:[OptimalMemoryLayoutVariable] = []
        var defaultVisibility:VariableVisibility = .internal
        var indentation:String = String(repeating: " ", count: 4)
        for child in arguments {
            if let labeled:LabeledExprSyntax = child.as(LabeledExprSyntax.self) {
                if let label:String = labeled.label?.text {
                    switch label {
                        case "defaultVisibility": defaultVisibility = VariableVisibility(rawValue: labeled.expression.as(MemberAccessExprSyntax.self)!.declName.baseName.text) ?? defaultVisibility
                        default: break
                    }
                } else {
                    if let array = labeled.expression.as(ArrayExprSyntax.self)?.elements {
                        for element in array {
                            if let variable:OptimalMemoryLayoutVariable = parse(element.expression, defaultVisibility: defaultVisibility) {
                                variables.append(variable)
                            }
                        }
                    } else {
                        indentation = String(repeating: " ", count: Int(labeled.expression.as(IntegerLiteralExprSyntax.self)!.literal.text)!)
                    }
                }
            }
        }
        return variables.sorted(by: {
            let one = $0.typeMemoryLayout, two = $1.typeMemoryLayout
            guard one.alignment == two.alignment else { return one.alignment > two.alignment }
            guard one.size == two.size else { return one.size > two.size }
            guard one.stride == two.stride else { return one.stride > two.stride }
            return $0.name < $1.name
        }).map({
            return DeclSyntax(stringLiteral: $0.description(indentation: indentation))
        })
    }
    private static func parse(_ expr: ExprSyntax, defaultVisibility: VariableVisibility) -> OptimalMemoryLayoutVariable? {
        var visibility:VariableVisibility = defaultVisibility
        var mutable:Bool = false
        var name:String = "a"
        var typeAnnotation:String = "Any?"
        var layout:(Int, Int, Int)? = nil
        var documentation:[String] = []
        if let function:FunctionCallExprSyntax = expr.as(FunctionCallExprSyntax.self) {
            if let member:String = function.calledExpression.as(MemberAccessExprSyntax.self)?.declName.baseName.text {
                switch member {
                    case "var":
                        mutable = true
                        fallthrough
                    case "let":
                        fallthrough
                    case "init":
                        for argument in function.arguments {
                            switch argument.label!.text {
                            case "visibility":
                                if let member:String = argument.expression.as(MemberAccessExprSyntax.self)?.declName.baseName.text {
                                    visibility = VariableVisibility(rawValue: member) ?? visibility
                                }
                            case "mutable":
                                mutable = argument.expression.as(BooleanLiteralExprSyntax.self)?.literal.text == "true"
                            case "name":
                                name = argument.expression.as(StringLiteralExprSyntax.self)?.segments.description ?? name
                            case "type":
                                typeAnnotation = argument.expression.as(MemberAccessExprSyntax.self)!.declName.baseName.text
                            case "typeAnnotation":
                                typeAnnotation = argument.expression.as(StringLiteralExprSyntax.self)!.segments.description
                            case "typeMemoryLayout":
                                layout = (0, 0, 0) // TOOD: support
                            case "documentation":
                                documentation = argument.expression.as(ArrayExprSyntax.self)?.elements.compactMap({ $0.expression.as(StringLiteralExprSyntax.self)?.segments.description }) ?? []
                            default:
                                break
                            }
                        }
                    default:
                        break
                }
            }
        }
        if let layout {
            return OptimalMemoryLayoutVariable(visibility: visibility, mutable: mutable, name: name, typeAnnotation: typeAnnotation, typeMemoryLayout: layout, documentation: documentation)
        } else {
            return OptimalMemoryLayoutVariable(visibility: visibility, mutable: mutable, name: name, type: MemoryLayoutable(rawValue: typeAnnotation)!, documentation: documentation)
        }
    }
}