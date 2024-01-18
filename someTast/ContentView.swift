//
//  ContentView.swift
//  someTast
//
//  Created by Server Admin on 18.01.2024.
//

import SwiftUI

struct ContentView: View {
    // Властивості, які відслідковують стан користувача
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false

    var body: some View {
        // Визначаємо логіку для перегляду
        let agreedToAll = Binding<Bool>(
            // Отримання значення: всі умови повинні бути погоджені
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            // Встановлення значення: усі умови стають однаковими
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )

        // Повертаємо представлення, яке включає в себе три перемикачі та один загальний перемикач
        return VStack {
            Toggle("Погоджуюсь з умовами", isOn: $agreedToTerms)
            Toggle("Погоджуюсь з політикою конфіденційності", isOn: $agreedToPrivacyPolicy)
            Toggle("Погоджуюсь отримувати електронні листи", isOn: $agreedToEmails)
            Toggle("Погоджуюсь з усім", isOn: agreedToAll)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
