//
//  ImageConstants.swift
//  Math Game
//
    
import Foundation
import SwiftUI

/// A collection of creature image assets used throughout the Math Game.
///
/// Each case corresponds to an image name in the asset catalog. The enum's
/// raw value is the exact asset name, enabling type-safe access to images
/// without hard‑coding strings.
///
/// Example:
/// ```swift
///
/// let angry = UIImage(named: Creature.angry.rawValue)
///
/// ```
enum Creature: String {
    /// Angry creature asset
    case angry = "creature-angry"
    
    /// Crying creature asset
    case cry = "creature-cry"
    
    /// Happy creature asset
    case happy = "creature-happy"
    
    /// Creature listening to music asset
    case listeningMusic = "creature-music"
    
    /// Scared creature asset
    case scared = "creature-scared"
    
    /// Creature with thumbs up asset
    case thumbsUp = "creature-thumbs-up"
}

private struct CreaturePreviewTile: View {
    let creature: Creature
    let label: String
    var body: some View {
        VStack {
            Image(creature.rawValue)
                .resizable()
                .scaledToFit()
            Text(label)
                .monospaced()
        }
    }
}

#Preview {
    Grid {
        GridRow {
            CreaturePreviewTile(creature: .angry, label: "angry")
            CreaturePreviewTile(creature: .cry, label: "cry")
        }
        GridRow {
            CreaturePreviewTile(creature: .happy, label: "happy")
            CreaturePreviewTile(creature: .listeningMusic, label: "listeningMusic")
        }
        GridRow {
            CreaturePreviewTile(creature: .scared, label: "scared")
            CreaturePreviewTile(creature: .thumbsUp, label: "thumbsUp")
        }
    }
}
