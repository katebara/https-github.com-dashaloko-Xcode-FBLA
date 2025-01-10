//
//  EntryInputViewViewModel.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

class EntryInputViewViewModel: ObservableObject {
    @Published var description: String = ""
        @Published var amount: String = ""
        @Published var date: Date = Date()
        @Published var showingEntryInputView: Bool = false
        @Published var showAlert: Bool = false
        @Published var alertMessage: String = ""
        @Published var entries: [Entry] = []  // List of entries

    init() {
        loadEntries() // Load entries when the ViewModel initializes
    }

    
    // Save a new entry to the file
    func save() {
        guard canSave else { return }

        // Create a new entry
        let newEntry = Entry(
            description: description,
            date: date,
            amount: Double(amount.trimmingCharacters(in: .whitespaces))!
        )

        // Append the new entry
        entries.append(newEntry)

        // Save entries to persistent storage
        let path = URL.documentsDirectory.appendingPathComponent("entries.json")
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: path)
            print("✅ Entry saved successfully!")
        } catch {
            print("😡 ERROR: Could not save entry \(error.localizedDescription)")
        }
    }
    

    // Load entries from persistent storage
    func loadEntries() {
        let path = URL.documentsDirectory.appendingPathComponent("entries.json")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            entries = try JSONDecoder().decode([Entry].self, from: data)
            print("✅ Entries loaded successfully from DataFile.txt!")
        } catch {
            print("😡 ERROR: Could not load entries \(error.localizedDescription)")
        }
    }
    
    

    // Delete an entry
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets) // Remove from in-memory entries

        // Save the updated entries to persistent storage
        let path = URL.documentsDirectory.appendingPathComponent("entries.json")
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: path)
            print("✅ Entry deleted and file updated successfully!")
        } catch {
            print("😡 ERROR: Could not save entries after deletion \(error.localizedDescription)")
        }
    }


    // Debug the contents of the file
    func debugFileContents() {
        let path = URL.documentsDirectory.appendingPathComponent("entries.json")
        do {
            let content = try String(contentsOf: path, encoding: .utf8)
            print("DataFile.txt Contents:\n\(content)")
        } catch {
            print("Failed to read file: \(error.localizedDescription)")
        }
    }

    // Validation logic for saving
    var canSave: Bool {
        // Validate description
        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMessage = "Please enter a description."
            return false
        }

        // Validate date
        guard date <= Date() else {
            alertMessage = "Please select a date that is today or earlier."
            return false
        }

        // Validate amount
        guard let value = Double(amount.trimmingCharacters(in: .whitespaces)), value > 0 else {
            alertMessage = "Please enter a valid amount greater than zero."
            return false
        }

        return true
    }
}

