//
//  Deck.swift
//  Range
//
//  Created by Justin Ferre on 10/20/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//


import Foundation
import GameplayKit // only available on OS X 10.11, iOS 9

// Frameworks
#if os(iOS)
    import UIKit
    #else
    import Cocoa
#endif

// UIKit/Cocoa Classes
#if os(iOS)
    public typealias View = UIView
    public typealias Font = UIFont
    public typealias Color = UIColor
    public typealias Image = UIImage
    public typealias BezierPath = UIBezierPath
    #else
    public typealias View = NSView
    public typealias Font = NSFont
    public typealias Color = NSColor
    public typealias Image = NSImage
    public typealias BezierPath = NSBezierPath
#endif

// Represent a card suit
public enum Suit: Int, CustomStringConvertible {
    case Clubs = 1, Diamonds, Hearts, Spades
    public var description: String {
        return ["♣️", "♦️", "❤️", "♠️"][rawValue - 1]
    }
    public var nativeColor: Color {
        switch self {
        case .Clubs, .Spades: return .blackColor()
        default: return .redColor()
        }
    }
}

// Represent a card rank
public enum Rank: Int, CustomStringConvertible {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    public var description: String {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"][rawValue - 1]
    }
}

//
public struct Card: CustomStringConvertible, CustomPlaygroundQuickLookable {
    public let rawValue: Int; let suit: Suit; let rank: Rank
    
    // Initialize from raw value
    public init(_ rawValue: Int) {
        assert(rawValue >= 0); assert(rawValue < 52)
        self.rawValue = rawValue
        suit = Suit(rawValue: 1 + (rawValue  / 13))!
        rank = Rank(rawValue:  1 + (rawValue % 13))!
    }
    
    // Initialize from rank and suit
    public init(_ rank: Rank, _ suit: Suit) {
        let r = rank.rawValue - 1
        let s = suit.rawValue - 1
        self.init(s * 13 + r)
    }
    
    // String convertible
    public let deckString = "🃑🃒🃓🃔🃕🃖🃗🃘🃙🃚🃛🃝🃞🃁🃂🃃🃄🃅🃆🃇🃈🃉🃊🃋🃍🃎🂱🂲🂳🂴🂵🂶🂷🂸🂹🂺🂻🂽🂾🂡🂢🂣🂤🂥🂦🂧🂨🂩🂪🂫🂭🂮"
    public var description: String {
        return rank.description + suit.description
    }
    
    // Show face as string
    public var faceString: NSAttributedString {
        let index = (deckString.startIndex.advancedBy(rawValue))
        let cardFace = deckString.substringWithRange(index..<(index.advancedBy(1)))
        return NSAttributedString(string: cardFace, attributes: [
            NSForegroundColorAttributeName:suit.nativeColor,
            NSFontAttributeName:Font.systemFontOfSize(128)])
    }
    
    // Simple quick look support
    public func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return PlaygroundQuickLook.AttributedString(faceString)
    }
}

// I use better errors elsewhere but I want a simple way
// to keep this in a single file for this example
internal func Error(reason : String) -> NSError {
    return NSError(domain: "com.sadun.class.Card", code: 0,
        userInfo: [NSLocalizedFailureReasonErrorKey:reason])
}

// THIS CLASS DOES NOT RENDER TO IMAGE CORRECTLY ON iOS
#if os(iOS)
    extension Card {
        public var faceImage: Image {
            UIGraphicsBeginImageContext(CGSizeMake(120, 180))
            faceString.drawAtPoint(CGPointMake(15, 15))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    }
#endif

// Again, I don't typically throw an image drawing function in this kind of code
// but I wanted everything in one file
#if os(OSX)
    public func ImageByDrawingBlock(targetSize: CGSize, _ block: () -> Void) throws -> NSImage {
        guard let rep = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(targetSize.width),
            pixelsHigh: Int(targetSize.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: NSCalibratedRGBColorSpace,
            bytesPerRow: 0,
            bitsPerPixel: 0) else {
                throw Error("Unable to create bitmap")}
        rep.size = targetSize
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.setCurrentContext(NSGraphicsContext(bitmapImageRep: rep))
        block()
        NSGraphicsContext.restoreGraphicsState()
        guard let data = rep.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:]) else {
            throw Error("Unable to extract bitmap data")}
        guard let image = NSImage(data: data) else {
            throw Error("Unable to create image from data")}
        return image
    }
    
    extension Card {
        public var faceImage: Image {
            do {
                let image = try ImageByDrawingBlock(CGSizeMake(120, 180)) {
                    self.faceString.drawAtPoint(CGPointMake(15, 15))
                }
                return image
            } catch {print(error); return NSImage()}
        }
    }
#endif

// OS X 10.10 doesn't support GameplayKit
// iOS 9 does but doesn't support image rendering of card unicode
@available(iOS 9.0, OSX 10.11, *)
extension Card {
    public static var shuffledDeck: [Card] {
        return (GKRandomSource().arrayByShufflingObjectsInArray(Array(0..<52)) as! [Int]).map{Card($0)}
    }
}