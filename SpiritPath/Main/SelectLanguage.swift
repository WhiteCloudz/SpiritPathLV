//
//  SelectLanguage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 12/14/23.
//
import Foundation
import UIKit

enum Language: String {
    case english = "en"
    case turkish = "tr"
    
    var displayName: String {
        switch self {
        case .english:
            return "English"
        case .turkish:
            return "Turkish"
        }
    }
}

struct LanguageManager {
    static func saveSelectedLanguage(language: Language) {
        UserDefaults.standard.set(language.rawValue, forKey: "selectedLanguage")
    }

    static func getSelectedLanguage() -> Language {
        if let selectedLanguageString = UserDefaults.standard.string(forKey: "selectedLanguage"), let selectedLanguage = Language(rawValue: selectedLanguageString) {
            return selectedLanguage
        } else {
            return .english // Default language
        }
    }
    
    static var currentLanguageDisplayName: String {
        return getSelectedLanguage().displayName
    }
    
    static var currentLanguage: Language {
        return getSelectedLanguage()
    }
    
    static func availableLanguages() -> [Language] {
        return [.english, .turkish]
    }
}
