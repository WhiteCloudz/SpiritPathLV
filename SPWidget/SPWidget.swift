//
//  SPWidget.swift
//  SPWidget
//
//  Created by Fatih Akbulut on 1/22/24.
import WidgetKit
import SwiftUI
import CoreData

var zikirGoalValue: Int = 0
var zikirNowValue: Int = 0
var prayerGoalValue: Int = 0
var prayerNowValue: Int = 0
var readingGoalValue: Int = 0
var readingNowValue: Int = 0

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateNow = dateFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()

        
        zikirGoalValue = 0
        zikirNowValue = 0
        prayerGoalValue = 0
        prayerNowValue = 0
        readingGoalValue = 0
        readingNowValue = 0
        
        do {
            let routines = try coreDataManager.context.fetch(fetchRequest)
            
            for routine in routines {
                guard let goal = routine.goal,
                      let category = routine.category,
                      let date = routine.date,
                      let today = routine.today
                else {
                    continue
                }
                
                if let routineGoal = Int(goal), let routineToday = Int(today) {
                    switch category {
                    case "Zikir", "Dhikr":
                        zikirGoalValue += routineGoal
                        if date == dateNow {
                            zikirNowValue += routineToday
                        }else {
                            zikirNowValue = 0
                        }
                    case "Reading", "Okuma":
                        readingGoalValue += routineGoal
                        if date == dateNow {
                            readingNowValue += routineToday
                        }else {
                            readingNowValue = 0
                        }
                    case "Prayer", "Namaz":
                        prayerGoalValue += routineGoal
                        if date == dateNow {
                            prayerNowValue += routineToday
                        }else {
                            prayerNowValue = 0
                        }
                    default:
                        break
                    }
                }
            }
            
            for secondOffset in 0 ..< 5 {
                let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset * 5, to: currentDate)!
                let entry = SimpleEntry(
                    date: entryDate,
                    configuration: ConfigurationAppIntent(),
                    zikirGoalValue: zikirGoalValue,
                    zikirNowValue: zikirNowValue,
                    prayerGoalValue: prayerGoalValue,
                    prayerNowValue: prayerNowValue,
                    readingGoalValue: readingGoalValue,
                    readingNowValue: readingNowValue
                )
                
                entries.append(entry)
            }
        } catch {
           
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("WidgetDataChanged"), object: nil)
        let timeline = Timeline(entries: entries, policy: .after(Date().addingTimeInterval(1)))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var configuration: ConfigurationAppIntent
    var zikirGoalValue: Int = 0
    var zikirNowValue: Int = 0
    var prayerGoalValue: Int = 0
    var prayerNowValue: Int = 0
    var readingGoalValue: Int = 0
    var readingNowValue: Int = 0
}

struct SPWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry
    
    var body: some View {
        SmallWidgetContent(entry: entry)
    }
}


private struct SmallWidgetContent: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
              

            VStack {
                
                
                HStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .cornerRadius(15)

                    Text("Daily Routine")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
                .padding(-5)

                let totalGoalValue = Double(entry.zikirGoalValue + entry.prayerGoalValue + entry.readingGoalValue)
                let totalNowValue = Double(entry.zikirNowValue + entry.prayerNowValue + entry.readingNowValue)
                CircularProgressBar(goalValue: totalGoalValue, nowValue: totalNowValue, goalColor: .clear, nowColor: .white)
                    .frame(width: 120, height: 120)
                    .padding(-5)
            }
            .frame(maxWidth: .infinity, alignment: .bottom) 
        }
        .padding(-60)
    }
}


struct  SPWidget: Widget {
    let kind: String = "SPWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            VStack {
                SPWidgetEntryView(entry: entry)
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("WidgetDataChanged"), object: nil, queue: .main) { _ in
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}



struct ChartView: View {
    var label: String
    var color: Color
    var goalValues: [Int]

    var body: some View {
        VStack {
            LineChartView(label: label, color: color, goalValues: goalValues)
        }
    }
}



struct LineChartView: View {
    var label: String
    var color: Color
    var goalValues: [Int]

    var body: some View {
        VStack {
            GeometryReader { geometry in
                Path { path in
                    let height = geometry.size.height
                    let width = geometry.size.width
                    let step = width / CGFloat(goalValues.count - 1)

                    for (index, value) in goalValues.enumerated() {
                        let x = step * CGFloat(index)
                        let y = height - height * CGFloat(value)
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                .fill(color)
            }
            .frame(width: 300, height: 200)
        }
        .overlay(
            Text(label)
                .foregroundColor(.white)
                .padding(4)
                .background(color)
                .offset(y: 10)
        )
    }
}


struct CircularProgressBar: View {
    var goalValue: Double
    var nowValue: Double
    var goalColor: Color
    var nowColor: Color

    init(goalValue: Double, nowValue: Double, goalColor: Color, nowColor: Color) {
        self.goalValue = goalValue
        self.nowValue = nowValue
        self.goalColor = goalColor
        self.nowColor = nowColor
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
              
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(self.goalColor, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .rotationEffect(Angle(degrees: -90))

                    if self.goalValue != 0 {
                        Circle()
                            .trim(from: 0, to: CGFloat(min(self.nowValue / self.goalValue, 1.0)))
                            .stroke(self.nowColor, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                            .rotationEffect(Angle(degrees: -90))

                        Text("\(Int(min(self.nowValue / self.goalValue, 1.0) * 100))%")
                            .foregroundColor(self.nowColor)
                            .font(.system(size: 18))
                    }
                }
                .padding(20)
            }
        }
    }

}
