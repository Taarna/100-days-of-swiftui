import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUpTime = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    private var recommendedSleepTime: String {
        var returnMessage = ""
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUpTime - prediction.actualSleep
            
            returnMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            returnMessage = "Error calculating sleep time"
        }
        
        return returnMessage
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                }
                .font(.callout)
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                .font(.callout)
                
                Section("Daily coffeee intake") {
                    Picker("Daily coffeee intake", selection: $coffeeAmount) {
                        ForEach(1..<11) { numberOfCups in
                            Text("^[\(numberOfCups) cup](inflect: true)")
                        }
                    }
                    .labelsHidden()
                }
                .font(.callout)
                
                Section("Recommended bedtime") {
                    Text("\(recommendedSleepTime)")
                }
                .font(.callout)
            }
            .navigationTitle("BetterRest")
        }
        .fontDesign(.serif)
        
    }
}

#Preview {
    ContentView()
}
