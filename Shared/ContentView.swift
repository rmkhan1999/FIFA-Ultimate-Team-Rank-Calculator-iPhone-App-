import SwiftUI

struct ContentView: View {
    @State private var points: String = ""
    @State private var played: String = ""
    
    private var worstPossibleRank: String {
        getRankText(rank: worstPossible(points: Int(points) ?? 0, remaining: 20 - (Int(played) ?? 0)))
    }
    
    private var bestPossibleRank: String {
        getRankText(rank: bestPossible(points: Int(points) ?? 0, remaining: 20 - (Int(played) ?? 0)))
    }
    
    private var mostAchievableRank: String {
        getRankText(rank: mostAchievable(points: Int(points) ?? 0, remaining: 20 - (Int(played) ?? 0)))
    }
    
    var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("FUT CALC") // Add the title here
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .padding(.bottom)
                    
                    HStack {
                        Text("Points:")
                            .foregroundColor(.yellow)
                        TextField("Enter Points", text: $points)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Played:")
                            .foregroundColor(.yellow)
                        TextField("Enter Played", text: $played)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    
                    Text("Calculated Ranks")
                        .foregroundColor(.yellow)
                        
                    
                    Text("Worst Possible Rank: \(worstPossibleRank)")
                        .foregroundColor(.yellow)
                    Text("Best Possible Rank: \(bestPossibleRank)")
                        .foregroundColor(.yellow)
                    Text("Most Achievable Rank: \(mostAchievableRank)")
                        .foregroundColor(.yellow)
                }
                .padding()
            }
        }

    
    func worstPossible(points: Int, remaining: Int) -> Int {
        return points + remaining
    }

    func bestPossible(points: Int, remaining: Int) -> Int {
        return points + (4 * remaining)
    }

    func mostAchievable(points: Int, remaining: Int) -> Int {
        let wins = Int((Double(remaining) * 0.2).rounded(.down))
        let left = remaining - wins
        return points + left + (wins * 4)
    }
    
    func getRankText(rank: Int) -> String {
        switch rank {
        case 0..<4:
            return "no rank"
        case 4..<12:
            return "Rank X"
        case 12..<23:
            return "Rank IX"
        case 24..<36:
            return "Rank VIII"
        case 36..<45:
            return "Rank VII"
        case 45..<51:
            return "Rank VI"
        case 51..<60:
            return "Rank V"
        case 60..<67:
            return "Rank IV"
        
        case 67..<72:
            return "Rank III"
        case 72..<76:
            return "Rank II"
        default:
            return "Rank I"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
