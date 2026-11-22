import SwiftUI
import AVFAudio

@main
struct ZaptelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var status = "Prêt"
    @State private var isSpeaking = false

    private let audioSession = AVAudioSession.sharedInstance()

    var body: some View {
        VStack(spacing: 25) {
            Text("ZAPTEL")
                .font(.largeTitle)
                .bold()

            Text("Prototype d'injection audio")
                .font(.headline)

            Text(status)
                .foregroundColor(.secondary)

            Button(action: testSpeech) {
                Text("TEST — PARLER")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }

            Button(action: stopSpeech) {
                Text("STOP")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .padding(30)
    }

    func testSpeech() {
        let synthesizer = AVSpeechSynthesizer()

        let utterance = AVSpeechUtterance(
            string: "Bonjour. Ceci est un test du système Zaptel."
        )

        utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
        utterance.rate = 0.48

        status = "Test vocal lancé"
        synthesizer.speak(utterance)

        // Prototype initial : test de synthèse vocale locale.
    }

    func stopSpeech() {
        status = "Arrêt demandé"
    }
}
